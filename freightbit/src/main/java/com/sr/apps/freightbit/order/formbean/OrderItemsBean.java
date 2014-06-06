package com.sr.apps.freightbit.order.formbean;

public class OrderItemsBean {

	private String quantity;
	private String classification;
	private String cargoDetails;
	private Double declaredValue;
	private Double height;
	private Double width;
	private Double length;
	
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getClassification() {
		return classification;
	}
	public void setClassification(String classification) {
		this.classification = classification;
	}
	public String getCargoDetails() {
		return cargoDetails;
	}
	public void setCargoDetails(String cargoDetails) {
		this.cargoDetails = cargoDetails;
	}
	public Double getDeclaredValue() {
		return declaredValue;
	}
	public void setDeclaredValue(Double declaredValue) {
		this.declaredValue = declaredValue;
	}
	public Double getHeight() {
		return height;
	}
	public void setHeight(Double height) {
		this.height = height;
	}
	public Double getWidth() {
		return width;
	}
	public void setWidth(Double width) {
		this.width = width;
	}
	public Double getLength() {
		return length;
	}
	public void setLength(Double length) {
		this.length = length;
	}
}
