package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.BankDTO;

@Mapper
public interface BankMapper {
	List<BankDTO> getAllBank();
	int InsertBank(BankDTO bankDTO);
	int withdrawMoney(BankDTO bankDTO);
	int depositMoney(BankDTO bankDTO);
}
