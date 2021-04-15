package com.jbpark.webstore.exception;

public class InvalidCartException extends RuntimeException {
	/**
	 * 
	 */
	private static final long serialVersionUID = -4191401672778983278L;
	private String cartId;

	public InvalidCartException(String cartId) {
		this.cartId = cartId;
	}

	public String getCartId() {
		return cartId;
	}
}
