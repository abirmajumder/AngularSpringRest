
package com.testui.model ;

import javax.persistence.Column ;
import javax.persistence.Entity ;
import javax.persistence.GenerationType ;
import javax.persistence.Table ;
import javax.persistence.GeneratedValue ;
import javax.persistence.OneToMany ;

import java.util.List ;

import com.common.behaviour.ModelBase ;
import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.Id ;

@Entity
@Table ( name = "cnf_subject_area" )
public class CnfSubjectArea implements ModelBase {

	@Column ( name = "name" , length = 100 )
	private String name ;
	
	@Column ( name = "description" , length = 200 )
	private String description ;
	
	@OneToMany ( mappedBy="subjectArea" ) @JsonIgnore
	private List<CnfFile> files ;
	
	@Column ( name = "active" , length = 1 )
	private String active ;
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private Integer id ;
	
	@Column(name="dependent_subject_area")
	private Integer dependentSubjectArea;
	

	public CnfSubjectArea() {
	}
	public CnfSubjectArea(Integer id) {
		this.id = id;
	}
	public String getActive () {
		return this.active ;
	}
	public void setActive (String active) {
		this.active = active ;
	}
	public Integer getId () {
		return this.id ;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public List<CnfFile> getFiles() {
		return files;
	}
	public void setFiles(List<CnfFile> files) {
		this.files = files;
	}
	public Integer getDependentSubjectArea() {
		return dependentSubjectArea;
	}
	public void setDependentSubjectArea(Integer dependentSubjectArea) {
		this.dependentSubjectArea = dependentSubjectArea;
	}
	public void setId (Integer id) {
		this.id = id ;
	}
}