package info.xpanda.web.${LittleModule}.service.bo;

import lombok.Data;

import java.util.Date;

/**
 * description:
 * copyright:
 *
 * @author Paul Joo
 * @since 20190216
 */
@Data
public class ${BigName}BO {
    private Long id;

	private Date updateTime;
	
	<#list columns as column>
	private ${column.FieldType} ${column.FieldName};
	</#list>
}
