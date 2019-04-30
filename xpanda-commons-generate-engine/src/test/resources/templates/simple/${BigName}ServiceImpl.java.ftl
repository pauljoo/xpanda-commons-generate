package info.xpanda.web.${LittleModule}.service.impl;

import info.xpanda.web.${LittleModule}.dao.${BigName}Dao;
import info.xpanda.web.${LittleModule}.dao.entity.${BigName}Entity;
import info.xpanda.web.${LittleModule}.service.${BigName}Service;
import info.xpanda.web.${LittleModule}.service.bo.${BigName}Bo;
import info.xpanda.web.${LittleModule}.service.bqo.${BigName}Bqo;
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
    public List<${BigName}Bo> listByPage(${BigName}Bqo ${LittleName}Bqo) {
        List<${BigName}Entity> ${LittleName}EntityList = ${LittleName}Dao.listPage(${LittleName}Bqo.toOffset(), ${LittleName}Bqo.toLimit());
        if(null == ${LittleName}EntityList){
            return null;
        }
        List<${BigName}Bo> ${LittleName}BoList = new ArrayList<>();
        transformHelper.transform(${LittleName}EntityList, ${LittleName}BoList);
        return ${LittleName}BoList;
    }

    @Override
    public long countByPage(${BigName}Bqo ${LittleName}Bqo) {
        return ${LittleName}Dao.countPage();
    }

    @Override
    public ${BigName}Bo getById(Long id) {
        ${BigName}Entity entity = ${LittleName}Dao.getById(id);
        return transformHelper.transform(entity, ${BigName}Bo.class);
    }

    @Override
    @Transactional
    public Boolean add(${BigName}Bqo ${LittleName}Bqo) {
        ${BigName}Entity entity = transformHelper.transform(${LittleName}Bqo, ${BigName}Entity.class);
        entity.setCreater(${LittleName}Bqo.getOperator());
        entity.setUpdater(${LittleName}Bqo.getOperator());
        int result = ${LittleName}Dao.insert(entity);
        return result > 0;
    }

    @Override
    @Transactional
    public Boolean edit(${BigName}Bqo ${LittleName}Bqo) {
        ${BigName}Entity entity = transformHelper.transform(${LittleName}Bqo, ${BigName}Entity.class);
        entity.setUpdater(${LittleName}Bqo.getOperator());
        int result = ${LittleName}Dao.update(entity);
        return result > 0;
    }

    @Override
    @Transactional
    public Boolean remove(${BigName}Bqo ${LittleName}Bqo) {
        ${BigName}Entity entity = transformHelper.transform(${LittleName}Bqo, ${BigName}Entity.class);
        entity.setUpdater(${LittleName}Bqo.getOperator());
        int result = ${LittleName}Dao.delete(entity);
        return result > 0;
    }
}
