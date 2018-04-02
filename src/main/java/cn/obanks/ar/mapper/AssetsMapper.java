package cn.obanks.ar.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.MapKey;
import org.springframework.stereotype.Repository;

import cn.obanks.ar.model.Assets;
import cn.obanks.common.Paginate;
@Repository
public interface AssetsMapper {

	Assets load(long id);
	
	void add(Assets assets);

	void merge(Assets assets);

	long count(Paginate paginate);
	
	long countAssets(Paginate paginate);
	
	List<Assets> searchAssets(Paginate paginate);

//	List<Assets>search(Paginate paginate);
	@MapKey(value = "id")
	Map<Long, Assets>search(Paginate paginate);
	
	void changeOfferFlag(Assets assets);
	
	List<Assets> searchAssets2(Paginate paginate);
	
	long countCellAssets(Paginate paginate);

	void mergestatus(Assets assets);
	
	void mergeAssetsStatus(Assets assets);
	
	void mergeTime(Assets assets);
	
	Assets searchTotal(Assets assets);
	
	
}