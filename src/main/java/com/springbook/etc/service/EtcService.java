package com.springbook.etc.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.springbook.etc.vo.*;
import com.springbook.member.vo.MemberVO;

public interface EtcService {

	int insertAsk(JoinAskVO vo);

	int inquiryListCount(String keyword);

	List<JoinAskVO> getInquiryList(int i, int contentnum, String keyword);

	List<JoinAskVO> getInquiryDetail(String idx);

	int updateInquiry(String info, String idx);

	List<ProductVO> getProductList(int i, int contentnum, String type, String keyword);

	int productListCount(String type, String keyword);

	int addProductType(ProductVO vo);

	int typeDelete(String list);

	List<ProductThicknessVO> getThicknessList(int i, int contentnum, String type, String keyword);

	int thicknessListCount(String type, String keyword);

	List<ProductVO> getProductNameList();

	int addProductThickness(ProductThicknessVO vo);

	int thicknessDelete(String list);

	int sizeListCount(String type, String keyword);

	List<String> getSizeList(int i, int contentnum, String type, String keyword);

	int addProductSize(ProductSizeVO vo);

	int sizeDelete(String string);

	int detailListCount(String type, String keyword);

	List<String> getDetailList(int i, int contentnum, String type, String keyword);

	List<Map> selectDetailThickness(String name);

	List<Map> selectDetailSize(String name);

	int addProductDetail(ProductDetailVO vo);

	int detailDelete(String string);

	int checkNew(String num);

	int warehouseListCount();

	List<WarehouseVO> getWarehouseList(int i, int contentnum);

	List<String> inventoryInfo();

	int updateInventoryStock(WarehouseInventoryVO vo);

	int insertInventoryStock(WarehouseInventoryVO vo);
	
	List<WarehouseStockVO> inventoryStockInfo(WarehouseInventoryVO vo);

	int insertInventoryInfo(WarehouseInventoryVO vo);

	List<ProductVO> getProductInfo(String idx);

	int updateProductType(ProductVO vo);

	List<ProductThicknessVO> getThicknessInfo(String idx);

	int updateProductThickness(ProductThicknessVO vo);

	List<ProductDetailVO> getDetailInfo(String idx);

	int updateProductDetail(com.springbook.etc.vo.ProductDetailVO vo);

	int safetyListCount(String key);

	List<ProductDetailVO> getSafetyList(int i, int contentnum, String key);

	int creditListCount(String keyword, Date startDt, Date endDt);

	List<MemberVO> memberList();

	List<WarehouseInventoryVO> getInventoryHistory(int i, int contentnum);

	int inventoryHistoryCount();

	int selectCompanyCount(String keyword);

	List<MemberVO> getSelectCompany(int i, int contentnum, String keyword);

	Map<String, Object> searchCreditInfo(String keyword);

	int addDepositHistory(Map<String, Object> map);

	int updateTotalDeposit(Map<String, Object> map);

	int historyDelete(String string);

	Map<String, String> searchDepositInfo(String idx);

	int updateDepositHistory(Map<String, Object> map);

	List<Map<String, Object>> getCreditList(int i, int contentnum, String keyword, Date startDt, Date endDt);

}
