package org.mvc.service;

import java.util.List;

import org.mvc.bean.CsDTO;
import org.mvc.mybatis.CsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Log4j
public class CsServiceImpl implements CsService{
	
	@Setter(onMethod_=@Autowired) 
	private CsMapper mapper;
	@Override
	public int getCountMyQNA(String id) {
		log.info("==============id ="+id);
		return mapper.getCountMyQNA(id);
	}
	@Override
	public List<CsDTO> getMyQNA(String id, int startNum, int endNum) {
		return mapper.getMyQNA(id, startNum, endNum);
	}
	@Override
	public int csWrite(CsDTO dto) {
		return mapper.csWrite(dto);
	}
	@Override
	public int csFileUpload(CsDTO dto) {
		return mapper.csFileUpload(dto);
	}
	@Override
	public CsDTO read(int num) {
		return mapper.read(num);
	}
	@Override
	public int readCountUpdate(int num) {
		return mapper.readCountUpdate(num);
	}
	@Override
	public int update(int num) {
		return mapper.update(num);
	}
		

}
