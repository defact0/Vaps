package com.vaps.home;

import java.io.PrintWriter;
import java.util.Enumeration;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.vaps.action.BoardListAction;
import com.vaps.action.ItemsListAction;
import com.vaps.bean.BoardList;
import com.vaps.bean.Items;
import com.vaps.dao.ItemsDAO;


/**
 * 세션은 HomeController.session 으로 쓰세요
 */
@Controller
@SessionAttributes("members")
public class SalesController{
	@Resource(name = "itemsDao")
	private ItemsDAO itemsDAO;

//--------------------------------------------------------------
// 판매 관리 
	@RequestMapping(value = "/CartList")
	public String CartList() {
		//장바구니
		return "sales/CartList";
	}
	@RequestMapping(value = "/TodayList")
	public String TodayList() {
		//오늘 본 상품
		return "sales/TodayList";
	}

}
