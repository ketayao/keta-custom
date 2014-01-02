/**
 * <pre>
 * Copyright:		Copyright(C) 2011-2012, ketayao.com
 * Filename:		com.ketayao.ketacustom.controller.component.ResourceController.java
 * Class:			ResourceController
 * Date:			2013-6-28
 * Author:			<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version          3.1.0
 * Description:		
 *
 * </pre>
 **/
 
package com.ketayao.ketacustom.controller.component;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ketayao.ketacustom.entity.component.Resource;
import com.ketayao.ketacustom.entity.component.StoreType;
import com.ketayao.ketacustom.log.Log;
import com.ketayao.ketacustom.log.LogMessageObject;
import com.ketayao.ketacustom.log.impl.LogUitls;
import com.ketayao.ketacustom.service.component.ResourceService;
import com.ketayao.ketacustom.util.dwz.AjaxObject;
import com.ketayao.ketacustom.util.dwz.Page;
import com.ketayao.ketacustom.util.persistence.DynamicSpecifications;
import com.ketayao.utils.Exceptions;
import com.ketayao.utils.FileUtils;
import com.ketayao.utils.Identities;
import com.ketayao.utils.ServletUtils;

/** 
 * 	
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version  3.1.0
 * @since   2013-6-28 上午11:40:34 
 */
@Controller
@RequestMapping("/management/component/resource")
public class ResourceController {
	private static final Logger LOG = LoggerFactory.getLogger(ResourceController.class); 
	
	private static final String STORE_DIR = "/upload";
	
	@Autowired
	private ResourceService resourceService;
	
	private static final String LIST = "management/component/resource/list";
	private static final String UPLOAD = "management/component/resource/upload";
	private static final String UPDATE = "management/component/resource/update";
	
	@InitBinder
	protected void initBinder(HttpServletRequest request, 
	                ServletRequestDataBinder binder) throws Exception {
         binder.registerCustomEditor(StoreType.class, new StoreTypeEditor()); 
	}
	
	@RequiresPermissions("Resource:view")
	@RequestMapping(value="/list", method={RequestMethod.GET, RequestMethod.POST})
	public String list(ServletRequest request, Page page, Map<String, Object> map) {
		Specification<Resource> specification = DynamicSpecifications.bySearchFilter(request, Resource.class);
		List<Resource> resources = resourceService.findByExample(specification, page);
		
		map.put("page", page);
		map.put("resources", resources);

		return LIST;
	}
	
	@RequiresPermissions("Resource:upload")
	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public String preUpload(StoreType storeType, Map<String, Object> map) {
		map.put("storeType", storeType.value());
		return UPLOAD;
	}

	@Log(message="上传了{0}。")
	@RequiresPermissions("Resource:upload")
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public ResponseEntity<String> upload(HttpServletRequest request, 
			StoreType storeType, @RequestParam MultipartFile[] files) {
		for (MultipartFile file : files) {
			switch (storeType) {
				case FILE:
					String uploadPath = getFileStorePath(request);
					return upload2File(file, uploadPath);
				case DB:
					return upload2Db(file);
				default:
					return new ResponseEntity<String>("上传文件错误。", HttpStatus.INTERNAL_SERVER_ERROR);
			}
		}
		
		return new ResponseEntity<String>(HttpStatus.OK);
	}
	
