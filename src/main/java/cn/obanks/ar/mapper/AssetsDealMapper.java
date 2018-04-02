package cn.obanks.ar.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.obanks.ar.model.AssetsDeal;
import cn.obanks.common.Paginate;

@Repository
public interface AssetsDealMapper {

	void add(AssetsDeal assetsDeal);

	AssetsDeal load(long id);

	void merge(AssetsDeal assetsDeal);

	long countCellAssets(Paginate paginate);

	List<AssetsDeal> search(Paginate paginate);

	AssetsDeal detail(AssetsDeal assetsDeal);

	List<AssetsDeal> searchcellAssets(Paginate paginate);

	AssetsDeal loadInvester(AssetsDeal assetsDeal);

	// AssetsDeal assetStatusCount(AssetsDeal assetsDeal);

	List<AssetsDeal> assetStatusCount(Paginate paginate);

	long count(Paginate paginate);

	AssetsDeal loadAssetsDeal(AssetsDeal assetsDeal);

	void updateStatus(AssetsDeal assetsDeal);
	
	void updateAmount(AssetsDeal assetsDeal);
}