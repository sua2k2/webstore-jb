package com.jbpark.webstore.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.NOT_FOUND, reason = "이 범주에 속하는 상품은 없습니다.")
public class NoProductsFoundUnderCategoryException extends RuntimeException{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4767891132697926528L;

}
