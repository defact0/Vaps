package com.vaps.controller.vaps.admin.items;

import java.io.PrintWriter;
import java.util.Enumeration;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.vaps.action.ItemsListAction;
import com.vaps.bean.Items;
import com.vaps.controller.Home;
import com.vaps.dao.ItemsDAO;



@Controller
@SessionAttributes("members")
public class I_upload {
	@Resource(name = "itemsDao")
	private ItemsDAO itemsDAO;
	
	@RequestMapping(value = "/itemsUploadForm")
	public String itemsUploadForm(){
		// 상품 등록 폼 이동
		return "items/itemsUpload";
	}
	@SuppressWarnings({ "rawtypes", "unused", "deprecation" })
	@RequestMapping(value = "/itemsUpload")
	public void itemsUpload(HttpServletRequest req, Model model, HttpServletResponse res) {
		try {
			req.setCharacterEncoding("UTF-8");
			res.setContentType("text/html;charset=UTF-8"); 
			ItemsListAction item = new ItemsListAction(itemsDAO);
			Items items = new Items();
			
			// fileUpload setting
			String uploadPath = req.getRealPath("/upload");
			int fileSize = 10*1024*1024; // 10Mbyte
			
			if (Home.session != null && Home.session.getAttribute("id") != "") {
				
				// fileUpload logic
				MultipartRequest multi=new MultipartRequest(req,
															uploadPath,
															fileSize,
															"utf-8",
															new DefaultFileRenamePolicy());
				Enumeration files=multi.getFileNames();
				String file=(String)files.nextElement();
				String fileName=multi.getFilesystemName(file);
				String fileOriginalName=multi.getOriginalFileName(file);
				
				//System.out.println(fileName); //서버에 저장되는 이름
				//System.out.println(fileOriginalName); // 업로드될 파일 이름

				// 상품정보 items객체에 저장
				items.setIs_name(multi.getParameter("i_name"));
				items.setI_name(multi.getParameter("i_name")); //상품이름
				items.setI_category(multi.getParameter("i_category")); //카테고리
				items.setI_price(Integer.parseInt(multi.getParameter("i_price"))); //가격
				items.setIs_count(Integer.parseInt(multi.getParameter("is_count")));// 재고수량
				items.setI_description(multi.getParameter("i_description"));// 설명(제품설명)
				items.setI_pic(fileName);// 이미지

				PrintWriter out = res.getWriter();
				if (item.setItems(items) == 1) { //insert
					item.setItemsTored(items); //재고 등록
					out.println("<script>");
					out.println("location.href='/itemslist'");
					out.println("</script>");
				} else { //failed
					out.println("<script>");
					out.println("alert('상품등록 실패')");
					out.println("location.href='/itemslist'");
					out.println("</script>");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
