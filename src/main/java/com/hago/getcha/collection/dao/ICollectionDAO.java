package com.hago.getcha.collection.dao;

import org.springframework.stereotype.Repository;

import com.hago.getcha.collection.dto.CollectDTO;

@Repository
public interface ICollectionDAO {
	public int collChck(CollectDTO cDto);
	public int collectProc(CollectDTO cDto);
	public int collCount(int restNum);
}