	private ResponseEntity<String> upload2File(MultipartFile file, String uploadPath) {
		// 检查扩展名
		String fileName = file.getOriginalFilename();
		String fileExt = FileUtils.getFileExt(fileName);
		
		String uuid = Identities.uuid2();
		String newFileName = uuid + "." + fileExt;
		
		File uploadedFile = new File(uploadPath, newFileName);
		try {
			org.apache.commons.io.FileUtils.writeByteArrayToFile(uploadedFile, file.getBytes());
			
			Resource resource = new Resource();
			resource.setName(file.getOriginalFilename());
			resource.setSize(FileUtils.getHumanReadableFileSize(file.getSize()));
			resource.setUploadTime(new Date());
			resource.setUuid(uuid);
			resource.setStoreType(StoreType.FILE);
			
			resourceService.saveOrUpdate(resource);
			LogUitls.putArgs(LogMessageObject.newWrite().setObjects(new Object[]{resource.getName()}));
		} catch (Exception e) {
			if (uploadedFile.exists()) {
				uploadedFile.delete();
			}
			LOG.error(Exceptions.getStackTraceAsString(e));
			return new ResponseEntity<String>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<String>(HttpStatus.OK);
	}
	
	private ResponseEntity<String> upload2Db(MultipartFile file) {
		Resource resource = new Resource();
		resource.setName(file.getOriginalFilename());
		resource.setSize(FileUtils.getHumanReadableFileSize(file.getSize()));
		resource.setUploadTime(new Date());
		resource.setUuid(Identities.uuid2());
		resource.setStoreType(StoreType.DB);
		
		try {
			resource.setFile(file.getBytes());
			resourceService.saveOrUpdate(resource);
			
			LogUitls.putArgs(LogMessageObject.newWrite().setObjects(new Object[]{resource.getName()}));
		} catch (Exception e) {
			LOG.error(Exceptions.getStackTraceAsString(e));
			return new ResponseEntity<String>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<String>(HttpStatus.OK);
	}
	
	@RequiresPermissions("Resource:download")
	@RequestMapping(value = "/download/{storeType}/{uuid}", method = RequestMethod.GET)
	public @ResponseBody String download(HttpServletRequest request, HttpServletResponse response, 
			@PathVariable StoreType storeType, @PathVariable String uuid) {
		Resource resource = resourceService.getByUuid(uuid);
		if (resource == null) {
			return "找不到" + uuid + "文件或已被删除。";
		}
	
		switch (storeType) {
			case FILE:
				String downloadPath = getFileStorePath(request);
				return downloadFromFile(request, response, resource, downloadPath);
			case DB:
				return downloadFromDb(request, response, resource);
			default:
				return "下载文件错误。";
		}
		
	}
	
	private String downloadFromFile(HttpServletRequest request, HttpServletResponse response, Resource resource, String downloadPath) {
		String filePath = downloadPath + File.separator + resource.getRealStoreName();
		
		InputStream input = null;
		try {
			input = new FileInputStream(filePath);
		} catch (FileNotFoundException e) {
			LOG.error(resource.getName() + "文件没找到或已被删除：" + Exceptions.getStackTraceAsString(e));
			return resource.getName() + "文件没找到或已被删除。";
		}
		
		ServletUtils.setFileDownloadHeader(request, response, resource.getName());
		
		try {
			IOUtils.copy(input, response.getOutputStream());
		} catch (Exception e) {
			LOG.error(resource.getName() + "文件下载出错：" + Exceptions.getStackTraceAsString(e));
			return resource.getName() + "文件下载出错。";
		} finally {
			IOUtils.closeQuietly(input);
		}
		
		return null;
	}
	
	private String downloadFromDb(HttpServletRequest request, HttpServletResponse response, Resource resource) {
		InputStream input = new ByteArrayInputStream(resource.getFile());
		ServletUtils.setFileDownloadHeader(request, response, resource.getName());
		
		try {
			IOUtils.copy(input, response.getOutputStream());
		} catch (Exception e) {
			LOG.error(resource.getName() + "文件下载出错：" + Exceptions.getStackTraceAsString(e));
			return resource.getName() + "文件下载出错。";
		} finally {
			IOUtils.closeQuietly(input);
		}
		
		return null;
	}
	
	@Log(message="删除了{0}条资源。")
	@RequiresPermissions("Resource:delete")
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public @ResponseBody String deleteMany(Long[] ids, HttpServletRequest request) {
		AjaxObject ajaxObject = new AjaxObject("删除资源成功！");
		for (Long id : ids) {
			Resource resource = resourceService.get(id);
			if (resource.getStoreType().equals(StoreType.FILE)) {
				String storePath = getFileStorePath(request);
				String filePath = storePath + File.separator + resource.getRealStoreName();
				File file = new File(filePath);
				if (file.exists()) {
					try {
						org.apache.commons.io.FileUtils.forceDelete(file);
					} catch (IOException e) {
						//LOG.error("强制删除文件：" + resource.getName() + "失败。");
						return AjaxObject.newError(resource.getName() + "文件删除失败，请稍后再试。")
								.setCallbackType("").toString();
					}
				}
			}
			
			resourceService.delete(id);
		}
		
		LogUitls.putArgs(LogMessageObject.newWrite().setObjects(new Object[]{ids.length}));
		ajaxObject.setCallbackType("");
		return ajaxObject.toString();
	}
	
	@RequiresPermissions("Resource:edit")
	@RequestMapping(value="/update/{id}", method=RequestMethod.GET)
	public String preUpdate(@PathVariable Long id, Map<String, Object> map) {
		Resource resource = resourceService.get(id);
		
		map.put("resource", resource);
		map.put("name", resource.getOnlyName());
		return UPDATE;
	}
	
	@Log(message="{0}修改成了{1}。")
	@RequiresPermissions("Resource:edit")
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public @ResponseBody String update(Resource resource) {
		Resource oldResource = resourceService.get(resource.getId());
		String oldName = oldResource.getName();
		// 不能修改文件类型
		oldResource.setName(resource.getName() + "." + FileUtils.getFileExt(oldName));
		
		resourceService.saveOrUpdate(oldResource);
		LogUitls.putArgs(LogMessageObject.newWrite().setObjects(new Object[]{oldName, oldResource.getName()}));
		return AjaxObject.newOk("修改资源成功！").toString();
	}
	
	private String getFileStorePath(HttpServletRequest request) {
		return request.getSession().getServletContext().getRealPath("/") + STORE_DIR;
	}
	
}
