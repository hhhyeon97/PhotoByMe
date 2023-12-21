package com.example.dao;

import java.util.List;

import com.example.vo.PhotoVO;

public interface PhotoDAO {

	List<PhotoVO> getAllPhotos();

	void uploadPhoto(PhotoVO photo);

}
