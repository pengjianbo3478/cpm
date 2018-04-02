package cn.obanks.ar.mapper;


import org.springframework.stereotype.Repository;

import cn.obanks.ar.model.AssetsViewJournal;

@Repository
public interface AssetsViewJournalMapper {
	void add(AssetsViewJournal assetsViewJournal);

	long searchSameView(AssetsViewJournal assetsViewJournal);
}