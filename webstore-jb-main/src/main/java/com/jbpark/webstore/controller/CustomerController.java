package com.jbpark.webstore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jbpark.webstore.domain.Customers;
import com.jbpark.webstore.service.CustomerService;

@RequestMapping("/market")
@Controller
public class CustomerController {
	@Autowired
	private CustomerService customerService;

	@RequestMapping("/customers")
	public String list(Model model) {
		model.addAttribute("customers", customerService.getAllCustomers());
		return "customers";
	}

	@RequestMapping(value = "/customers/add", method = RequestMethod.GET)
	public String getAddNewCustomerForm(@ModelAttribute("newCustomer") Customers newCustomer) {
		return "addCustomer";
	}

	@RequestMapping(value = "/customers/add", method = RequestMethod.POST)
	public String processAddNewCustomerForm(@ModelAttribute("newCustomer") Customers newCustomer, Model model) {
		try {
			customerService.addCustomer(newCustomer);
			return "redirect:/market/customers";
		}catch(DataAccessException e) {
			String id = newCustomer.getCustomerId()+"는 이미 존재합니다!";
			model.addAttribute("errormessage", id);
			return "addCustomer";
		}
	}
}
