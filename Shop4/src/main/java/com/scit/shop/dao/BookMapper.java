package com.scit.shop.dao;

import java.util.List;
import java.util.Map;

import com.scit.shop.vo.Best;
import com.scit.shop.vo.Book;
import com.scit.shop.vo.Result;
import com.scit.shop.vo.Sale;
import com.scit.shop.vo.Wishlist;

public interface BookMapper {
	// 상품목록
	public List<Book> selectAll() throws Exception;
	
	// 베스트 셀러
	public List<Best> bestSeller()throws Exception;	
	// 위시리스트 저장
	public int wishList(Wishlist wishlist) throws Exception;
	
	// 위시리스트 목록 출력
	public List<Book> wishItemList(String userid) throws Exception;

	
	// 책 상세정보
	public Book detailBook(int code) throws Exception;
	
	// 구매정보 저장
	public void purchaseList (Sale sale) throws Exception;
	
	// 구매정보 목록 출력
	public List<Result> purchaseAll(String userid) throws Exception;
	
	//위시리스트 목록에서 삭제
	public int delete(int code)throws Exception;


	public void sell(Map<String, Integer> map)throws Exception;
	
	

}
