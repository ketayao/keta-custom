package com.ketayao.ketacustom.test.others;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import com.ketayao.ketacustom.entity.main.Module;

public class ModuleTest {
	@Test
	public void test() {
		Module module = new Module();
		module.setId(1L);
		module.setName("module_1");
		
		Module module2 = new Module();
		module2.setId(2L);
		module2.setName("module_2");
		module2.setParent(module);
		
		Module module3 = new Module();
		module3.setId(3L);
		module3.setName("module_3");
		module3.setParent(module);
		
		Module module4 = new Module();
		module4.setId(4L);
		module4.setName("module_4");
		module4.setParent(module2);
		
		Module module5 = new Module();
		module5.setId(5L);
		module5.setName("module_5");
		module5.setParent(module4);
		
		List<Module> list = new ArrayList<Module>();
		list.add(module2);
		list.add(module3);
		module.setChildren(list);
		
		list = new ArrayList<Module>();
		list.add(module4);
		module2.setChildren(list);
		
		list = new ArrayList<Module>();
		list.add(module5);
		module4.setChildren(list);
		
		System.out.println(module);
		list = module.getChildren();
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
			List<Module> list2 = list.get(i).getChildren();
			for (int j = 0; j < list2.size(); j++) {
				System.out.println(list2.get(j));
				List<Module> list3 = list2.get(j).getChildren();
				for (int j2 = 0; j2 < list3.size(); j2++) {
					System.out.println(list3.get(j2));
				}
			}
		}
	}
}
