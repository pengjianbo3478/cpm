package cn.obanks.ar.service;

import java.util.List;
import cn.obanks.ar.model.InvestorAllowed;

public interface InvestorAllowedService {
	List<InvestorAllowed> load(long id);

	InvestorAllowed detail(InvestorAllowed investorAllowed);
	
	List<InvestorAllowed> fundsdetail(InvestorAllowed  investorAllowed);

	void add(InvestorAllowed investorAllowed);
	void delete(Long id);
}
