package info.xpanda.web.${LittleModule}.service.impl;

import info.xpanda.web.${LittleModule}.dao.${BigName}Dao;
import info.xpanda.web.${LittleModule}.dao.entity.${BigName}Entity;
import info.xpanda.web.${LittleModule}.service.${BigName}Service;
import info.xpanda.web.${LittleModule}.service.bo.${BigName}BO;
import info.xpanda.web.${LittleModule}.service.bqo.${BigName}BQO;
import info.xpanda.web.common.base.service.impl.BaseServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * 业务服务
 * @author Paul Joo
 * @since 20190215
 */
@Service
public class ${BigName}ServiceImpl extends BaseServiceImpl implements ${BigName}Service {
    @Resource
    private ${BigName}Dao ${LittleName}Dao;

    @Override
    public List<${BigName}BO> listByPage(${BigName}BQO ${LittleName}BQO) {
        List<${BigName}Entity> ${LittleName}EntityList = ${LittleName}Dao.listPage(${LittleName}BQO.toOffset(), ${LittleName}BQO.toLimit());
        if(null == ${LittleName}EntityList){
            return null;
        }
        List<${BigName}BO> ${LittleName}BOList = new ArrayList<>();
        transformHelper.transform(${LittleName}EntityList, ${LittleName}BOList);
        return ${LittleName}BOList;
    }

    @Override
    public long countByPage(${BigName}BQO ${LittleName}BQO) {
        return ${LittleName}Dao.countPage();
    }

    @Override
    public ${BigName}BO getById(Long id) {
        ${BigName}Entity entity = ${LittleName}Dao.getById(id);
        return transformHelper.transform(entity, ${BigName}BO.class);
    }

    @Override
    @Transactional
    public boolean add(${BigName}BQO ${LittleName}BQO) {
        ${BigName}Entity entity = transformHelper.transform(${LittleName}BQO, ${BigName}Entity.class);
        entity.setCreater(${LittleName}BQO.getOperator());
        entity.setUpdater(${LittleName}BQO.getOperator());
        int result = ${LittleName}Dao.insert(entity);
        return result > 0;
    }

    @Override
    @Transactional
    public boolean edit(${BigName}BQO ${LittleName}BQO) {
        ${BigName}Entity entity = transformHelper.transform(${LittleName}BQO, ${BigName}Entity.class);
        entity.setUpdater(${LittleName}BQO.getOperator());
        int result = ${LittleName}Dao.update(entity);
        return result > 0;
    }

    @Override
    @Transactional
    public boolean remove(${BigName}BQO ${LittleName}BQO) {
        ${BigName}Entity entity = transformHelper.transform(${LittleName}BQO, ${BigName}Entity.class);
        entity.setUpdater(${LittleName}BQO.getOperator());
        int result = ${LittleName}Dao.delete(entity);
        return result > 0;
    }
}
