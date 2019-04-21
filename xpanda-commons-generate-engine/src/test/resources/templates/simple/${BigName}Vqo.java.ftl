package info.xpanda.web.admin.controller.${LittleModule}.vqo;

import info.xpanda.web.common.vqo.PageQueryVQO;
import lombok.Data;

/**
 * description:
 * copyright:
 *
 * @author Paul Joo
 * @since 20190216
 */
@Data
public class ${BigName}VQO extends PageQueryVQO {
    private Long id;

    <#list columns as column>
	private ${column.FieldType} ${column.FieldName};
	</#list>
}
