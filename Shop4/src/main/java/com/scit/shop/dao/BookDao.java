package com.scit.shop.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.shop.vo.Best;
import com.scit.shop.vo.Book;
import com.scit.shop.vo.Result;
import com.scit.shop.vo.Sale;
import com.scit.shop.vo.Wishlist;

@Repository
public class BookDao {

	@Autowired
	SqlSession session;

	/**
	 * 온라인서점에서 판매하는 모든 책의 정보를 얻어옴
	 * @return : list : 모든 책의 정보가 담긴 객체
	 */
	public List<Book> bookList() {
		BookMapper mapper = session.getMapper(BookMapper.class);
		
		List<Book> list = null;
		
		try {
			list = mapper.selectAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	/**
	 * 
	 * @param code : 책코드(상품코드)
	 * @return 책 코드에 해당하는 책정보
	 */
	public Book bookDetail(int code) {
		BookMapper mapper = session.getMapper(BookMapper.class);
		
		Book book = null;
		
		try {
			book = mapper.detailBook(code);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return book;
	}

	// 관심상품 저장!!!
	public int wishlist(Wishlist wishlist) {
		BookMapper mapper = session.getMapper(BookMapper.class);
		
		int result = 0;
		
		try {
			result = mapper.wishList(wishlist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public List<Book> wishItemList(String userid) {
		BookMapper mapper = session.getMapper(BookMapper.class);
		
		List<Book> list = null;
		
		try {
			list = mapper.wishItemList(userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public void purchaseList(Sale sale) {
		BookMapper mapper = session.getMapper(BookMapper.class);
		
		
		try {
			 mapper.purchaseList(sale);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public List<Result> purchaseAll(String userid) {
	BookMapper mapper = session.getMapper(BookMapper.class);
		
		List<Result> list = null;
		
		try {
			list = mapper.purchaseAll(userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	
	}

	public int delete(int code) {
		BookMapper mapper = session.getMapper(BookMapper.class);
		
		int result = 0;
		
		try {
			result = mapper.delete(code);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public List<Best> bestSeller() {
	BookMapper mapper = session.getMapper(BookMapper.class);
		
		List<Best> best = null;
		
		try {
			best = mapper.bestSeller();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return best;
	}

	public void sell(Map<String, Integer> map) {
	BookMapper mapper = session.getMapper(BookMapper.class);
		
		
		try {
			 mapper.sell(map);
		} catch (Exception e) {
			e.printStackTrace();
		}			
	}

}
