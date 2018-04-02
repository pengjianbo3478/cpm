package cn.obanks.ar.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import cn.obanks.ar.mapper.InvestorAllowedMapper;
import cn.obanks.ar.model.InvestorAllowed;
import cn.obanks.ar.service.InvestorAllowedService;


@Service
public class InvestorAllowedServiceImpl  implements InvestorAllowedService{
	
	@Autowired
	private InvestorAllowedMapper investorAllowedMapper;
	

	@Override
	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	public List<InvestorAllowed> load(long id) {
		if (id == 0) {
			throw new IllegalArgumentException("id为空");
		}
		List<InvestorAllowed> investorAllowed = investorAllowedMapper.load(id);
		return investorAllowed;
	}

	@Override
	public InvestorAllowed detail(InvestorAllowed investorAllowed) {
		return investorAllowedMapper.detail(investorAllowed);
	}
	
	@Override
	public void add(InvestorAllowed investorAllowed) {
		investorAllowedMapper.add(investorAllowed);
	}

	@Override
	public void delete(Long id) {
		investorAllowedMapper.delete(id);
	}

	@Override
	public List<InvestorAllowed> fundsdetail(InvestorAllowed investorAllowed) {
		 List<InvestorAllowed> ss= this.investorAllowedMapper.fundsdetail(investorAllowed);
		return ss;
	}
}
