package com.example.demo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.BankDTO;
import com.example.demo.service.BankService;

@Controller
public class BankController {
	@Autowired
	private BankService bankService;
	
	@GetMapping("/bank")
	public String showBank(Model model) {
		List<BankDTO> bankList = bankService.getAllBank();
		model.addAttribute("bankList", bankList);
		return "bank";
	}
	@PostMapping("/bank")
	public String handleBank(@ModelAttribute BankDTO bankDTO, 
			@RequestParam("action") String action) {
		if("regist".equals(action)) {
			bankService.InsertBank(bankDTO);
		}
		else if ("withdraw".equals(action)) {
			bankService.withdrawMoney(bankDTO);
		}
		else if("deposit".equals(action)) {
			bankService.depositMoney(bankDTO);
		}
		return "redirect:/bank";
	}

}
