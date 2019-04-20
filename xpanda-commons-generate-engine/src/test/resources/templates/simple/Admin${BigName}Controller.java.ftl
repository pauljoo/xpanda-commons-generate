package info.xpanda.web.admin.controller.${LittleModule};

import info.xpanda.web.admin.controller.${LittleModule}.vo.${BigName}VO;
import info.xpanda.web.admin.controller.${LittleModule}.vqo.${BigName}VQO;
import info.xpanda.web.${LittleModule}.service.${BigName}Service;
import info.xpanda.web.${LittleModule}.service.bo.${BigName}BO;
import info.xpanda.web.${LittleModule}.service.bqo.${BigName}BQO;
import info.xpanda.web.common.base.controller.BaseController;

import info.xpanda.web.common.security.XpandaUser;
import info.xpanda.web.common.vo.JsonResultVO;
import info.xpanda.web.common.vo.PageResultVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * 
 * @author Paul Joo
 * @since 20190418
 */
@Controller
@RequestMapping("/admin/${LittleModule}/${LittleName}")
public class Admin${BigName}Controller extends BaseController{
    @Resource
    private ${BigName}Service ${LittleName}Service;

    /**
     * 
     */
    @RequestMapping("/page")
    public ModelAndView page(){
        return new ModelAndView("/admin/${LittleModule}/${LittleName}/page");
    }

    /**
     * 查看弹窗
     * @param id 对象ID
     * @return
     */
    @RequestMapping("/viewPage")
    public ModelAndView viewPage(Long id){
        ${BigName}BO ${LittleName}BO = ${LittleName}Service.getById(id);
        ${BigName}VO ${LittleName}VO = transformHelper.transform(${LittleName}BO, ${BigName}VO.class);

        ModelAndView modelAndView = new ModelAndView("/admin/${LittleModule}/${LittleName}/viewPage");
        modelAndView.addObject("${LittleName}VO",${LittleName}VO);

        return modelAndView;
    }

    /**
     * 新增弹窗
     */
    @RequestMapping("/addPage")
    public ModelAndView addPage(){
        return new ModelAndView("/admin/${LittleModule}/${LittleName}/addPage");
    }

    /**
     * 编辑弹窗
     * @param id 对象ID
     * @return
     */
    @RequestMapping("/editPage")
    public ModelAndView editPage(Long id){
        ${BigName}BO ${LittleName}BO = ${LittleName}Service.getById(id);
        ${BigName}VO ${LittleName}VO = transformHelper.transform(${LittleName}BO, ${BigName}VO.class);

        ModelAndView modelAndView = new ModelAndView("/admin/${LittleModule}/${LittleName}/editPage");
        modelAndView.addObject("${LittleName}VO",${LittleName}VO);

        return modelAndView;
    }

    /**
     * 查询对象列表
     * @param ${LittleName}VQO 查询参数
     * @return
     */
    @RequestMapping("/list")
    @ResponseBody
    public JsonResultVO list(${BigName}VQO ${LittleName}VQO){
        ${BigName}BQO ${LittleName}BQO = transformHelper.transform(${LittleName}VQO, ${BigName}BQO.class);
        Long total = ${LittleName}Service.countByPage(${LittleName}BQO);
        List<${BigName}BO> ${LittleName}BOList = ${LittleName}Service.listByPage(${LittleName}BQO);
        List<${BigName}VO> ${LittleName}VOList = new ArrayList<>();
        transformHelper.transform(${LittleName}BOList, ${LittleName}VOList);
        PageResultVO<${BigName}VO> pageResultVO = new PageResultVO<>(total, ${LittleName}VOList);
        JsonResultVO result = JsonResultVO.buildSuccess();
        result.setData(pageResultVO);
        return result;
    }

    /**
     * 新增操作
     * @param ${LittleName}VQO 操作对象
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public JsonResultVO add(${BigName}VQO ${LittleName}VQO){
        ${BigName}BQO ${LittleName}BQO = transformHelper.transform(${LittleName}VQO, ${BigName}BQO.class);

        XpandaUser user = getUserDetail();
        ${LittleName}BQO.setOperator(user.getId());

        boolean result = ${LittleName}Service.add(${LittleName}BQO);
        return JsonResultVO.buildSuccess();
    }

    /**
     * 编辑操作
     * @param ${LittleName}VQO 操作对象
     * @return
     */
    @RequestMapping("/edit")
    @ResponseBody
    public JsonResultVO edit(${BigName}VQO ${LittleName}VQO){
        ${BigName}BQO ${LittleName}BQO = transformHelper.transform(${LittleName}VQO, ${BigName}BQO.class);

        XpandaUser user = getUserDetail();
        ${LittleName}BQO.setOperator(user.getId());

        boolean result = ${LittleName}Service.edit(${LittleName}BQO);

        return JsonResultVO.buildSuccess();
    }

    /**
     * 删除操作
     * @param ${LittleName}VQO 操作对象
     * @return
     */
    @RequestMapping("/remove")
    @ResponseBody
    public JsonResultVO remove(${BigName}VQO ${LittleName}VQO){
        ${BigName}BQO ${LittleName}BQO = transformHelper.transform(${LittleName}VQO, ${BigName}BQO.class);

        XpandaUser user = getUserDetail();
        ${LittleName}BQO.setOperator(user.getId());

        boolean result = ${LittleName}Service.remove(${LittleName}BQO);
        return JsonResultVO.buildSuccess();
    }
}
