package com.gdu.voyage.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdu.voyage.mapper.ProductMapper;
import com.gdu.voyage.vo.AccomBuilding;
import com.gdu.voyage.vo.AccomPayment;
import com.gdu.voyage.vo.AccomRoom;
import com.gdu.voyage.vo.Activity;
import com.gdu.voyage.vo.ActivityPayment;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class ProductService {
	@Autowired ProductMapper productMapper;
	
	// [사용자] 숙소-건물 목록 조회
    public Map<String, Object> getAccomBuildingList(int page, int ROW_PER_PAGE, @Nullable Integer one) {
        

        int beginRow = (page-1) * ROW_PER_PAGE;
        
        List<AccomBuilding> accomBuildingList = new ArrayList<>();
        
        if(one != null) {
            accomBuildingList = productMapper.selectAccomBuildingList(beginRow,ROW_PER_PAGE, one);
        } else {
            accomBuildingList = productMapper.selectAccomBuildingList(beginRow,ROW_PER_PAGE, null);
        }
        Map<String, Object> returnMap = new HashMap<>();
        
        int lastPage = 0;
        AccomBuilding accomBuilding = productMapper.selectAccomBuildingList(beginRow,ROW_PER_PAGE, 1).get(0);
        int totalCount = accomBuilding.getCnt();
        
        log.debug("[debug] ProductService.getAccomBuildingList accomBuildingList : " + accomBuildingList);
        
        lastPage = totalCount / ROW_PER_PAGE;
        
        if(totalCount % ROW_PER_PAGE !=0) {
            lastPage += 1;
        }
        
        returnMap.put("accomBuildingList", accomBuildingList);
        returnMap.put("lastPage", lastPage);
        returnMap.put("totalCount", totalCount);
        
        return returnMap;
    }
	
	// [사용자] 숙소-건물 시설 인기 조회
	public List<Map<String, Object>> getAccomBuildingFacilityByBest() {
		List<Map<String, Object>> facilityByBest = productMapper.selectAccomBuildingFacilityByBest();
		log.debug("[debug] ProductService.getAccomBuildingFacilityByBest facilityByBest : " + facilityByBest);
		return facilityByBest;
	}
	
	// [사용자] 숙소-건물 지역 인기 조회
	public List<Map<String, Object>> getAccomAddressByBest() {
		List<Map<String, Object>> addressZipByBest = productMapper.selectAccomAddressByBest();
		log.debug("[debug] ProductService.getAccomAddressByBest addressZipByBest : " + addressZipByBest);
		return addressZipByBest;
	}
		
	// [사용자] 숙소-건물 목록 검색 조회
	public Map<String, Object> getAccomBuildingListBySearch(Map<String, Object> param) {
		log.debug("[debug] ProductService.getAccomBuildingListBySearch param : " + param);
        
        int ROW_PER_PAGE=((int)param.get("ROW_PER_PAGE"));

        int beginRow = (((int)param.get("page"))-1) * ROW_PER_PAGE;
        
        List<AccomBuilding> accomBuildingList = new ArrayList<>();
        
        param.put("beginRow", beginRow);

        accomBuildingList = productMapper.selectAccomBuildingListBySearch(param);

        Map<String, Object> returnMap = new HashMap<>();
        int lastPage = 0;
        
        Integer totalCount = productMapper.selectAccomBuildingListBySearchCount(param);
        
        if(totalCount == null) {
        	returnMap.put("totalCount", totalCount);
        	return returnMap;
          }
        
 
        log.debug("[debug] ProductService.getAccomBuildingList accomBuildingList : " + accomBuildingList);

        
        lastPage = totalCount / ROW_PER_PAGE;
        
        if(totalCount % ROW_PER_PAGE !=0) {
            lastPage += 1;
        }
        
        returnMap.put("accomBuildingList", accomBuildingList);
        returnMap.put("lastPage", lastPage);
        returnMap.put("totalCount", totalCount);

		return returnMap;
	}
		
	// [사용자] 숙소-건물 상세 조회
	public AccomBuilding getAccombuildingOne (int accomBuildingNo) {
		return productMapper.selectAccomBuildingOne(accomBuildingNo);
	}
	
	// [사용자] 숙소-건물-객실 목록 조회
	public List<AccomRoom> getAccomRoomList(int accomBuildingNo, int currentPage, int ROW_PER_PAGE) {
		log.debug("[debug] ProductService.getAccomRoomList currentPage : " );
		log.debug("[debug] ProductService.getAccomRoomList ROW_PER_PAGE : " );
		
		int beginRow = (currentPage-1) * ROW_PER_PAGE;
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("ROW_PER_PAGE", ROW_PER_PAGE);
		
		List<AccomRoom> accomRoomList = productMapper.selectAccomRoomList(accomBuildingNo);
		
		log.debug("[debug] ProductService.getAccomRoomList accomRoomList : " + accomRoomList);
		
		return accomRoomList;
	}
	
	// [사용자] 숙소-건물-객실 상세 조회
	public AccomRoom getAccomRoomOne (int accomRoomNo) {
		return productMapper.selectAccomRoomOne(accomRoomNo);
	}	
	
	// [사용자] 체험 목록 조회
	public Map<String, Object> getActivityList(int page, int ROW_PER_PAGE, @Nullable Integer one) {
		
		int beginRow = (page-1) * ROW_PER_PAGE;
        
        List<Activity> activityList = new ArrayList<>();
        
        
        if(one == null) {
        	activityList = productMapper.selectActivityList(beginRow,ROW_PER_PAGE, null);
        } else if(one == 2) {
        	activityList = productMapper.selectActivityList(beginRow,ROW_PER_PAGE, 2);
        } else {
        	activityList = productMapper.selectActivityList(beginRow,ROW_PER_PAGE, one);
        }
		
        Map<String, Object> returnMap = new HashMap<>();
        
        int lastPage = 0;
        Activity activity = productMapper.selectActivityList(beginRow,ROW_PER_PAGE, 1).get(0);
        int totalCount = activity.getCnt();
        
        lastPage = totalCount / ROW_PER_PAGE;
        
        if(totalCount % ROW_PER_PAGE !=0) {
            lastPage += 1;
        }
        
        returnMap.put("activityList", activityList);
        returnMap.put("lastPage", lastPage);
        returnMap.put("totalCount", totalCount);
		
		log.debug("[debug] ProductService.getActivityList activityList : " + activityList);
		return returnMap;
	}
	// [사용자] 체험 지역 인기 조회
	public List<Map<String, Object>> getActivityAddressByBest() {
		List<Map<String, Object>> addressZipByBest = productMapper.selectActivityAddressByBest();
		log.debug("[debug] ProductService.getActivityAddressByBest addressZipByBest : " + addressZipByBest);
		return addressZipByBest;
	}
	
	// [사용자] 체험 목록 검색 조회
	public Map<String, Object> getActivityListBySearch(Map<String, Object> param) {
		log.debug("[debug] ProductService.getActivityListBySearch param : " + param);
		
		int ROW_PER_PAGE=((int)param.get("ROW_PER_PAGE"));
        int beginRow = (((int)param.get("page"))-1) * ROW_PER_PAGE;
        param.put("beginRow", beginRow);
        
		List<Activity> activityList = productMapper.selectActivityListBySearch(param);
        
        Map<String, Object> returnMap = new HashMap<>();
        
        int lastPage = 0;
        Integer totalCount = productMapper.selectActivityListBySearchCount(param);
        
        if(totalCount == null) {
        	returnMap.put("totalCount", totalCount);
        	return returnMap;
          }
        
        
        lastPage = totalCount / ROW_PER_PAGE;
        
        if(totalCount % ROW_PER_PAGE !=0) {
            lastPage += 1;
        }
        
        returnMap.put("activityList", activityList);
        returnMap.put("lastPage", lastPage);
        returnMap.put("totalCount", totalCount);
        
		log.debug("[debug] ProductService.getActivityList activityList : " + activityList);
		return returnMap;
	}

	// [사용자] 체험 상세 조회
	public Activity getActivityOne (int activityNo) {
		return productMapper.selectActivityOne(activityNo);
	}
	
	
	// 예약
	// [사용자] 객실 예약 내역 전체 조회
	public List<String> getAccomRoomReserveDay(int accomRoomNo) {
		log.debug("[debug] ProductService.getAccomRoomReserveDay accomRoomNo : " + accomRoomNo);
		
		// 체크인, 체크아웃 날짜를 list 안의 map 형태로 저장
		List<Map<String, Object>> map = productMapper.selectAccomRoomReserveDay(accomRoomNo);
		log.debug("[debug] ProductService.getAccomRoomReserveDay map : " + map);
		//log.debug("[debug] ProductService.getAccomRoomReserveDay map.get(0) : " + map.get(0).get("accomCheckIn").toString());
		
		List<String> reverveDays = new ArrayList<>();
				  
		// 반복문을 통해 list 안의 i번째 map 데이터를 가져와
		// 체크인 날짜로부터 체크아웃 날짜 사이의 (예약 불가능한) 모든 예약 날짜를 하나의 list에 저장
		for(int i=0; i<map.size(); i++) {
		  String accomCheckIn = map.get(i).get("accomCheckIn").toString();
		  String accomCheckOut = map.get(i).get("accomCheckOut").toString();
		  
	      int checkInYear = Integer.parseInt(accomCheckIn.substring(0,4));
	      int checkInMonth= Integer.parseInt(accomCheckIn.substring(5,7));
	      int checkInDate = Integer.parseInt(accomCheckIn.substring(8,10));

	      // 체크아웃 날짜를 '-' 없는 int 타입으로 가공하기 위한 코드
	      String checkOutYear = accomCheckOut.substring(0,4);
	      String checkOutMonth= accomCheckOut.substring(5,7);
	      String checkOutDate = accomCheckOut.substring(8,10);
	      
	      String checkOut = checkOutYear + checkOutMonth + checkOutDate;

	      int endDt = Integer.parseInt(checkOut);
	 
	      Calendar cal = Calendar.getInstance();
	         
	      // Calendar의 Month는 0부터 시작하므로 -1
	      cal.set(checkInYear, checkInMonth-1, checkInDate);
	        
	      while(true) {
	          log.debug("현재 날짜 출력 "+getDateByString(cal.getTime()));
	             
	          // 체크인 날짜로부터 하루씩 증가
	          cal.add(Calendar.DATE, 1); 

	          // 반환하기 위한 list에 모든 예약 날짜 저장
	          reverveDays.add(getDateByString(cal.getTime()));
	          
	          // 현재 날짜가 체크아웃 날짜보다 크면 종료 
	           if(getDateByInteger(cal.getTime()) > endDt) break;
	      }
		}
		return reverveDays;
	}
	
	// 날짜 데이터를 yyyyMMdd 형식으로 가공하여 int 타입으로 반환하기 위한 메소드
	public int getDateByInteger(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        return Integer.parseInt(sdf.format(date));
    }
	
	// 날짜 데이터를 yyyy-MM-dd 형식으로 가공하여 String 타입으로 반환하기 위한 메소드
    public String getDateByString(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(date);
    }
    
    // [사용자] 객실 예약
  	public void addAccomPayment(AccomPayment accomPayment) {
  		// 날짜 형식 가공
//  		String checkIn = accomPayment.getAccomCheckIn();
//  		checkIn = checkIn + " 00:00:00";
//  		String checkOut = accomPayment.getAccomCheckOut();
//  		checkOut = checkOut + " 00:00:00";
//  		
//  		accomPayment.setAccomCheckIn(checkIn);
//  		accomPayment.setAccomCheckOut(checkOut);
//  		
//  		log.debug("[debug] ProductService.addAccomPayment checkIn : " );
  		
  		productMapper.insertAccomPayment(accomPayment);
  	}
  	
  	// 체험 예약
  	// [사용자] 체험 예약 내역 전체 조회
 	public List<String> getActivityReserveDay(int activityNo) {
 		log.debug("[debug] ProductService.getActivityReserveDay activityNo : " + activityNo);
 		
 		// 체크인, 체크아웃 날짜를 list 안의 map 형태로 저장
 		List<Map<String, Object>> map = productMapper.selectActivityReserveDay(activityNo);
 		log.debug("[debug] ProductService.getActivityReserveDay map : " + map);
 		//log.debug("[debug] ProductService.getAccomRoomReserveDay map.get(0) : " + map.get(0).get("accomCheckIn").toString());
 		
 		List<String> reverveDays = new ArrayList<>();
 				  
 		// 반복문을 통해 list 안의 i번째 map 데이터를 가져와
 		// 체크인 날짜로부터 체크아웃 날짜 사이의 (예약 불가능한) 모든 예약 날짜를 하나의 list에 저장
 		for(int i=0; i<map.size(); i++) {
 		  String accomCheckIn = map.get(i).get("accomCheckIn").toString();
 		  String accomCheckOut = map.get(i).get("accomCheckOut").toString();
 		  
 	      int checkInYear = Integer.parseInt(accomCheckIn.substring(0,4));
 	      int checkInMonth= Integer.parseInt(accomCheckIn.substring(5,7));
 	      int checkInDate = Integer.parseInt(accomCheckIn.substring(8,10));

 	      // 체크아웃 날짜를 '-' 없는 int 타입으로 가공하기 위한 코드
 	      String checkOutYear = accomCheckOut.substring(0,4);
 	      String checkOutMonth= accomCheckOut.substring(5,7);
 	      String checkOutDate = accomCheckOut.substring(8,10);
 	      
 	      String checkOut = checkOutYear + checkOutMonth + checkOutDate;

 	      int endDt = Integer.parseInt(checkOut);
 	 
 	      Calendar cal = Calendar.getInstance();
 	         
 	      // Calendar의 Month는 0부터 시작하므로 -1
 	      cal.set(checkInYear, checkInMonth-1, checkInDate);
 	        
 	      while(true) {
 	          log.debug("현재 날짜 출력 "+getDateByString(cal.getTime()));
 	             
 	          // 체크인 날짜로부터 하루씩 증가
 	          cal.add(Calendar.DATE, 1); 

 	          // 반환하기 위한 list에 모든 예약 날짜 저장
 	          reverveDays.add(getDateByString(cal.getTime()));
 	          
 	          // 현재 날짜가 체크아웃 날짜보다 크면 종료 
 	           if(getDateByInteger(cal.getTime()) > endDt) break;
 	      }
 		}
 		return reverveDays;
 	}
     
     // [사용자] 체험 예약
   	public void addActivityPayment(ActivityPayment activityPayment) {
   		// 날짜 형식 가공
//   		String checkIn = accomPayment.getAccomCheckIn();
//   		checkIn = checkIn + " 00:00:00";
//   		String checkOut = accomPayment.getAccomCheckOut();
//   		checkOut = checkOut + " 00:00:00";
//   		
//   		accomPayment.setAccomCheckIn(checkIn);
//   		accomPayment.setAccomCheckOut(checkOut);
//   		
//   		log.debug("[debug] ProductService.addAccomPayment checkIn : " );
   		
   		productMapper.insertActivityPayment(activityPayment);
   	}

 }