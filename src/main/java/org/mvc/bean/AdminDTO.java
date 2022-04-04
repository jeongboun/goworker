package org.mvc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class AdminDTO {

	private String num;
	private String subject;
	private String writer;
	private String ingredient;
	private String explain;
	private String image;
	private String tag;
	private int good;
	private int visit;
	private String nation_code;
	private String level_code;
	private String time_code;
	private String igrdnt_code;
	private Date regdate;
	private int state;
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getIngredient() {
		return ingredient;
	}
	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}
	public String getExplain() {
		return explain;
	}
	public void setExplain(String explain) {
		this.explain = explain;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getVisit() {
		return visit;
	}
	public void setVisit(int visit) {
		this.visit = visit;
	}
	public String getNation_code() {
		return nation_code;
	}
	public void setNation_code(String nation_code) {
		this.nation_code = nation_code;
	}
	public String getLevel_code() {
		return level_code;
	}
	public void setLevel_code(String level_code) {
		this.level_code = level_code;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getTime_code() {
		return time_code;
	}
	public void setTime_code(String time_code) {
		this.time_code = time_code;
	}
	public String getIgrdnt_code() {
		return igrdnt_code;
	}
	public void setIgrdnt_code(String igrdnt_code) {
		this.igrdnt_code = igrdnt_code;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
}
