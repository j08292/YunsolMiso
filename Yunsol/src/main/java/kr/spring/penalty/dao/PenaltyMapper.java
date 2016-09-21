package kr.spring.penalty.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.spring.penalty.domain.PenaltyCommand;

@Repository
public interface PenaltyMapper {
	public List<PenaltyCommand> list(Map<String, Object> map);
	public int getRowCount(Map<String, Object> map);	
	public void insert(PenaltyCommand penalty);
	public PenaltyCommand selectPenalty(Integer penalty_num);
	public void update(PenaltyCommand penalty);	
	public void delete(Integer penalty_num);
}