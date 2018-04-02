package cn.obanks.ar.mapper;

import java.util.List;
import org.springframework.stereotype.Repository;
import cn.obanks.ar.model.InvestorAllowed;
@Repository
public interface InvestorAllowedMapper {
	
	List<InvestorAllowed> load(long id);
	
	InvestorAllowed detail(InvestorAllowed investorAllowed);
	
	List<InvestorAllowed> fundsdetail(InvestorAllowed  investorAllowed);

	void add(InvestorAllowed investorAllowed);

	void delete(Long id);
}