package cn.obanks.ar.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.MapKey;
import org.springframework.stereotype.Repository;


import cn.obanks.ar.model.AssetsConcern;
import cn.obanks.common.Paginate;

@Repository
public interface AssetsConcernMapper {
	void add(AssetsConcern assetsConcern);// 添加数据

	AssetsConcern load(long id);// 根据id查询

	void remove(long id);

	List<AssetsConcern> search(Paginate paginate);

	long count(Paginate paginate);
	
	@MapKey(value = "id")
	Map<Long,AssetsConcern> query(Paginate paginate);

	long queryCount(Paginate paginate);

	boolean concern(AssetsConcern assetsConcern);
	
	AssetsConcern detail(long id);

	boolean mergeDeletedFlag(AssetsConcern assetsConcern);
	
	AssetsConcern detail(AssetsConcern assetsConcern);
	
	void changeConcernFlag(AssetsConcern assetsConcern);
	
	AssetsConcern loadConcern(AssetsConcern assetsConcern);

}