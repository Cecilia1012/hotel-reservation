package com.hotel.javabean;

public class Hotel implements java.io.Serializable
{
	//����
	private Integer id;//�Ƶ�ID
	private String name;//�Ƶ�����
	private String city;//�Ƶ����
	private String address;//�Ƶ��ַ
	private String level;//�Ƶ꼶��
	private String phone;//�Ƶ�绰
	
	//������Ϣ
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
	
	//��ȡ��Ϣ
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
