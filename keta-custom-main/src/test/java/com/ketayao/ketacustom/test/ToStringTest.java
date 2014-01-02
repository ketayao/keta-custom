package com.ketayao.ketacustom.test;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import com.ketayao.ketacustom.entity.main.DataControl;
import com.ketayao.ketacustom.entity.main.RolePermission;
import com.ketayao.ketacustom.entity.main.RolePermissionDataControl;

/** 
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * @since   2013年12月20日 上午11:38:54 
 */
public class ToStringTest {
	@Test
	public void test() {
		DataControl dataControl = new DataControl();
		
		dataControl.setId(1L);
		dataControl.setName("测试下数据");
		dataControl.setDescription("仅仅是描述");
		dataControl.setControl("条件测试");
		
		List<RolePermissionDataControl> rolePermissionDataControls = new ArrayList<RolePermissionDataControl>();
		RolePermissionDataControl rolePermissionDataControl = new RolePermissionDataControl();
		rolePermissionDataControl.setDataControl(dataControl);
		rolePermissionDataControl.setId(2L);
		
		RolePermission rolePermission = new RolePermission();
		rolePermission.setId(3L);
		rolePermissionDataControl.setRolePermission(rolePermission);
		
		rolePermissionDataControls.add(rolePermissionDataControl);
		dataControl.setRolePermissionDataControls(rolePermissionDataControls);
		
		System.out.println(dataControl);
		
	}
}
