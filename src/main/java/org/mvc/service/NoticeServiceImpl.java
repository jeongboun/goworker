package org.mvc.service;


import java.util.List;

import org.mvc.bean.NoticeDTO;
import org.mvc.mybatis.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;

@Service
public class NoticeServiceImpl  implements NoticeService{

	@Setter(onMethod_=@Autowired)
	private NoticeMapper mapper;

	@Override
	public int noticeWrite(NoticeDTO noticeDTO) {
		return mapper.noticeWrite(noticeDTO);
	}


	@Override
	public List<NoticeDTO> getList(int startRow, int endRow) {
		return mapper.getList(startRow, endRow);
	}

	@Override
	public int count() {
		return mapper.getArticleCount();
	}


	@Override
	public int readUP(Long num) {
		return mapper.readUP(num);
	}


	@Override
	public NoticeDTO getContent(Long num) {
		return mapper.getContent(num);
	}


	@Override
	public int notice_del(Long num) {
		return mapper.notice_del(num);
	}


	@Override
	public int notice_updatePro(NoticeDTO dto) {
		return mapper.notice_updatePro(dto);

	}
}
