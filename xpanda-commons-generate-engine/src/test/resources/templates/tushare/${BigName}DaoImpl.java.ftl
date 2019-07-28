package impl;

import info.xpanda.web.common.helper.DaoHelper;
import info.xpanda.web.tushare.dao.${BigName}Dao;
import info.xpanda.web.tushare.entity.${BigName}Entity;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;

/**
 * @author Paul Jiang
 * @since 20190727
 */
@Repository
public class ${BigName}DaoImpl implements ${BigName}Dao {
    private static final String NAMESPACE = ${BigName}DaoImpl.class.getName();

    @Resource
    private DaoHelper daoHelper;
    @Override
    public int insert(${BigName}Entity entity) {
        return daoHelper.insert(NAMESPACE, "insert", entity);
    }

    @Override
    public int update(${BigName}Entity entity) {
        return daoHelper.update(NAMESPACE, "insert", entity);
    }

    @Override
    public ${BigName}Entity getById(Long id) {
        return daoHelper.selectOne(NAMESPACE, "getById", id);
    }
}
