package org.mvc.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class NoticeDTO {


//	 공지사항
	private int num; //공지 시퀀스 번호

	private String nsubject; // 공지 제목

	private String ncontent; //공지 내용

	private String nfilename; //공지 파일 업로드

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date ndate; // 공지 날짜

	private int nreadcount; // 공지 조회수


//	고객센터 게시판 테이블 문의사항 및 답변
	private int qnum; //문의 시퀀스 번호

	private String qsubject; // 문의 제목

	private String qcontent; // 문의 내용

	private String qfilename; // 문의 파일 업로드

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date qdate; // 문의 날짜

	private int qreadcount; // 문의 조회수

}
