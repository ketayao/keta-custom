/**
 * <pre>
 * Copyright:		Copyright(C) 2012-2013, ketayao.com
 * Filename:		com.ketayao.util.dwz.springdata.PageAdapter.java
 * Class:			PageAdapter
 * Date:			2013-4-17
 * Author:			<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version          2.0.0
 * Description:		
 *
 * </pre>
 **/
 
package com.ketayao.util.dwz.springdata;

import java.util.Iterator;
import java.util.List;

import org.springframework.data.domain.Sort;

import com.ketayao.util.dwz.Page;

/** 
 * 	
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version  2.0.0
 * @since   2013-4-17 下午4:27:13 
 */

public class PageAdapter<T> extends Page implements org.springframework.data.domain.Page<T> {

	/**   
	 * @return  
	 * @see org.springframework.data.domain.Page#getNumber()  
	 */
	@Override
	public int getNumber() {
		// TODO Auto-generated method stub
		return 0;
	}

	/**   
	 * @return  
	 * @see org.springframework.data.domain.Page#getSize()  
	 */
	@Override
	public int getSize() {
		// TODO Auto-generated method stub
		return 0;
	}

	/**   
	 * @return  
	 * @see org.springframework.data.domain.Page#getTotalPages()  
	 */
	@Override
	public int getTotalPages() {
		// TODO Auto-generated method stub
		return 0;
	}

	/**   
	 * @return  
	 * @see org.springframework.data.domain.Page#getNumberOfElements()  
	 */
	@Override
	public int getNumberOfElements() {
		// TODO Auto-generated method stub
		return 0;
	}

	/**   
	 * @return  
	 * @see org.springframework.data.domain.Page#getTotalElements()  
	 */
	@Override
	public long getTotalElements() {
		// TODO Auto-generated method stub
		return 0;
	}

	/**   
	 * @return  
	 * @see org.springframework.data.domain.Page#hasPreviousPage()  
	 */
	@Override
	public boolean hasPreviousPage() {
		// TODO Auto-generated method stub
		return false;
	}

	/**   
	 * @return  
	 * @see org.springframework.data.domain.Page#isFirstPage()  
	 */
	@Override
	public boolean isFirstPage() {
		// TODO Auto-generated method stub
		return false;
	}

	/**   
	 * @return  
	 * @see org.springframework.data.domain.Page#hasNextPage()  
	 */
	@Override
	public boolean hasNextPage() {
		// TODO Auto-generated method stub
		return false;
	}

	/**   
	 * @return  
	 * @see org.springframework.data.domain.Page#isLastPage()  
	 */
	@Override
	public boolean isLastPage() {
		// TODO Auto-generated method stub
		return false;
	}

	/**   
	 * @return  
	 * @see org.springframework.data.domain.Page#iterator()  
	 */
	@Override
	public Iterator<T> iterator() {
		// TODO Auto-generated method stub
		return null;
	}

	/**   
	 * @return  
	 * @see org.springframework.data.domain.Page#getContent()  
	 */
	@Override
	public List<T> getContent() {
		// TODO Auto-generated method stub
		return null;
	}

	/**   
	 * @return  
	 * @see org.springframework.data.domain.Page#hasContent()  
	 */
	@Override
	public boolean hasContent() {
		// TODO Auto-generated method stub
		return false;
	}

	/**   
	 * @return  
	 * @see org.springframework.data.domain.Page#getSort()  
	 */
	@Override
	public Sort getSort() {
		// TODO Auto-generated method stub
		return null;
	}


}
