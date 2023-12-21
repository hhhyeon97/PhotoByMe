package com.example.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.vo.PhotoVO;

public interface PhotoRepository extends JpaRepository<PhotoVO, Integer> {

}
