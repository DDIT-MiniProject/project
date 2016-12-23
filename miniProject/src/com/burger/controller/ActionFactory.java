/*package com.burger.controller;

import com.burger.admin.controller.action.AdminIndexAction;
import com.burger.admin.controller.action.AdminLoginAction;
import com.burger.admin.controller.action.AdminLogoutAction;
import com.burger.admin.controller.action.AdminMainAction;
import com.burger.admin.controller.action.AdminMemberListAction;
import com.burger.admin.controller.action.AdminOrderListAction;
import com.burger.admin.controller.action.AdminOrderSaveAction;
import com.burger.admin.controller.action.AdminOrderSearchListAction;
import com.burger.admin.controller.action.AdminProductDetailAction;
import com.burger.admin.controller.action.AdminProductListAction;
import com.burger.admin.controller.action.AdminProductSearchAction;
import com.burger.admin.controller.action.AdminProductUpdateAction;
import com.burger.admin.controller.action.AdminProductUpdateFormAction;
import com.burger.admin.controller.action.AdminProductWriteAction;
import com.burger.admin.controller.action.AdminProductWriteFormAction;
import com.burger.admin.controller.action.AdminQnaDetailAction;
import com.burger.admin.controller.action.AdminQnaListAction;
import com.burger.admin.controller.action.AdminQnaResaveAction;
import com.burger.controller.action.Action;
import com.burger.controller.action.CartDeleteAction;
import com.burger.controller.action.CartInsertAction;
import com.burger.controller.action.CartListAction;
import com.burger.controller.action.ContractAction;
import com.burger.controller.action.FindZipNumAction;
import com.burger.controller.action.IdCheckFormAction;
import com.burger.controller.action.IndexAction;
import com.burger.controller.action.JoinAction;
import com.burger.controller.action.JoinFormAction;
import com.burger.controller.action.LoginAction;
import com.burger.controller.action.LoginFormAction;
import com.burger.controller.action.LogoutAction;
import com.burger.controller.action.MyPageAction;
import com.burger.controller.action.OrderAllAction;
import com.burger.controller.action.OrderDetailAction;
import com.burger.controller.action.OrderInsertAction;
import com.burger.controller.action.OrderListAction;
import com.burger.controller.action.ProductDetailAction;
import com.burger.controller.action.ProductKindAction;
import com.burger.controller.action.QnaListAction;
import com.burger.controller.action.QnaViewAction;
import com.burger.controller.action.QnaWriteAction;
import com.burger.controller.action.QnaWriteFormAction;

public class ActionFactory {
	private static ActionFactory instance = new ActionFactory();

	private ActionFactory() {
	}

	public static ActionFactory getInstance() {
		return instance;
	}

	public Action getAction(String command) {
		Action action = null;
		System.out.println("ActionFactory :" + command);
		if (command.equals("index")) {
			action = new IndexAction();
		} else if (command.equals("product_detail")) {
			action = new ProductDetailAction();
		} else if (command.equals("catagory")) {
			action = new ProductKindAction();
		} else if (command.equals("contract")) {
			action = new ContractAction();
		} else if (command.equals("join_form")) {
			action = new JoinFormAction();
		} else if (command.equals("id_check_form")) {
			action = new IdCheckFormAction();
		} else if (command.equals("find_zip_num")) {
			action = new FindZipNumAction();
		} else if (command.equals("join")) {
			action = new JoinAction();
		} else if (command.equals("login_form")) {
			action = new LoginFormAction();
		} else if (command.equals("login")) {
			action = new LoginAction();
		} else if (command.equals("logout")) {
			action = new LogoutAction();
		} else if (command.equals("cart_insert")) {
			action = new CartInsertAction();
		} else if (command.equals("cart_list")) {
			action = new CartListAction();
		} else if (command.equals("cart_delete")) {
			action = new CartDeleteAction();
		} else if (command.equals("order_insert")) {
			action = new OrderInsertAction();
		} else if (command.equals("order_list")) {
			action = new OrderListAction();
		} else if (command.equals("mypage")) {
			action = new MyPageAction();
		} else if (command.equals("order_detail")) {
			action = new OrderDetailAction();
		} else if (command.equals("order_all")) {
			action = new OrderAllAction();
		} else if (command.equals("qna_list")) {
			action = new QnaListAction();
		} else if (command.equals("qna_write_form")) {
			action = new QnaWriteFormAction();
		} else if (command.equals("qna_write")) {
			action = new QnaWriteAction();
		} else if (command.equals("qna_view")) {
			action = new QnaViewAction();
		}

		// admin
		if (command.equals("admin_login_form")) {
			action = new AdminIndexAction();
		} else if (command.equals("admin_login")) {
			action = new AdminLoginAction();
		} else if (command.equals("admin_logout")) {
			action = new AdminLogoutAction();
		} else if (command.equals("admin_product_list")) {
			action = new AdminProductListAction();
		} else if (command.equals("admin_product_write_form")) {
			action = new AdminProductWriteFormAction();
		} else if (command.equals("admin_product_search")){
			action = new AdminProductSearchAction();
		} else if (command.equals("admin_product_write")) {
			action = new AdminProductWriteAction();
		} else if (command.equals("admin_product_detail")) {
			action = new AdminProductDetailAction();
		} else if (command.equals("admin_product_update_form")) {
			action = new AdminProductUpdateFormAction();
		} else if (command.equals("admin_product_update")) {
			action = new AdminProductUpdateAction();
		} else if (command.equals("admin_order_search")) {
			action = new AdminOrderSearchListAction();
		} else if (command.equals("admin_order_list")) {
			action = new AdminOrderListAction();
		} else if (command.equals("admin_order_save")) {
			action = new AdminOrderSaveAction();
		} else if (command.equals("admin_member_list")) {
			action = new AdminMemberListAction();
		} else if (command.equals("admin_qna_list")) {
			action = new AdminQnaListAction();
		} else if (command.equals("admin_qna_detail")) {
			action = new AdminQnaDetailAction();
		} else if (command.equals("admin_qna_repsave")) {
			action = new AdminQnaResaveAction();
		} else if (command.equals("admin_Form")){
			action = new AdminMainAction();
		}
		return action;
	}
}
*/
