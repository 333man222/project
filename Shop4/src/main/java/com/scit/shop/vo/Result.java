package com.scit.shop.vo;

import lombok.Data;

@Data
public class Result {	
	private String userid;
	private String purchasedate;
	private int code;
	private String title;
	private int price;
	private int cnt;
	private int cal;
}
