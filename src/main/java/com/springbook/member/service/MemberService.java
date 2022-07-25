package com.springbook.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;

import com.springbook.member.vo.MemberVO;

public interface MemberService {

	int getId(String id);

	int insertMember(MemberVO vo) throws Exception;

	ResponseEntity<MemberVO> tryLogin(MemberVO vo) throws Exception;

	int memberListCount(String type, String keyword);

	List<MemberVO> getMemberList(int i, int contentnum,String type, String keyword);

	MemberVO getMemberInfo(String id);

	List<Map<String, Object>> getTypeProductList(int i, int contentnum, String keyword);

	int typeProductListCount(String keyword);

	List<String> getProductNameList();

	int addPrice(Map<String, Object> map);

	int memberDelete(String string);

	int initMoneyInfo(MemberVO vo);

	int selectPrice(Map<String, Object> map);

	int updatePrice(Map<String, Object> map);

	/**
	 * <h3>회원정보에 등록된 이메일이 있는지 체크</h3>  
	 * 
	 * 파라미터가 userId인경우 id로 조회후 등록된 이메일인지 확인 후 member객체 리턴 
	 * 파라미테가 이메일인 경우 등록된 이메일인지 체크 후 member객체 리턴  
	 * @param userId
	 * @return
	 */
	MemberVO checkEmailBy(String userId);

	/**
	 * <h3>비밀번호 수정<h3>
	 * 
	 * @param member
	 * @throws Exception
	 */
	void modifyPassword(MemberVO member) throws Exception;

	/**
	 * 세션 체크 
	 * 세션을 체크해 세션이 있으면 자동로그인, 없으면 로그인 페이지를 보여준다.
	 *   
	 * @param request
	 * @param model
	 * @return
	 */
	String checkSession(HttpServletRequest request, Model model);

	String logout(HttpServletRequest request, HttpServletResponse response);

	//고객가격조회
	String getClientPrice(Map<String, Object> map, String id);


}
