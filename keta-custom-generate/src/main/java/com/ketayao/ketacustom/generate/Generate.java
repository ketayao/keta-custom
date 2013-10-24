package com.ketayao.ketacustom.generate;

import java.util.List;

import com.ketayao.ketacustom.generate.vo.Table;

/**
 * 根据模板生成文件
 * 2013-6-19
 */
public interface Generate {

	public void generate(Table table) throws Exception;

	public void generate(List<Table> tables) throws Exception;

}
