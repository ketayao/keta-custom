package com.ketayao.ketacustom.controller.system;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ketayao.ketacustom.log.Log;
import com.ketayao.ketacustom.log.LogMessageObject;
import com.ketayao.ketacustom.log.impl.LogUitls;
import com.ketayao.ketacustom.util.dwz.AjaxObject;
import com.ketayao.ketacustom.util.dwz.Page;
import com.ketayao.utils.Exceptions;
import com.ketayao.utils.FileUtils;

/**
 * 
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * @since   2014年1月6日 下午4:24:19
 */
@Controller
@RequestMapping("/management/system/icon")
public class IconController {
	
	private static final Logger LOG = LoggerFactory.getLogger(IconController.class); 
	
	private static final String LIST = "management/system/icon/list";
	private static final String UPLOAD = "management/system/icon/upload";
	
	private static final String IMG_PATH = "/styles/dwz/themes/css/images/toolbar_icons16";
	private static final int IMG_SIZE = 1024;
	
	private static List<String> ALL_ICONS = null;
	
	@RequiresPermissions("Icon:view")
	@RequestMapping(value="/list", method={RequestMethod.GET, RequestMethod.POST})
	public String list(HttpServletRequest request, Page page, Map<String, Object> map) {
		if (ALL_ICONS == null) {
			String webPath = request.getSession().getServletContext().getRealPath("/");
			String imgPath = webPath + IMG_PATH;
			
			File dir = new File(imgPath);
			File[] files = dir.listFiles();
			
			ALL_ICONS = new ArrayList<String>();
			for (File file : files) {
				ALL_ICONS.add(FileUtils.getRealName(file.getName()));
			}
		}
		
		page.setTotalCount(ALL_ICONS.size());
		int start = (page.getPageNum() - 1) * page.getNumPerPage();
		List<String> icons = new ArrayList<String>(page.getNumPerPage());
		for (int index = start; (index < start + page.getNumPerPage()) && (index < ALL_ICONS.size()); index++) {
			String file = ALL_ICONS.get(index);
			icons.add(file);
		}
		
		map.put("icons", icons);
		map.put("page", page);
		return LIST;
	}
	
	@RequiresPermissions("Icon:upload")
	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public String preUpload() {
		return UPLOAD;
	}
	
	@Log(message="上传了{0}的图标。")
	@RequiresPermissions("Icon:upload")
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public ResponseEntity<String> upload(HttpServletRequest request, @RequestParam MultipartFile[] files) {
		String uploadPath = getFileStorePath(request);
		for (MultipartFile file : files) {
			String fileExt = FileUtils.getFileExt(file.getOriginalFilename());
			if (!fileExt.equalsIgnoreCase("png")) {
				return new ResponseEntity<String>("只允许上传png的图标！", HttpStatus.INTERNAL_SERVER_ERROR);
			}
			
			if(file.getSize() > IMG_SIZE) {
				return new ResponseEntity<String>("只允许上传1KB以内的图标！", HttpStatus.INTERNAL_SERVER_ERROR);
			}
			
			File uploadedFile = new File(uploadPath, file.getOriginalFilename());
			if (uploadedFile.exists()) {
				return new ResponseEntity<String>(file.getOriginalFilename() + "的图标已经存在！", HttpStatus.INTERNAL_SERVER_ERROR);
			}
			
			try {
				org.apache.commons.io.FileUtils.writeByteArrayToFile(uploadedFile, file.getBytes());
				LogUitls.putArgs(LogMessageObject.newWrite().setObjects(new Object[]{file.getOriginalFilename()}));
			} catch (Exception e) {
				LOG.error(Exceptions.getStackTraceAsString(e));
				return new ResponseEntity<String>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
			}			
		}
		
		ALL_ICONS = null;
		return new ResponseEntity<String>(HttpStatus.OK);
	}
	
	@Log(message="删除了{0}图标。")
	@RequiresPermissions("Icon:delete")
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public @ResponseBody String delete(HttpServletRequest request, String name) {
		File img = new File(getFileStorePath(request), name + ".png");
		org.apache.commons.io.FileUtils.deleteQuietly(img);
		
		LogUitls.putArgs(LogMessageObject.newWrite().setObjects(new Object[]{name}));
		return AjaxObject.newOk("删除图标成功！").toString();
	}
	
	@RequiresPermissions("Icon:view")
	@RequestMapping(value="/reload", method={RequestMethod.GET, RequestMethod.POST})
	public String reload(HttpServletRequest request, Map<String, Object> map) {
		ALL_ICONS = null;
		return list(request, new Page(), map);
	}
	
	private String getFileStorePath(HttpServletRequest request) {
		return request.getSession().getServletContext().getRealPath("/") + IMG_PATH;
	}
}