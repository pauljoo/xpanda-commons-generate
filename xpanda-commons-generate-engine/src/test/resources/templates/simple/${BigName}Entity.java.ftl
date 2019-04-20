package info.xpanda.web.${LittleModule}.dao.entity;

import info.xpanda.web.common.base.dao.entity.BaseEntity;
import lombok.Data;

@Data
public class ${BigName}Entity extends BaseEntity{
	<#list columns as column>
	private ${column.FieldType} ${column.FieldName};
	</#list>

}
