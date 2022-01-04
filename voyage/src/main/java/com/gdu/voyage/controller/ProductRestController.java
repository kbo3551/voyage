package com.gdu.voyage.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gdu.voyage.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@CrossOrigin
public class ProductRestController {
	@Autowired ProductService productService;

   @GetMapping("/accomRoomReserveDay")
   public List<String> getAccomRoomReserveDay(int accomRoomNo) {
	  log.debug("ProductRestController.getAccomRoomReservae 실행");
	  log.debug("ProductRestController.getAccomRoomReservae accomRoomNo : "+accomRoomNo);
      
	  // 해당 객실의 전체 예약일(예약 불가능) 조회
	  List<String> reserveDays = productService.getAccomRoomReserveDay(accomRoomNo);
	  log.debug("[debug] ProductController.getAccomRoomReserveDay reserveDays : " + reserveDays);
	  //log.debug("[debug] ProductController.getAccomRoomReserveDay dayMap.get(0) : " + dayMap.get(0));
	  //log.debug("[debug] ProductController.getAccomRoomReserveDay dayMap.size() : " + dayMap.size());

      return reserveDays;
   }
   
}