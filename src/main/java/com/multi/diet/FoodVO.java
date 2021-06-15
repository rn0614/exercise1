package com.multi.diet;


public class FoodVO {
	
    private String fCode;
    private String fName;
    private String f_category;
    private double servings;
    private double kcal;
    private double kcal_per_100;
    
	public FoodVO() { }
	
	public FoodVO(String fCode, String fName, String f_category, double servings, double kcal, double kcal_per_100) {
		this.fCode = fCode;
		this.fName = fName;
		this.f_category = f_category;
		this.servings = servings;
		this.kcal = kcal;
		this.kcal_per_100 = kcal_per_100;
	}
	
    
	public String getfCode() {
		return fCode;
	}
	public void setfCode(String fCode) {
		this.fCode = fCode;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public String getF_category() {
		return f_category;
	}
	public void setF_category(String f_category) {
		this.f_category = f_category;
	}
	public double getServings() {
		return servings;
	}
	public void setServings(double servings) {
		this.servings = servings;
	}
	public double getKcal() {
		return kcal;
	}
	public void setKcal(double kcal) {
		this.kcal = kcal;
	}
	public double getKcal_per_100() {
		return kcal_per_100;
	}
	public void setKcal_per_100(double kcal_per_100) {
		this.kcal_per_100 = kcal_per_100;
	}
    
    
}
