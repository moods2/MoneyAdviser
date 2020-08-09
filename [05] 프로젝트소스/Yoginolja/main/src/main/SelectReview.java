package main;

public class SelectReview {
	
	private String localNumber;
	private String local;
	private String areaName;
	private String areaPic;
	private String areaContent;
	
	public SelectReview(String localNumber, String local, String areaName, String areaPic, String areaContent) {
		this.localNumber = localNumber;
		this.local = local;
		this.areaName = areaName;
		this.areaPic = areaPic;
		this.areaContent = areaContent;
	}

	public String getLocalNumber() {
		return localNumber;
	}
	public void setLocalNumber(String localNumber) {
		this.localNumber = localNumber;
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
		return areaContent;
	}
	public void setAreaContent(String areaReview) {
		this.areaContent = areaContent;
	}
}
