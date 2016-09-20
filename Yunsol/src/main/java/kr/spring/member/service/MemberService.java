package kr.spring.member.service;

import org.springframework.transaction.annotation.Transactional;

import kr.spring.member.domain.MemberCommand;

@Transactional
public interface MemberService {
	public void insert(MemberCommand member);
	@Transactional(readOnly=true)
	public MemberCommand selectMember(String mem_id);
	public void update(MemberCommand member);
	public void delete(String id);

}
