package org.mvc.service;

import java.util.List;

import org.mvc.bean.AdsDTO;
import org.mvc.mybatis.AdsMapper;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Log4j
@Service
public class AdsServiceImpl implements AdsService{
	
	@Setter(onMethod_=@Autowired)
	private AdsMapper mapper;
	
	@Override
	public int count() {
		return mapper.count();
	}

	@Override
	public List<AdsDTO> getAdsList(int startRow, int endRow) {
		return mapper.getAdsList(startRow, endRow);
	}

	@Override
	public int adsInsert(AdsDTO adsDTO) {
		
		return mapper.adsInsert(adsDTO);
	}

	@Override
	public int adsImgUpdate(AdsDTO adsDTO) {
		
		return mapper.adsImgUpdate(adsDTO);
	}

	@Override
	public int getShow(AdsDTO adsDTO) {
		
		return mapper.getShow(adsDTO);
	}

}
