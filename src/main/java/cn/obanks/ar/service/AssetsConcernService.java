package cn.obanks.ar.service;

import java.util.List;

import cn.obanks.ar.model.AssetsConcern;
import cn.obanks.common.Paginate;

public interface AssetsConcernService {
	void add(AssetsConcern assetsConcern);// 添加数据

	AssetsConcern load(long id);// 根据id查询

	void remove(long id);
	
	void mergeDeletedFlag(long id);

	Paginate search(AssetsConcern assetsConcern, Paginate paginate);
	
	Paginate query(AssetsConcern assetsConcern, Paginate paginate);

	void changeConcernFlag(AssetsConcern assetsConcern);
	
	AssetsConcern detail(AssetsConcern assetsConcern);
	
	void changeConcernFlags(List<Long> assetsId);
	
	void cancelConcernFlag(AssetsConcern assetsConcern);

}
