package info.xpanda.web.admin.controller.${LittleModule}.vo;

import lombok.Data;

import java.util.Date;

@Data
public class ${BigName}VO {
    private Long id;

    private Date updateTime;
	
	<#list columns as column>
	private ${column.FieldType} ${column.FieldName};
	</#list>
}
