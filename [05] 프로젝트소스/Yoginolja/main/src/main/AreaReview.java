package main;

public class AreaReview {
	
	private String name;
	private String id;
	private String review;
	
	public AreaReview(String name, String id, String review) {
		this.name = name;
		this.id = id;
		this.review = review;
	}

	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}


	
	

	
}
