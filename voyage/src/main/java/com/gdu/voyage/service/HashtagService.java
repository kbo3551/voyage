package com.gdu.voyage.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdu.voyage.mapper.HashtagMapper;
import com.gdu.voyage.vo.Hashtag;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class HashtagService {
   @Autowired HashtagMapper hashtagMapper;
   
   // 해시태그 전체 조회
   public Map<String, Object> getHashtagList(String hashtag) {
	  log.debug("[degug] HashtagService.getHashtagList hashtag : " + hashtag);
      
	  List<Hashtag> hashtagList = new ArrayList<>();
	  
	  if(hashtag != null) {
	      hashtagList = hashtagMapper.selectHashtagListByResult(hashtag);
	      log.debug("[degug] hashtagList : " + hashtagList);
	  } else {
		  hashtagList = hashtagMapper.selectHashtagList();
	      log.debug("[degug] hashtagList : " + hashtagList);
	  }
      
      Map<String, Object> returnMap = new HashMap<>();
      returnMap.put("hashtagList", hashtagList);
      
      return returnMap;
   }
   
   // 해시태그 검색
   public List<Map<String, Object>> getHashtagListBySearch(String searchKeyword) {
      log.debug("[degug] searchKeyword : " + searchKeyword);
      
      List<Map<String, Object>> hashtagList = hashtagMapper.selectHashtagListBySearch(searchKeyword);
      log.debug("[degug] hashtagList : " + hashtagList);
      
//      Map<String, Object> returnMap = new HashMap<>();
//      returnMap.put("hashtagList", hashtagList);
      
      return hashtagList;
   }
   
//   // 해시태그 검색 결과 조회
//   public Map<String, Object> getHashtagListByResult(String hashtag) {
//	  log.debug("[degug] hashtag : " + hashtag);
//	      
//      List<Hashtag> hashtagList = hashtagMapper.selectHashtagListByResult(hashtag);
//      log.debug("[degug] hashtagList : " + hashtagList);
//      
//      Map<String, Object> returnMap = new HashMap<>();
//      returnMap.put("hashtagList", hashtagList);
//      
//      return returnMap;
//   }
}