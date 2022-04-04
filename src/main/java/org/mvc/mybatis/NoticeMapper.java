package org.mvc.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mvc.bean.NoticeDTO;

public interface NoticeMapper {



	public int noticeWrite(NoticeDTO noticeDTO);

//	public List<NoticeDTO> getList(int startRow , int endRow);


	public int noticeCount();

	public List<NoticeDTO> getArticles(
			@Param("startRow") int startRow ,
			@Param("endRow")int endRow);


	public List<NoticeDTO> getList(
			@Param("startRow") int startRow ,
			@Param("endRow")int endRow);


	public int noticeReadCount(Long num); //조회수 증가

	public int getArticleCount();

	public int readUP(Long num);

	public NoticeDTO getContent(Long num);

	public int notice_del(long num);

	public int notice_updatePro(NoticeDTO dto);


}
