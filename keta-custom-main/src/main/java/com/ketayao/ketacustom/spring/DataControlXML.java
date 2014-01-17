package com.ketayao.ketacustom.spring;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * @author <a href="mailto:ketayao@gmail.com">ketayao</a>
 * @since 2014年1月17日 上午10:51:08
 */
@XmlRootElement(name="dataControlTemplate")
public class DataControlXML {

	private List<Condition> items = new ArrayList<Condition>();

	/**
	 * @return the items
	 */
	@XmlElementWrapper(name="items")
	@XmlElement(name="condition")
	public List<Condition> getItems() {
		return items;
	}

	/**
	 * @param items the items to set
	 */
	public void setItems(List<Condition> items) {
		this.items = items;
	}
	
	@XmlRootElement(name="condition")
	public static class Condition {
		private String name;
		private String content;
		
		/**
		 * @return the name
		 */
		@XmlElement(required=true)
		public String getName() {
			return name;
		}
		
		/**
		 * @param name the name to set
		 */
		public void setName(String name) {
			this.name = name;
		}
		
		/**
		 * @return the content
		 */
		@XmlElement(required=true)
		public String getContent() {
			return content;
		}
		
		/**
		 * @param content the content to set
		 */
		public void setContent(String content) {
			this.content = content;
		}
	}
}



