package info.xpanda.web.${LittleModule}.service.bqo;

import info.xpanda.web.common.bqo.PageQueryBQO;
import lombok.Data;

/**
 * description:
 * copyright:
 *
 * @author Paul Joo
 * @since 20190216
 */
@Data
public class ${BigName}Bqo extends PageQueryBQO {
    private Long id;

	<#list columns as column>
	private ${column.FieldType} ${column.FieldName};
	</#list>

    private Long operator;
}
