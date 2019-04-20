package info.xpanda.web.${LittleModule}.service;

import info.xpanda.web.${LittleModule}.service.bo.${BigName}BO;
import info.xpanda.web.${LittleModule}.service.bqo.${BigName}BQO;
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
     * @param ${LittleName}BQO
     * @return
     */
    List<${BigName}BO> listByPage(${BigName}BQO ${LittleName}BQO);

    /**
     * 获取总数
     * @param ${LittleName}BQO
     * @return
     */
    long countByPage(${BigName}BQO ${LittleName}BQO);

    /**
     * 查询对象
     * @param id
     * @return
     */
    ${BigName}BO getById(Long id);

    /**
     * 新增数据
     * @param ${LittleName}BQO
     * @return
     */
    boolean add(${BigName}BQO ${LittleName}BQO);

    /**
     * 修改数据
     * @param ${LittleName}BQO
     * @return
     */
    boolean edit(${BigName}BQO ${LittleName}BQO);

    /**
     * 删除数据
     * @param id
     * @return
     */
    boolean remove(${BigName}BQO ${LittleName}BQO);
}
