package info.xpanda.web.${LittleModule}.service;

import info.xpanda.web.${LittleModule}.service.bo.${BigName}Bo;
import info.xpanda.web.${LittleModule}.service.bqo.${BigName}Bqo;
import info.xpanda.web.common.base.service.BaseService;

import java.util.List;

/**
 * 菜单业务服务
 * @author Paul Joo
 * @since 20190215
 */
public interface ${BigName}Service extends BaseService {
    /**
     * 分页获取对象
     * @param ${LittleName}Bqo
     * @return
     */
    List<${BigName}Bo> listByPage(${BigName}Bqo ${LittleName}Bqo);

    /**
     * 获取总数
     * @param ${LittleName}Bqo
     * @return
     */
    long countByPage(${BigName}Bqo ${LittleName}Bqo);

    /**
     * 查询对象
     * @param id
     * @return
     */
    ${BigName}Bo getById(Long id);

    /**
     * 新增数据
     * @param ${LittleName}Bqo
     * @return
     */
    Boolean add(${BigName}Bqo ${LittleName}Bqo);

    /**
     * 修改数据
     * @param ${LittleName}Bqo
     * @return
     */
    Boolean edit(${BigName}Bqo ${LittleName}Bqo);

    /**
     * 删除数据
     * @param ${LittleName}Bqo
     * @return
     */
    Boolean remove(${BigName}Bqo ${LittleName}Bqo);
}
