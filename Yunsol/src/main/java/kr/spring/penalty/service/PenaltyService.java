package kr.spring.penalty.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.spring.penalty.domain.PenaltyCommand;

@Transactional
public interface PenaltyService {
	@Transactional(readOnly=true)
	public List<PenaltyCommand> list(Map<String, Object> map);
	@Transactional(readOnly=true)
	public int getRowCount(Map<String, Object> map);	
	public void insert(PenaltyCommand penalty);
	@Transactional(readOnly=true)
	public PenaltyCommand selectPenalty(Integer penalty_num);
	public void update(PenaltyCommand penalty);	
	public void delete(Integer penalty_num);
}