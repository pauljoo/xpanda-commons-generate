package info.xpanda.web.${LittleModule}.dao;

import info.xpanda.web.${LittleModule}.dao.entity.${BigName}Entity;
import info.xpanda.web.common.base.dao.BaseDao;

import java.util.List;

public interface ${BigName}Dao extends BaseDao{
    ${BigName}Entity getById(Long id);

    List<${BigName}Entity> listPage(Integer offset, Integer limit);

    long countPage();

    int insert(${BigName}Entity entity);

    int update(${BigName}Entity entity);

    int delete(${BigName}Entity entity);

}
