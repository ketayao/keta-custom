package com.ketayao.ketacustom.spring;

import java.util.List;

import javax.validation.ConstraintViolationException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindException;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import com.ketayao.ketacustom.util.dwz.AjaxObject;
import com.ketayao.utils.BeanValidators;
import com.ketayao.utils.Exceptions;
/**
 * 返回带错误信息和状态码的ajaxobject字符串。
 * 	
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * Version  2.0.0
 * @since   2013-4-23 下午3:06:34
 */
@ControllerAdvice
public class RestExceptionHandler extends ResponseEntityExceptionHandler {
	private static final Logger LOGGER = LoggerFactory.getLogger(RestExceptionHandler.class);

	/**
	 * 处理Hibernate Validator验证出错的类。 
	 * @param ex
	 * @param request
	 * @return
	 */
	@ExceptionHandler(value = {ConstraintViolationException.class })
	public final ResponseEntity<String> handleException(ConstraintViolationException ex, WebRequest request) {
		List<String> errorList = BeanValidators.extractPropertyAndMessageAsList(ex.getConstraintViolations());
		StringBuilder msg = new StringBuilder();
		for (String error : errorList) {
			msg.append(error + "，");
		}
		
		msg.setCharAt(msg.length() - 1, '。');
		AjaxObject ajaxObject = AjaxObject.newError(msg.toString());
		return new ResponseEntity<String>(ajaxObject.toString(), HttpStatus.OK);
	}
	
	/* 
	 * 处理springmvc form bean绑定错误。
	 * (non-Javadoc)
	 * @see org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler#handleBindException(org.springframework.validation.BindException, org.springframework.http.HttpHeaders, org.springframework.http.HttpStatus, org.springframework.web.context.request.WebRequest)
	 */
	@Override
	protected ResponseEntity<Object> handleBindException(BindException ex,
			HttpHeaders headers, HttpStatus status, WebRequest request) {
		List<ObjectError> errorList = ex.getAllErrors();
		StringBuilder msg = new StringBuilder();
		for (ObjectError error : errorList) {
			if (error instanceof FieldError) {
				FieldError fieldError = (FieldError)error;
				msg.append(fieldError.getField() + "字段、");
			} else {
				msg.append(error.getObjectName() + "对象、");
			}
			
			LOGGER.error(error + Exceptions.getStackTraceAsString(ex));
		}
		
		msg.setCharAt(msg.length() - 1, '，');
		msg.append("绑定错误。");
		
		AjaxObject ajaxObject = AjaxObject.newError(msg.toString());
		return new ResponseEntity<Object>(ajaxObject.toString(), HttpStatus.OK);
	}
}
