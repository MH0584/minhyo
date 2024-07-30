package dto;

public class SelectIdDTO {
	String id;
	String pw;
	String name;
	int point;
	
	public SelectIdDTO(String name, int point, String id) {
		this.name = name;
		this.point = point;
		this.id = id;
	}
	
	public SelectIdDTO(String id, String pw, String name, int point) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.point = point;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
}
