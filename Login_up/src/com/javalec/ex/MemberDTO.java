package com.javalec.ex;

public class MemberDTO {
	
	private	String name;
	private	String id;
	private	String pw;
	private	String eMail;
	private	String address;

	public MemberDTO( String name, String id, String pw, String eMail, String address){
		this.name = name;
		this.id = id;
		this.pw = pw;
		this.eMail = eMail;
		this.address = address;
	}
	public MemberDTO() {
		
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

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String geteMail() {
		return eMail;
	}

	public void seteMail(String eMail) {
		this.eMail = eMail;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
