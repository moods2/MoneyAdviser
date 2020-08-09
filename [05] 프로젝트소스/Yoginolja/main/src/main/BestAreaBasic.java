package main;

public class BestAreaBasic{
	
	private String areaName;
	private String foodName;
	private String enjoyName;
	private String hotelName;
	
	public BestAreaBasic( String areaName, String foodName, String enjoyName, String hotelName) {
		this.areaName = areaName;
		this.foodName = foodName;
		this.enjoyName = enjoyName;
		this.hotelName = hotelName;
	}
	
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public String getEnjoyName() {
		return enjoyName;
	}
	public void setEnjoyName(String enjoyName) {
		this.enjoyName = enjoyName;
	}
	public String getHotelName() {
		return hotelName;
	}
	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}



}
