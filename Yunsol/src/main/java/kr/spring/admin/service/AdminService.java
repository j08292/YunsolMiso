package kr.spring.admin.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import kr.spring.booklist.domain.AdminBooklistCommand;
import kr.spring.penalty.domain.PenaltyCommand;

@Transactional
public interface AdminService {
	//메인- 관리자 체크사항
	public int getSpeechReserveCount();
	public int getMarathonCount();
	public int getWishlistCount();
	public int getRentWaitingCount();
	//메인 - 차단회원 관리
	public List<PenaltyCommand> penaltyList();
	public int getRowPenaltyCount();	
	//메인 - 인기도서 차트
	public List<AdminBooklistCommand> rentRankList();
	//메인- 3개월 도서현황 비교
	//2개월 전_대여량
	public int getBookRentCount_2();
	//2개월 전_희망도서 신청 건수
	public int getWishlistCount_2();
	//2개월 전_신규 입고도서 건수
	public int getBooklistCount_2();
	//1개월 전_대여량
	public int getBookRentCount_1();
	//1개월 전_희망도서 신청 건수
	public int getWishlistCount_1();
	//1개월 전_신규 입고도서 건수
	public int getBooklistCount_1();
	//현재_대여량
	public int getBookRentCount_0();
	//현재_희망도서 신청 건수
	public int getWishlistCount_0();
	//현재_신규 입고도서 건수
	public int getBooklistCount_0();
}