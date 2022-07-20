package com.springbook.etc.creditmng.service;

import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.springbook.etc.creditmng.dto.CreditExcelDTO;

public interface CreditMngService {

	List<CreditExcelDTO> parseJson(String jsonData) throws JsonMappingException, JsonProcessingException;

	Map<String, Object> getCreditExcelData(List<CreditExcelDTO> creditList);

}
