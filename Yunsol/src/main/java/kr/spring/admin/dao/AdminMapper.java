package kr.spring.admin.dao;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminMapper {
	@Select("SELECT count(*) FROM speech_reservation WHERE speech_reserve_status=0 or speech_reserve_status=2")
	public int getSpeechReserveCount();
	@Select("SELECT count(*) FROM marathon WHERE marathon_status = 0")
	public int getMarathonCount();
	@Select("SELECT count(*) FROM wishlist WHERE wish_status = 0")
	public int getWishlistCount();
	@Select("SELECT count(*) FROM bookrent WHERE rent_status = 3")
	public int getRentWaitingCount();
}
