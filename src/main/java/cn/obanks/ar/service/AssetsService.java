package cn.obanks.ar.service;

import java.util.List;
import org.springframework.web.multipart.MultipartFile;
import cn.obanks.ar.controller.AssetsVo;
import cn.obanks.ar.model.Assets;
import cn.obanks.common.Paginate;

public interface AssetsService {
	Assets load(long id);

	void add(Assets assets,List<String> list,MultipartFile[] myfile,String path);
	
	void add(Assets assets);

	void merge(Assets assets, List<String> list,MultipartFile[] myfile,String path);
	

//	Assets detail(Paginate paginate,long id);

	Paginate searchAssets(Assets assets, Paginate paginate);

	Paginate search(AssetsVo assetsVo, Paginate paginate);
	
	void changeOfferFlag(Assets assets);
	
	void add(Assets assets, MultipartFile[] myfiles, String path);

	
	void changeOfferFlags(List<Long> assetsId);
	
	void mergeAssetsStatus(Assets assets);
	
	void mergeTime(Assets assets);

	void mergestatus(long id);    

	Assets searchTotal(Assets assets);
	
	void updateRemind(List<Long> assetsId);

	void updateRemindOne(long id);
//	public Assets searchName(String name,Long userId);
}
