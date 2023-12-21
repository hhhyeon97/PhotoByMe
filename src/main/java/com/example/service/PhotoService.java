package com.example.service;

import java.util.List;

import com.example.vo.PhotoVO;

public interface PhotoService {

	List<PhotoVO> getAllPhotos();

	void uploadPhoto(PhotoVO photo);

}
