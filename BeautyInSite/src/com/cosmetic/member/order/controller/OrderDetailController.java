package com.cosmetic.member.order.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import com.cosmetic.admin.service.IOrderService;
import com.cosmetic.admin.service.OrderServiceImpl;
import com.cosmetic.member.account.service.IMemberService;
import com.cosmetic.member.account.service.MemberServiceImpl;
import com.cosmetic.member.account.vo.AccountVO;
import com.cosmetic.member.cart.service.CartServiceImpl;
import com.cosmetic.member.cart.service.ICartService;
import com.cosmetic.member.coupon.service.CouponServiceImpl;
import com.cosmetic.member.coupon.service.ICouponService;
import com.cosmetic.member.point.service.IPointService;
import com.cosmetic.member.point.service.PointServiceImpl;
import com.cosmetic.product.vo.ProdVO;
import com.cosmetic.util.Const;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/orderDetail.do")
public class OrderDetailController extends HttpServlet {
	public static final String IMPORT_TOKEN_URL = "https://api.iamport.kr/users/getToken";
	public static final String IMPORT_PAYMENTINFO_URL = "https://api.iamport.kr/payments/find/";
	public static final String KEY = "0767444424244825";
	public static final String SECRET = "rJ1FXhYHnpxBtsQdA4RBLl3ArGJFAphYpqp9gRVTraSrriPQtpUiMPt4Zj8PS71veugsRDy1UoCkT4UB";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		String orderId = req.getParameter("merchant_uid");
//		String token = getImportToken();
//		getPayInfo(token, orderId);
//		-----------------------------------------------------결제정보

		req.getRequestDispatcher("/main/order/orderdetail.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		AccountVO accVO = (AccountVO) req.getSession(false).getAttribute("LOGIN_USER");
		
		String cpNo = req.getParameter("cpNo") == null ? "" : req.getParameter("cpNo");
		int point = req.getParameter("point") == null ? 0 : Integer.parseInt(req.getParameter("point"));
		int pointUse = req.getParameter("point_use") == null ? 0 : Integer.parseInt(req.getParameter("point_use"));
		
		String uid = req.getParameter("uid");
		String paymethod = "";
		String usePoint = "";
		String totalPrice = "";
		String ordRecpName = "";
		String ordRecptel = "";
		String ordShipnotice = "";

		String zipCode = "";
		String addr1 = "";
		String addr2 = "";

		String qty = "";
		String prodNo = "";
		String prodPrice = "";

		int result = 0;
		int cnt = 0;

		Map<String, Object> paramMap = null;
		Map<String, List<ProdVO>> detailMap = null;

		IOrderService orderService = OrderServiceImpl.getInstance();

		for (Map.Entry<String, String[]> map : req.getParameterMap().entrySet()) {

			paramMap = new HashMap<>();
			detailMap = new HashMap<>();

			switch (map.getKey()) {
			case "paymethod":
				if (map.getValue()[0].equals("카카오페이"))
					paymethod = "1";
				else
					paymethod = "0";
				break;
			case "use_point":
				usePoint = map.getValue()[0];
				break;
			case "tot_price":
				totalPrice = map.getValue()[0];
				totalPrice = totalPrice.replace(",", "").replace(" 원", "");
				break;
			case "b_name":
				ordRecpName = map.getValue()[0];
				break;
			case "b_phone":
				ordRecptel = map.getValue()[0];
				break;
			case "memo":
				ordShipnotice = map.getValue()[0];
				break;
			case "b_zip":
				zipCode = map.getValue()[0];
				break;
			case "b_addr1":
				addr1 = map.getValue()[0];
				break;
			case "b_addr2":
				addr2 = map.getValue()[0];
				break;
			}
		}
		paramMap.put("accNo", accVO.getAccNo());
		paramMap.put("uid", Long.parseLong(uid));
		paramMap.put("paymethod", paymethod);
		paramMap.put("usePoint", usePoint);
		paramMap.put("totalPrice", totalPrice);
		paramMap.put("ordRecpName", ordRecpName);
		paramMap.put("ordRecptel", ordRecptel);
		paramMap.put("ordShipnotice", ordShipnotice);
		String addr = "[" + zipCode + "] " + addr1 + " " + addr2;
		paramMap.put("addr", addr);

		System.out.println("PARAM MAP >> " + paramMap);

		result = orderService.insertOrder(paramMap);

		String[] qtyValues = req.getParameterValues("qty");
		String[] prodNameValues = req.getParameterValues("prodName");
		String[] prodNoValues = req.getParameterValues("prodNo");
		String[] prodPriceValues = req.getParameterValues("prodPrice");
		String[] prodImgValues = req.getParameterValues("prodImg");
		String[] grdAccrValues = req.getParameterValues("grdAccr");

		List<ProdVO> prodList = detailMap.getOrDefault("products", new ArrayList<>()); 
		
		for (int i = 0; i < qtyValues.length; i++) {
			ProdVO pv = new ProdVO();
			pv.setProdNo(Long.parseLong(prodNoValues[i]));
			pv.setProdName(prodNameValues[i]);
			pv.setProdPrice(Long.parseLong(prodPriceValues[i]));
			pv.setProdImg(prodImgValues[i]);
			pv.setCartQty(Long.parseLong(qtyValues[i]));
			pv.setGrdAccr(Long.parseLong(grdAccrValues[i]));
			
			
			if (result > 0) {
					pv.setUid(Long.parseLong(uid));
					cnt = orderService.insertDetailOrder(pv);
			}
			
			prodList.add(pv);
			detailMap.put("products", prodList);
			
		}
		
		if (cnt > 0) {
			req.setAttribute("ORDERSUCCESS", Const.SUCCESS.getVal());
			req.setAttribute("paramMap", paramMap);
			req.setAttribute("detailMap", detailMap);
			
			ICartService cartService = CartServiceImpl.getInstance();
			cartService.cartClear(String.valueOf(accVO.getAccNo()));
			
			if(cpNo != null && cpNo != "") {
				ICouponService couponService = CouponServiceImpl.getInstance();
				Map<String,Object> map = new HashMap<String, Object>();
				map.put("cpNo", cpNo);
				map.put("accNo", accVO.getAccNo());
				int used = couponService.couponUse(map);
			}
			
			if(point > 0) {
				IPointService pointService = PointServiceImpl.getInstance();
				Map<String,Object> map = new HashMap<String, Object>();
				map.put("point", point);
				map.put("accNo", accVO.getAccNo());
				map.put("pointUse", pointUse);
				int used = pointService.accruePoint(map);
			}
			
			req.getRequestDispatcher("/main/order/orderdetail.jsp").forward(req, resp);
		} else {
			req.setAttribute("ORDERFAIL", Const.FAILURE.getVal());
			resp.sendRedirect(req.getContextPath() + "/index.do");
		}

	}

