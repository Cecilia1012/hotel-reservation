package com.hotel.javabean;

public class Hotel implements java.io.Serializable
{
	//变量
	private Integer id;//酒店ID
	private String name;//酒店名称
	private String city;//酒店城市
	private String address;//酒店地址
	private String level;//酒店级别
	private String phone;//酒店电话
	
	//设置信息
	public void setid(Integer id) {
		this.id=id;
	}
	
	public void setname(String name) {
		this.name=name;
	}
	
	public void setcity(String city) {
		this.city=city;
	}
	
	public void setaddress(String address) {
		this.address=address;
	}
	
	public void setlevel(String level) {
		this.level=level;
	}
	
	public void setphone(String phone) {
		this.phone=phone;
	}
	
	//获取信息
	public Integer getid() {
		return id;
	}
	
	public String getname() {
		return name;
	}
	
	public String getcity() {
		return city;
	}
	
	public String getaddress() {
		return address;
	}
	
	public String getlevel() {
		return level;
	}
	
	public String getphone() {
		return phone;
	}
}
