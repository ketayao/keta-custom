package com.ketayao.ketacustom.generate;

import java.util.List;

import com.ketayao.ketacustom.generate.util.FileType;
import com.ketayao.ketacustom.generate.util.FileUtils;
import com.ketayao.ketacustom.generate.util.FreeMarkers;
import com.ketayao.ketacustom.generate.util.Resources;
import com.ketayao.ketacustom.generate.vo.Column;
import com.ketayao.ketacustom.generate.vo.Table;

import freemarker.template.Template;


/** 
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * @since   2013年10月23日 下午3:02:33 
 */
public class GenerateCode extends AbstractGenerate implements Generate {
	FileType fileType = null;

	public GenerateCode(FileType javaFileType) {
		super();
		this.fileType = javaFileType;
	}

	/* (non-Javadoc)
	 * @see com.ketayao.ketacustom.generate.Generate#generate(com.ketayao.ketacustom.generate.vo.Table)
	 */
	@Override
	public void generate(Table table) throws Exception {
		model.put("tableName", table.getTableName().toLowerCase());
		model.put("columns", table.getColumns());
		
		// 特殊类型处理
		handleSpecial(table.getColumns());

		Template template = cfg.getTemplate("code" + separator + fileType.getTemplate());
		String content = FreeMarkers.renderTemplate(template, model);
		// 生成java
		if (fileType.getFileNameExtension().endsWith(".java")) {
			String filePath = javaPath + fileType.getJavaStorePath() + separator + Resources.TPL_CLASS_NAME + fileType.getFileNameExtension();
			FileUtils.writeFile(content, filePath);
			
			logger.info(fileType.getType() + ": {}", filePath);
			
		//生成jsp
		} else if (fileType.getFileNameExtension().endsWith(".jsp")) {
			String filePath = viewPath + Resources.TPL_REQUEST_MAPPING + separator + fileType.getFileNameExtension();
			FileUtils.writeFile(content, filePath);
			
			logger.info(fileType.getType() + ": {}", filePath);
		}
	}

	/* (non-Javadoc)
	 * @see com.ketayao.ketacustom.generate.Generate#generate(java.util.List)
	 */
	@Override
	public void generate(List<Table> tables) throws Exception {
		// TODO Auto-generated method stub
	}

	/**
	 * 特殊类型处理
	 * @param columns
	 */
	private void handleSpecial(List<Column> columns) {
		boolean hasDate = false;
		boolean hasBigDecimal = false; 
		for (Column column : columns) {
			if (column.getJavaType().equals("Date")) {
				hasDate = true;
			} else if (column.getJavaType().equals("BigDecimal")) {
				hasBigDecimal = true;
			}
		}
		
		model.put("hasDate", hasDate);
		model.put("hasBigDecimal", hasBigDecimal);
	}
}
