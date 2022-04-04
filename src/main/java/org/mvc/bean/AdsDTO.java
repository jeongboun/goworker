package org.mvc.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class AdsDTO {
	
	public int ads_num;
	public String ads_costomer;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	public Date ads_start;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	public Date ads_end;
	public int ads_fee;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	public Date depo_date;
	public String ads_img;
	public String ads_contents;
	public String ads_url;
	public int ads_visit;
	public String advs_bank;
	public String advs_bank_account;
	
	public int getAds_num() {
		return ads_num;
	}
	public void setAds_num(int ads_num) {
		this.ads_num = ads_num;
	}
	public String getAds_costomer() {
		return ads_costomer;
	}
	public void setAds_costomer(String ads_costomer) {
		this.ads_costomer = ads_costomer;
	}
	public Date getAds_start() {
		return ads_start;
	}
	public void setAds_start(Date ads_start) {
		this.ads_start = ads_start;
	}
	public Date getAds_end() {
		return ads_end;
	}
	public void setAds_end(Date ads_end) {
		this.ads_end = ads_end;
	}
	public int getAds_fee() {
		return ads_fee;
	}
	public void setAds_fee(int ads_fee) {
		this.ads_fee = ads_fee;
	}
	public Date getDepo_date() {
		return depo_date;
	}
	public void setDepo_date(Date depo_date) {
		this.depo_date = depo_date;
	}
	public String getAds_img() {
		return ads_img;
	}
	public void setAds_img(String ads_img) {
		this.ads_img = ads_img;
	}
	public String getAds_contents() {
		return ads_contents;
	}
	public void setAds_contents(String ads_contents) {
		this.ads_contents = ads_contents;
	}
	public String getAds_url() {
		return ads_url;
	}
	public void setAds_url(String ads_url) {
		this.ads_url = ads_url;
	}
	public int getAds_visit() {
		return ads_visit;
	}
	public void setAds_visit(int ads_visit) {
		this.ads_visit = ads_visit;
	}
	public String getAdvs_bank() {
		return advs_bank;
	}
	public void setAdvs_bank(String advs_bank) {
		this.advs_bank = advs_bank;
	}
	public String getAdvs_bank_account() {
		return advs_bank_account;
	}
	public void setAdvs_bank_account(String advs_bank_account) {
		this.advs_bank_account = advs_bank_account;
	}
	 
}