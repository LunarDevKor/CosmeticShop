package com.cosmetic.admin.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Random;

import com.cosmetic.admin.dao.IOrderDao;
import com.cosmetic.admin.dao.IShipDao;
import com.cosmetic.admin.dao.OrderDaoImpl;
import com.cosmetic.admin.dao.ShipDaoImpl;
import com.cosmetic.admin.vo.OrderVO;
import com.cosmetic.admin.vo.OutProductVO;
import com.cosmetic.admin.vo.ShipDetailVo;
import com.cosmetic.product.vo.ProdVO;

public class OrderServiceImpl implements IOrderService {

	private static IOrderService orderService = null;

	public OrderServiceImpl() {
	}

	public static IOrderService getInstance() {
		if (orderService == null) {
			orderService = new OrderServiceImpl();
		}

		return orderService;
	}

	IOrderDao orderDao = OrderDaoImpl.getInstance();
	IShipDao shipDao = ShipDaoImpl.getInstance();

	@Override
	public int orderUpdate(OrderVO ov) {

		int cnt = orderDao.orderUpdate(ov); // 주문처리 완료된 주문번호

		int[] array = new Random().ints(10, 0, 11).toArray();

		String uuid = "";
		for (int i : array)
			uuid += i;

		/*
		 * ShipDetailVo sv = ShipDetailVo.builder() .ordNo(ov.getOrdNo())
		 * .recpName(ov.getOrdRecpname()) .recpAddr(ov.getOrdRecpaddr())
		 * .recpTel(ov.getOrdRecptel()) .shipNotice(ov.getOrdShipnotice())
		 * .shipInvoiceno(uuid) .build(); System.out.println(sv);
		 */

		ShipDetailVo sv = ShipDetailVo.builder()
				.shipInvoiceno(Long.parseLong(uuid))
				.ordNo(ov.getOrdNo())
				.build();

		cnt = shipDao.orderInsert(sv);

		return cnt;
	}

	@Override
	public OrderVO compleorderList(OrderVO ov) {

		OrderVO orderVO = orderDao.compleList(ov);

		return orderVO;
	}

	@Override
	public int countList() {
		int countList = 0;
		try {
			countList = orderDao.countList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return countList;
	}

	@Override
	public List<Map<String, Object>> displayAllOrder(Map<String, Object> countMap) {
		
		List<Map<String, Object>> orderList = null;

		try {
			orderList = orderDao.orderList(countMap);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orderList;
	}

	@Override
	public int searchCountList(Map<String, Object> searchMap) {
		int searchCountList = 0;
		try {
			searchCountList = orderDao.searchCountList(searchMap);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return searchCountList;
	}

	@Override
	public List<Map<String, Object>> listSearch(Map<String, Object> searchMap) {
		List<Map<String, Object>> OrderSearchlist = orderDao.listSearch(searchMap);
		return OrderSearchlist;
	}

	@Override
	public List<OrderVO> releaseList() {
		List<OrderVO> list = orderDao.releaseList();
		return list;
	}

	@Override
	public int insertOrder(Map<String, Object> paramMap) {
		return orderDao.insertOrder(paramMap);
	}

	@Override
	public int insertDetailOrder(ProdVO pv) {
		return orderDao.insertDetailOrder(pv);
	}

	
	@Override
	public OutProductVO releaseSearch(String search) {
		OutProductVO ov = orderDao.releaseSearch(search);
		return ov;
	}

	@Override
	public List<Map<String, Object>> releaseListAll(Map<String, Object> countMap) {
		List<Map<String, Object>> list = orderDao.releaseListAll(countMap);
		return list;
	}

	@Override
	public int releaseCountList() {
		int countList = 0;
		try {
			countList = orderDao.releaseCountList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return countList;
	}

	@Override
	public List<OrderVO> getMyHistory(int accNo) {
		return orderDao.getMyHistory(accNo);
	}

	@Override
	public List<OrderVO> getMypageOrderHistory(int accNo) {
		return orderDao.getMypageOrderHistory(accNo);
	}



	
	

}