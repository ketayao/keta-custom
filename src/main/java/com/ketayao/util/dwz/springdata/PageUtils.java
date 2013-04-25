/**
 * <pre>
 * Copyright:		Copyright(C) 2011-2012, ketayao.com
 * Filename:		com.ygsoft.util.dwz.SpringDataJpaPageConvert.java
 * Class:			SpringDataJpaPageConvert
 * Date:			2012-8-6
 * Author:			<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version          1.1.0
 * Description:		
 *
 * </pre>
 **/

package com.ketayao.util.dwz.springdata;

import org.apache.commons.lang3.StringUtils;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import com.ketayao.util.dwz.Page;

/**
 * 解决dwz page 的遗留问题，使程序更易移植和替换
 * 
 * @author <a href="mailto:ketayao@gmail.com">ketayao</a> Version 1.1.0
 * @since 2012-8-6 下午10:03:18
 */

public class PageUtils {

	/**
	 * 生成spring data JPA 对象 描述
	 * 
	 * @param page
	 * @return
	 */
	public static Pageable createPageable(Page page) {
		if (StringUtils.isNotBlank(page.getOrderField())) {
			// 忽略大小写
			if (page.getOrderDirection().equalsIgnoreCase(Page.ORDER_DIRECTION_ASC)) {
				return new PageRequest(page.getPlainPageNum() - 1, page.getNumPerPage(), 
						Sort.Direction.ASC, page.getOrderField());
			} else {
				return new PageRequest(page.getPlainPageNum() - 1, page.getNumPerPage(), 
						Sort.Direction.DESC, page.getOrderField());
			}
		}

		return new PageRequest(page.getPlainPageNum() - 1, page.getNumPerPage());
	}

	/**
	 * 将springDataPage的属性注入page 描述
	 * 
	 * @param page
	 * @param springDataPage
	 */
	public static void injectPageProperties(Page page,
			org.springframework.data.domain.Page<?> springDataPage) {
		page.setTotalCount(springDataPage.getTotalElements());
	}
}
