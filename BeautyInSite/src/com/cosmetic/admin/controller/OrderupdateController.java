package com.cosmetic.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cosmetic.admin.service.IOrderService;
import com.cosmetic.admin.service.IShipService;
import com.cosmetic.admin.service.OrderServiceImpl;
import com.cosmetic.admin.service.ShipServiceImpl;
import com.cosmetic.admin.vo.OrderVO;
import com.cosmetic.util.Const;

@WebServlet("/admin/updatelist.do")
public class OrderupdateController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String[] checkList = req.getParameterValues("ordercheckbox");

		IOrderService orderService = OrderServiceImpl.getInstance();
		IShipService shipService = ShipServiceImpl.getInstance();

		/* List<OrderVO> orderList = orderService.displayAllOrder(); */

		OrderVO ov = null;
		int cnt = 0;
		// checkList가 null이 아니고 길이가 1 이상인 경우에만 처리
		
		if (checkList != null && checkList.length > 0) {

			for (String orderNo : checkList) {
				// 각 체크박스의 값에 대한 처리
				ov = OrderVO.builder().ordNo(Long.parseLong(orderNo)).build();

				System.out.println(ov);

				cnt = orderService.orderUpdate(ov);

			}

		}

		System.out.println(cnt);
		if (cnt > 0) { // 성공했을때
			req.getSession().setAttribute("success", Const.SUCCESS.getVal());

		} else { // 실패했을때
			req.getSession().setAttribute("shipFail", Const.FAILURE.getVal());
		}

		/* req.setAttribute("orderList", orderList); */

		resp.sendRedirect(req.getContextPath() + "/admin/orderlist.do");
	}
}
