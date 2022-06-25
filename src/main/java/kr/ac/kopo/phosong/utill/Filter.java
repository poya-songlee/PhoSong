package kr.ac.kopo.phosong.utill;

public class Filter {

	private String format = "ALL";
	private String license= "ALL";
	private String order = "Popular";
	private String size = "ALL";
	private String search;
	private String type;
	
	
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getFormat() {
		return format;
	}
	public void setFormat(String format) {
		if(format != null) {
			this.format = format;
		}
	}
	public String getLicense() {
		return license;
	}
	public void setLicense(String license) {
		if(license != null) {
			this.license = license;
		}
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		if(order != null) {
			this.order = order;
		}
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		
		if(size != null) {
			this.size = size;
		}
	}
	
	
	
}
