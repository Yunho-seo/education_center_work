package com.mariadb.addrlist;

import java.io.IOException; //서블릿은 데이터베이스와 웹서버를 연결해준다
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;

@WebServlet("/AddrlistServlet")
public class AddrlistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AddrlistServlet() {
        super();
    
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
		request.setCharacterEncoding("UTF-8");
		String str = request.getParameter("action");
		if (str.equals("select")) {
			AddrlistDAO dao = new AddrlistDAO();
			ArrayList<AddrlistDTO> list = new ArrayList<AddrlistDTO>();
			list = dao.selectAddrlist();
			
			request.setAttribute("addrlist", list);
			
			ServletContext context = this.getServletContext();
			RequestDispatcher dispatcher = context.getRequestDispatcher("showaddrlist.jsp");
			dispatcher.forward(request,response);
		}

		else if (str.equals("insert")) {
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String addr = request.getParameter("addr");
			String email = request.getParameter("email");
			
			AddrlistDTO dto = new AddrlistDTO();
			dto.setName(name);
			dto.setPhone(phone);
			dto.setAddr(addr);
			dto.setEmail(email);
		
			AddristDAO dao = new AddristDAO();
			int result = dao.insertAddr(dto);
			if (result > 0) {
				response.sendRedirect("./Success.html"); 
			} else {
				response.sendRedirect("./Fail.html");
			}
		}
		
		else if (str.equals("Update")){
			int num = Integer.parseInt(request.getParameter("num"));
			String name = request.getParameter("name");
			String phone = request.getParameter("Phone");
			String addr = request.getParameter("Addr");
			String email = request.getParameter("Email");
			
			AddrlistDTO dto = new AddrlistDTO();
			dto.setNum(num);
			dto.setName(name);
			dto.setPhone(phone);
			dto.setAddr(addr);
			dto.setEmail(email);
			//
			AddrlistDAO dao = AddrlistDAO.getConnection();
			dao.update(dto.num);

			PrintWriter out = response.getWriter();

		}
		
		else if (str.equals("delete")) {
			String num = request.getParameter("num");			
			AddrlistDTO dto = new AddrlistDTO();
			dto.setNum(num);			
			AddrlistDAO dao = new AddrlistDAO();
			boolean bool = dao.deleteAddr(dto);
			PrintWriter out = response.getWriter();
			if(bool) {
				response.sendRedirect("./Success.html");	
			} else {
				out.println("삭제 실패");
			}
		}

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doGet(request, response);
	}

}