	public void getPayInfo(String token, String orderId) {

		HttpClient client = HttpClientBuilder.create().build();
		HttpGet get = new HttpGet(IMPORT_PAYMENTINFO_URL + orderId + "/paid");
		get.setHeader("Authorization", token);

		try {
			HttpResponse res = client.execute(get);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			JsonNode resNode = rootNode.get("response");

//        System.out.println(resNode.get("buyer_name").asText()); // 구매자 이름
//        System.out.println(resNode.get("buyer_tel").asText()); // 구매자 전화번호
//        System.out.println(resNode.get("buyer_email").asText()); // 구매자 이메일
//        System.out.println(resNode.get("buyer_addr").asText()); // 구매자 주소
//        System.out.println(resNode.get("buyer_postcode").asText()); // 구매자 우편번호
//        System.out.println(resNode.get("paid_at").asText()); // 결제시간
//        System.out.println(resNode.get("name").asText()); // 상품 이름
//        System.out.println(resNode.get("imp_uid").asText()); // 고유값?
//        System.out.println(resNode.get("merchant_uid").asText()); // 주문번호
//        System.out.println(resNode.get("amount").asText()); // 가격
//        System.out.println(resNode.get("status").asText()); // paid = 결제성공

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getImportToken() {
		String result = "";
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(IMPORT_TOKEN_URL);

		Map<String, String> m = new HashMap<String, String>();
		m.put("imp_key", KEY);
		m.put("imp_secret", SECRET);

		List<NameValuePair> pair = new ArrayList<NameValuePair>();
		pair.add(new BasicNameValuePair("imp_key", KEY));
		pair.add(new BasicNameValuePair("imp_secret", SECRET));
		try {
			post.setEntity(new UrlEncodedFormEntity(pair));
			HttpResponse res = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			JsonNode resNode = rootNode.get("response");
			result = resNode.get("access_token").asText();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

}
