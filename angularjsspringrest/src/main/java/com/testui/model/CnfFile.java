
package com.testui.model ;

import javax.persistence.Entity ;
import javax.persistence.ManyToOne ;
import javax.persistence.JoinColumn ;

import javax.persistence.OneToMany ;
import java.util.List ;

import javax.persistence.Column ;
import javax.persistence.FetchType;
import javax.persistence.GenerationType ;
import javax.persistence.Table ;
import javax.persistence.GeneratedValue ;

import com.common.behaviour.ModelBase ;
import com.common.util.ObjectUtil;
import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.Id ;

@Entity
@Table ( name = "cnf_file" )
public class CnfFile implements ModelBase {

	@Column ( name = "input_directory" , length = 500 )
	private String inputDirectory ;
	
	@Column ( name = "error_directory" , length = 500 )
	private String errorDirectory ;
	
	@Column ( name = "archive_directory" , length = 500 )
	private String archiveDirectory ;
	
	@OneToMany ( mappedBy="file" ) @JsonIgnore
	private List<CnfField> mappings ;
	
	@JoinColumn ( name = "subject_area_id" )
	@ManyToOne(fetch=FetchType.EAGER)
	private CnfSubjectArea subjectArea ;
	
	@Column ( name = "name" , length = 200 )
	private String name ;
	
	@Column ( name = "active" , length = 1 )
	private String active ;
	
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private Integer id ;
	
	public CnfFile() {
	}

	public CnfFile(Integer id) {
		this.id = id;
	}
	
	public String getInputDirectory() {
		return inputDirectory;
	}

	public void setInputDirectory(String inputDirectory) {
		this.inputDirectory = inputDirectory;
	}

	public String getErrorDirectory() {
		return errorDirectory;
	}

	public void setErrorDirectory(String errorDirectory) {
		this.errorDirectory = errorDirectory;
	}

	public String getArchiveDirectory() {
		return archiveDirectory;
	}

	public void setArchiveDirectory(String archiveDirectory) {
		this.archiveDirectory = archiveDirectory;
	}

	public List<CnfField> getMappings() {
		return mappings;
	}

	public void setMappings(List<CnfField> mappings) {
		this.mappings = mappings;
	}

	public CnfSubjectArea getSubjectArea() {
		return subjectArea;
	}

	public void setSubjectArea(CnfSubjectArea subjectArea) {
		this.subjectArea = subjectArea;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Override
	public boolean equals(Object obj) {
		return null != obj && obj instanceof CnfFile 
					&& ObjectUtil.equalOnId(this, (CnfFile)(obj) );
	}
	
	@Override
	public int hashCode() {
		return null != this.id ? id.hashCode() : -1;
	}
}