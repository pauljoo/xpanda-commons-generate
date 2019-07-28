package info.xpanda.web.tushare.entity;

import info.xpanda.web.common.base.dao.entity.BaseEntity;
import lombok.Data;

/**
 * description:
 * copyright:
 *
 * @author Paul Joo
 * @since 20190227
 */
@Data
public class ${BigName}Entity extends BaseEntity {
    <#list columns as column>
    /**
    * ${column.Description}
    */
    private ${column.FieldType} ${column.FieldName};
    </#list>
}
