package com.ketayao.ketacustom.spring;

import java.util.List;

import javax.validation.ConstraintViolationException;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;
import org.springside.modules.beanvalidator.BeanValidators;

import com.ketayao.ketacustom.util.dwz.AjaxObject;
/**
 * 处理Hibernate Validator验证出错的类。返回带错误信息和状态码的ajaxobject字符串。
 * 	
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version  2.0.0
 * @since   2013-4-23 下午3:06:34
 */
@ControllerAdvice
public class RestExceptionHandler extends ResponseEntityExceptionHandler {

	@ExceptionHandler(value = { ConstraintViolationException.class })
	public final ResponseEntity<String> handleException(ConstraintViolationException ex, WebRequest request) {
		List<String> errorList = BeanValidators.extractPropertyAndMessageAsList(ex.getConstraintViolations());
		StringBuilder msg = new StringBuilder();
		for (String error : errorList) {
			msg.append(error);
		}
		
		AjaxObject ajaxObject = AjaxObject.newError(msg.toString());
		return new ResponseEntity<String>(ajaxObject.toString(), HttpStatus.OK);
	}
}
