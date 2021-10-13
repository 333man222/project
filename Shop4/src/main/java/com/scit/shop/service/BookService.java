package com.scit.shop.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scit.shop.dao.BookDao;
import com.scit.shop.vo.Best;
import com.scit.shop.vo.Book;
import com.scit.shop.vo.Result;
import com.scit.shop.vo.Sale;
import com.scit.shop.vo.Wishlist;

@Service
public class BookService {

	@Autowired
	BookDao dao;

	// 상품목록 가져오는 
	public List<Book> bookList() {
		List<Book> list = dao.bookList();
		
		return list;
	}

	// 책 하나에 대한 정보
	public Book bookDetail(int code) {
		Book book = dao.bookDetail(code);
		
		return book;
	}

	public int wishlist(Wishlist wishlist) {
		int result = dao.wishlist(wishlist);
		
		return result;
	}

	public List<Book> wishItemList(String userid) {
		List<Book> list = dao.wishItemList(userid);
		
		return list;
	}

	public void purchaseList(Sale sale) {
	
		 dao.purchaseList(sale);
	}

	public List<Result> purchaseAll(String userid) {
		List<Result> list = dao.purchaseAll(userid);
		return list;
	}

	public int delete(int code) {
		
		int result = dao.delete(code);
		
		return result;
		
		
	}

	public List<Best> bestSeller() {
		List<Best> best = dao.bestSeller();
		return best;
	}

	public void sell(Map<String, Integer> map) {
		dao.sell(map);
	}
}
