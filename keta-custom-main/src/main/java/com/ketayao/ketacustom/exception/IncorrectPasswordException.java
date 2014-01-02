package com.ketayao.ketacustom.exception;

/** 
 * @author 	<a href="mailto:ketayao@gmail.com">ketayao</a>
 * @since   2013年12月20日 下午4:52:29 
 */
public class IncorrectPasswordException extends ServiceException {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6657337418551792161L;

	public IncorrectPasswordException() {
		super();
	}

	public IncorrectPasswordException(String message) {
		super(message);
	}

	public IncorrectPasswordException(Throwable cause) {
		super(cause);
	}

	public IncorrectPasswordException(String message, Throwable cause) {
		super(message, cause);
	}
}
