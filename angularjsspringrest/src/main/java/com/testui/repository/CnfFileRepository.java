package com.testui.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.testui.model.CnfFile;

@RepositoryRestResource(collectionResourceRel = "files", path = "files")
public interface CnfFileRepository extends JpaRepository<CnfFile, Integer> {

}
