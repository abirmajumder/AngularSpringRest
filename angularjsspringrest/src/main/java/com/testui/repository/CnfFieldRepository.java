package com.testui.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.testui.model.CnfField;

@RepositoryRestResource(collectionResourceRel = "fields", path = "fields")
public interface CnfFieldRepository extends JpaRepository<CnfField, Integer>{

}
