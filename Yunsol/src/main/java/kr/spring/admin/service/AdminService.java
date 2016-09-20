package kr.spring.admin.service;

import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface AdminService {
	public int getSpeechReserveCount();
	public int getMarathonCount();
	public int getWishlistCount();
	public int getRentWaitingCount();
}
