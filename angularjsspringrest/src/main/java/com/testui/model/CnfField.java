
package com.testui.model ;

import javax.persistence.Column ;
import javax.persistence.Entity ;
import javax.persistence.GenerationType ;
import javax.persistence.ManyToOne ;
import javax.persistence.Table ;
import javax.persistence.GeneratedValue ;
import javax.persistence.JoinColumn ;
import com.common.behaviour.ModelBase ;
import javax.persistence.Id ;

@Entity
@Table ( name = "cnf_field" )
public class CnfField implements ModelBase {

	@Column ( name = "validation_regex" , length = 200 )
	private String validationRegex ;
	
	@ManyToOne
	@JoinColumn ( name = "file_id" )
	private CnfFile file ;
	
	@Column ( name = "active" , length = 1 )
	private String active ;

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private Integer id ;
	
	@Column ( name = "db_column_name" , length = 100 )
	private String dbColumnName;
	
	@Column ( name = "csv_column_name" , length = 100 )
	private String csvColumnName;
	
	@Column ( name = "csv_column_type" , length = 100 )
	private String csvColumnType;
	
	@Column ( name = "mapping_type" , length = 100 )
	private String mappingType;
	
	@Column ( name = "mapping_detail" , length = 1000 )
	private String mappingDetail;
	
	@Column ( name = "max_length" )
	private int maxLength ;
	
	public String getValidationRegex() {
		return validationRegex;
	}

	public void setValidationRegex(String validationRegex) {
		this.validationRegex = validationRegex;
	}

	public CnfFile getFile() {
		return file;
	}

	public void setFile(CnfFile file) {
		this.file = file;
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

	public String getDbColumnName() {
		return dbColumnName;
	}

	public void setDbColumnName(String dbColumnName) {
		this.dbColumnName = dbColumnName;
	}

	public String getCsvColumnName() {
		return csvColumnName;
	}

	public void setCsvColumnName(String csvColumnName) {
		this.csvColumnName = csvColumnName;
	}

	public String getCsvColumnType() {
		return csvColumnType;
	}

	public void setCsvColumnType(String csvColumnType) {
		this.csvColumnType = csvColumnType;
	}

	public String getMappingType() {
		return mappingType;
	}

	public void setMappingType(String mappingType) {
		this.mappingType = mappingType;
	}

	public String getMappingDetail() {
		return mappingDetail;
	}

	public void setMappingDetail(String mappingDetail) {
		this.mappingDetail = mappingDetail;
	}

	public int getMaxLength() {
		return maxLength;
	}

	public void setMaxLength(int maxLength) {
		this.maxLength = maxLength;
	}

}