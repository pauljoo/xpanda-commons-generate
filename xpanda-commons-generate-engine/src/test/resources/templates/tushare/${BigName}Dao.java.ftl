package info.xpanda.web.tushare.dao;

import info.xpanda.web.tushare.entity.${BigName}Entity;
/**
 * @author Paul Jiang
 * @since 20190727
 */
public interface ${BigName}Dao {
    int insert(${BigName}Entity entity);

    int update(${BigName}Entity entity);

    ${BigName}Entity getById(Long id);
}
