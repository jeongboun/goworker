package org.mvc.service;

import java.util.List;

import org.mvc.bean.AdsDTO;
import org.mvc.bean.RecipeDTO;

public interface AdsService {

	public int count();
	
	public List<AdsDTO> getAdsList(int startRow, int endRow);

	public int adsInsert(AdsDTO adsDTO);
	
	public int adsImgUpdate(AdsDTO adsDTO);
	
	public int getShow(AdsDTO adsDTO);
}
