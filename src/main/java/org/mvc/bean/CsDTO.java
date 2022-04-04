package org.mvc.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class CsDTO {
	private int num;
	private String subject;
	private String content;
	private String writer;
	private String image;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	private Date regdate; 
	private int readcount;
}
