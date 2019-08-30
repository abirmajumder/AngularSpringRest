package com.testui.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.testui.model.Doctor;

@RepositoryRestResource(collectionResourceRel = "doctors", path = "doctors")
public interface DoctorRepository extends JpaRepository<Doctor, Integer> {
	List<Doctor> findByQualification( @Param("q")String q ); 
}
