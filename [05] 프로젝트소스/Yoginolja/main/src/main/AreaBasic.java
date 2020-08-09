package main;

public class AreaBasic {
	
	private String local;
	private String areaName;
	private String areaPic;
	private String areaReview;
	
	
	public AreaBasic(String local, String areaName, String areaPic, String areaReview) {
		this.local = local;
		this.areaName = areaName;
		this.areaPic = areaPic;
		this.areaReview = areaReview;
	}
	public String getLocal() {
		return local;
	}
	public void setLocal(String local) {
		this.local = local;
	}
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	public String getAreaPic() {
		return areaPic;
	}
	public void setAreaPic(String areaPic) {
		this.areaPic = areaPic;
	}
	public String getAreaContent() {
		return areaReview;
	}
	public void setAreaContent(String areaContent) {
		this.areaReview = areaContent;
	}

	
}
