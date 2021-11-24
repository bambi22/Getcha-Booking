package com.hago.getcha.collection.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.hago.getcha.collection.dto.AllCollectDTO;
import com.hago.getcha.collection.dto.CollectDTO;

@Repository
public interface ICollectionDAO {
	public int collChck(CollectDTO cDto);
	public int collectProc(CollectDTO cDto);
	public int collCount(int restNum);
	public ArrayList<AllCollectDTO> myCollectProc(String email);
}