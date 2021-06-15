package com.multi.exercise;

public class ExerciseVO {
	private int dayNo;
	private String id;
	private int year;
	private int month;
	private int exdate;
	private String exName;
	private int exWeight;
	private int exMeter;
	private int exTime;
	private int exCount;
	
	public int getDayNo() {
		return dayNo;
	}
	public void setDayNo(int dayNo) {
		this.dayNo = dayNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getExdate() {
		return exdate;
	}
	public void setExdate(int exdate) {
		this.exdate = exdate;
	}
	public String getExName() {
		return exName;
	}
	public void setExName(String exName) {
		this.exName = exName;
	}
	public int getExWeight() {
		return exWeight;
	}
	public void setExWeight(int exWeight) {
		this.exWeight = exWeight;
	}
	public int getExMeter() {
		return exMeter;
	}
	public void setExMeter(int exMeter) {
		this.exMeter = exMeter;
	}
	public int getExTime() {
		return exTime;
	}
	public void setExTime(int exTime) {
		this.exTime = exTime;
	}
	public int getExCount() {
		return exCount;
	}
	public void setExCount(int exCount) {
		this.exCount = exCount;
	}
	
	@Override
	public String toString() {
		return "ExerciseVO [dayNo=" + dayNo + ", id=" + id + ", year=" + year + ", month=" + month + ", exdate="
				+ exdate + ", exName=" + exName + ", exWeight=" + exWeight + ", exMeter=" + exMeter + ", exTime="
				+ exTime + ", exCount=" + exCount + "]";
	}
	
	
}