package impl;

import info.xpanda.web.tushare.dao.${BigName}Dao;
import info.xpanda.web.tushare.dto.${BigName}RequestDto;
import info.xpanda.web.tushare.dto.${BigName}ResponseDto;
import info.xpanda.web.tushare.entity.${BigName}Entity;
import info.xpanda.web.tushare.remoting.${BigName}Remoting;
import info.xpanda.web.tushare.service.${BigName}Service;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Paul Jiang
 * @since 20190727
 */
@Service
public class ${BigName}ServiceImpl implements ${BigName}Service {
    @Resource
    private ${BigName}Remoting ${LittleName}Remoting;

    @Resource
    private ${BigName}Dao ${LittleName}Dao;
    @Override
    @Transactional
    public boolean pull() {
        ${BigName}RequestDto request = new ${BigName}RequestDto();
        List<${BigName}ResponseDto> responses = ${LittleName}Remoting.exchange(request);

        for (${BigName}ResponseDto response : responses) {
            ${BigName}Entity existsEntity = ${LittleName}Dao.getById(response.getId());
            if(existsEntity == null){
                ${LittleName}Dao.insert(response);
            }else{
                response.setId(existsEntity.getId());
                ${LittleName}Dao.update(response);
            }
        }
        return true;
    }
}
