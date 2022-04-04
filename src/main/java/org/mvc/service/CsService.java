package org.mvc.service;

import java.util.List;

import org.mvc.bean.CsDTO;

public interface CsService {
	public int getCountMyQNA(String id);
	
	public List<CsDTO> getMyQNA(String id, int startNum, int endNum);
	
	public int csWrite(CsDTO dto);
	
	public int csFileUpload(CsDTO dto);
	
	public CsDTO read(int num);
	
	public int readCountUpdate(int num);
	
	public int update(int num);
}
