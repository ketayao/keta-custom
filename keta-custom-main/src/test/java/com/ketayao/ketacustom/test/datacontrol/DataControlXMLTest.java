package com.ketayao.ketacustom.test.datacontrol;

import java.io.File;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

import org.junit.Test;

import com.ketayao.ketacustom.spring.DataControlXML;
import com.ketayao.ketacustom.spring.DataControlXML.Condition;

/** 
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * @since   2014年1月17日 上午10:53:04 
 */
public class DataControlXMLTest {
	@Test
	public void testCreateXML() throws Exception {
		Condition condition = new Condition();
		condition.setName("条件标题1");
		condition.setContent("条件内容1");
		
		Condition condition2 = new Condition();
		condition2.setName("条件标题2");
		condition2.setContent("条件内容2");
		
		DataControlXML bean = new DataControlXML();
		bean.getItems().add(condition);
		bean.getItems().add(condition2);

        JAXBContext jaxbContext = JAXBContext.newInstance(DataControlXML.class);  
        Marshaller jaxbMarshaller = jaxbContext.createMarshaller();  
        // output pretty printed  
        jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);  
        
        jaxbMarshaller.marshal(bean, System.out);  
	}
	
	@Test
	public void testCreateBean() throws Exception {
		JAXBContext jc = JAXBContext.newInstance(DataControlXML.class);
        Unmarshaller unmarshaller = jc.createUnmarshaller();
        File xml = new File(DataControlXMLTest.class.getResource("").getPath() + "test.xml");
        DataControlXML root = (DataControlXML) unmarshaller.unmarshal(xml);

        Marshaller marshaller = jc.createMarshaller();
        marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        marshaller.marshal(root, System.out);
	}
}
