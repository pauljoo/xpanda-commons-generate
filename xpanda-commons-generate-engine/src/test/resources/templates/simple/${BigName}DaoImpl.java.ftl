package info.xpanda.web.${LittleModule}.dao.impl;

import info.xpanda.web.${LittleModule}.dao.${BigName}Dao;
import info.xpanda.web.${LittleModule}.dao.entity.${BigName}Entity;
import info.xpanda.web.common.base.dao.impl.BaseDaoImpl;
import info.xpanda.web.common.helper.DaoHelper;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ${BigName}DaoImpl extends BaseDaoImpl implements ${BigName}Dao {
    @Resource
    private DaoHelper daoHelper;

    private static final String NAMESPACE = ${BigName}DaoImpl.class.getName();

    @Override
    public ${BigName}Entity getById(Long id) {
        return daoHelper.selectOne(NAMESPACE, "getById", id);
    }

    @Override
    public List<${BigName}Entity> listPage(Integer offset, Integer limit) {
        Map<String, Object> parameter = new HashMap<>();
        parameter.put("offset", offset);
        parameter.put("limit", limit);
        return daoHelper.selectList(NAMESPACE, "listPage", parameter);
    }

    @Override
    public long countPage() {
        return daoHelper.selectOne(NAMESPACE, "countPage");
    }

    @Override
    public int insert(${BigName}Entity entity) {
        return daoHelper.insert(NAMESPACE, "insert", entity);
    }

    @Override
    public int update(${BigName}Entity entity) {
        return daoHelper.update(NAMESPACE, "update", entity);
    }

    @Override
    public int delete(${BigName}Entity entity) {
        return daoHelper.delete(NAMESPACE, "delete", entity);
    }

}
