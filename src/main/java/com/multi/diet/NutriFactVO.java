package com.multi.diet;

public class NutriFactVO {  // OCR로 스캔한 Text에서 필요한 영양 성분을 해당 VO에 저장하기
	
	private double totalAmount;  // 총 내용량
	private String amountUnit;  // 총 내용량 단위 (g, kg, ml, l, ...)
	private double unitAmount;  // 1회 제공량
	private double unitcalories; // 1회 제공 칼로리
	
	public double getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getAmountUnit() {
		return amountUnit;
	}
	public void setAmountUnit(String amountUnit) {
		this.amountUnit = amountUnit;
	}
	public double getUnitAmount() {
		return unitAmount;
	}
	public void setUnitAmount(double unitAmount) {
		this.unitAmount = unitAmount;
	}
	public double getUnitcalories() {
		return unitcalories;
	}
	public void setUnitcalories(double unitcalories) {
		this.unitcalories = unitcalories;
	}
	
//	@Override
//	public String toString() {
//		return "NutriFactVO "
//				+ "[totalAmount=" + totalAmount 
//				+ ", amountUnit=" + amountUnit 
//				+ ", unitAmount=" + unitAmount
//				+ ", unitcalories=" + unitcalories + "]";
//	}
	
	
	// 여유가 된다면 carbohydrate, protein, fat 추가
}
