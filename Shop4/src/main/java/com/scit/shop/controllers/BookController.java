package com.scit.shop.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scit.shop.service.BookService;
import com.scit.shop.vo.Best;
import com.scit.shop.vo.Book;
import com.scit.shop.vo.Sale;
import com.scit.shop.vo.Wishlist;
import com.scit.shop.vo.Result;

@Controller
public class BookController {

	@Autowired
	BookService service;
	@Autowired
	HttpSession session;

	// 상품목록
	@RequestMapping("/booklist")
	public String bookList(Model model) {

		List<Book> list = service.bookList(); 
		// System.out.println(list);

		model.addAttribute("list", list);

		return "book/booklist";
	}

	// 주문정보 : 로그인한 사람만 가능
	@RequestMapping("/orderlist")
	public String orderList(Model model) {
		// DB에서 책정보를 끌어온다.

		String userid = (String)session.getAttribute("loginId");
		int result=0;

		List<Result> list = service.purchaseAll(userid); 
		model.addAttribute("list" , list);

		for(int i=0; i<list.size(); i++) {
			result += list.get(i).getCal();
		}
		model.addAttribute("ham", result);

		return "book/orderlist";
	}

	// 위시리스트
	@RequestMapping("/wishlist")
	public String wishList(Wishlist wishlist, HttpSession session) {
		String userid = (String)session.getAttribute("loginId");

		wishlist.setUserid(userid);

		service.wishlist(wishlist);

		return "redirect:booklist";
	}

	// 관심상품 목록을 출력
	@RequestMapping("wishitemlist")
	public String wishItemList(Model model, HttpSession session) {
		String userid = (String)session.getAttribute("loginId");

		List<Book> list = service.wishItemList(userid);
		model.addAttribute("list", list);

		return "book/wishitemlist";
	}

	@RequestMapping("/delete")
	public String delete(int code) {

		String userid = (String)session.getAttribute("loginId");
		service.wishItemList(userid);
		
		service.delete(code);

		return "redirect:wishitemlist";
	}


	@RequestMapping("/bestSeller")
	public String bestseller(Model model) {
		List<Best> b = service.bestSeller();
		model.addAttribute("best", b.get(0));
		return "book/bestseller";
	}

	@RequestMapping("/detailbook")
	public String detailbook(int code, Model model) {
		Book book = service.bookDetail(code);

		model.addAttribute("book", book);

		return "book/bookdetail";
	}	

	@RequestMapping(value ="/purchase" , method=RequestMethod.POST)
	public String purchaseList(Sale sale, int code, int cnt) {

		String userid = (String)session.getAttribute("loginId");
		sale.setUserid(userid);
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("code", code);
		map.put("count", cnt);
		service.purchaseList(sale);
		service.sell(map);
		return "success";
	}
}








