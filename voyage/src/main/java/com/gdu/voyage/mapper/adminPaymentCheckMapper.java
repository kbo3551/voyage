package com.gdu.voyage.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface adminPaymentCheckMapper {
	//결제 건
	int selectActivityUsePersonByAdmin();
	int selectAccomUsePersonByAdmin();
	int selectActivityUsePersonByAdminYear();
	int selectAccomUsePersonByAdminYear();
	
	int selectActivityUsePersonByAdminAll();
	int selectAccomUsePersonByAdminAll();
	//수익
	long selectActivityProfitByAdmin();
	long selectAccomProfitOneByAdmin();
	long selectActivityProfitByAdminYear();
	long selectAccomProfitOneByAdminYear();
	
	//날짜
	String selectMonth(int countMonth);
	
	int selectActivityProfitByAdminMonthYear(String month);
	int selectAccomProfitOneByAdminMonthYear(String month);
}