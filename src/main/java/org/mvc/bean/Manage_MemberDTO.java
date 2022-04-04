package org.mvc.bean;

import java.sql.Date;

public class Manage_MemberDTO {

	private String Id;
	private String Pw;
	private String Name;
	private String Email;
	private Date Regdate;
	private Date Updatedate;

	public String getId() {
		return Id;
	}
	public void setId(String Id) {
		this.Id = Id;
	}
	public String getPw() {
		return Pw;
	}
	public void setPw(String Pw) {
		this.Pw = Pw;
	}
	public String getName() {
		return Name;
	}
	public void setName(String Name) {
		this.Name = Name;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String Email) {
		this.Email = Email;
	}
	public Date getRegdate() {
		return Regdate;
	}
	public void setRegdate(Date Regdate) {
		this.Regdate = Regdate;
	}

	public Date getUpdatedate() {
		return Updatedate;
	}
	public void setUpdatedate(Date Updatedate) {
		this.Updatedate = Updatedate;
	}

	@Override
	public String toString() {
		return "Manage_MemberDTO [Id=" + Id + ", Pw=" + Pw + ", Name=" + Name + ", Email="
				+ Email + ", Regdate=" + Regdate +",  Updatedate=" + Updatedate +"]";
	}

}
