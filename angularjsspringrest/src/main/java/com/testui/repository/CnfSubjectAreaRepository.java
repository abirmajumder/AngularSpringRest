package com.testui.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.testui.model.CnfSubjectArea;

@RepositoryRestResource(collectionResourceRel = "areas", path = "areas")
public interface CnfSubjectAreaRepository extends JpaRepository<CnfSubjectArea, Integer>  {
	List<CnfSubjectArea> findByNameIgnoreCase(@Param("name")String name);
} 
