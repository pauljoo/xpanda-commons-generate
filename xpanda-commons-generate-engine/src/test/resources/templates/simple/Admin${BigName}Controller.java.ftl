package info.xpanda.web.admin.controller.${LittleModule};

import info.xpanda.web.admin.controller.${LittleModule}.vo.${BigName}Vo;
import info.xpanda.web.admin.controller.${LittleModule}.vqo.${BigName}Vqo;
import info.xpanda.web.${LittleModule}.service.${BigName}Service;
import info.xpanda.web.${LittleModule}.service.bo.${BigName}Bo;
import info.xpanda.web.${LittleModule}.service.bqo.${BigName}Bqo;
import info.xpanda.web.common.base.controller.BaseController;

import info.xpanda.web.common.security.XpandaUser;
import info.xpanda.web.common.vo.JsonResultVo;
import info.xpanda.web.common.vo.PageResultVo;
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
        ${BigName}Bo ${LittleName}Bo = ${LittleName}Service.getById(id);
        ${BigName}Vo ${LittleName}Vo = transformHelper.transform(${LittleName}Bo, ${BigName}Vo.class);

        ModelAndView modelAndView = new ModelAndView("/admin/${LittleModule}/${LittleName}/viewPage");
        modelAndView.addObject("${LittleName}Vo",${LittleName}Vo);

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
        ${BigName}Bo ${LittleName}Bo = ${LittleName}Service.getById(id);
        ${BigName}Vo ${LittleName}Vo = transformHelper.transform(${LittleName}Bo, ${BigName}Vo.class);

        ModelAndView modelAndView = new ModelAndView("/admin/${LittleModule}/${LittleName}/editPage");
        modelAndView.addObject("${LittleName}Vo",${LittleName}Vo);

        return modelAndView;
    }

    /**
     * 查询对象列表
     * @param ${LittleName}Vqo 查询参数
     * @return
     */
    @RequestMapping("/list")
    @ResponseBody
    public JsonResultVo list(${BigName}Vqo ${LittleName}Vqo){
        ${BigName}Bqo ${LittleName}Bqo = transformHelper.transform(${LittleName}Vqo, ${BigName}Bqo.class);
        Long total = ${LittleName}Service.countByPage(${LittleName}Bqo);
        List<${BigName}Bo> ${LittleName}BoList = ${LittleName}Service.listByPage(${LittleName}Bqo);
        List<${BigName}Vo> ${LittleName}VoList = new ArrayList<>();
        transformHelper.transform(${LittleName}BoList, ${LittleName}VoList);
        PageResultVo<${BigName}Vo> pageResultVo = new PageResultVo<>(total, ${LittleName}VoList);
        JsonResultVo result = JsonResultVo.buildSuccess();
        result.setData(pageResultVo);
        return result;
    }

    /**
     * 新增操作
     * @param ${LittleName}Vqo 操作对象
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public JsonResultVo add(${BigName}Vqo ${LittleName}Vqo){
        ${BigName}Bqo ${LittleName}Bqo = transformHelper.transform(${LittleName}Vqo, ${BigName}Bqo.class);

        XpandaUser user = getUserDetail();
        ${LittleName}Bqo.setOperator(user.getId());

        Boolean result = ${LittleName}Service.add(${LittleName}Bqo);
        return JsonResultVo.buildSuccess();
    }

    /**
     * 编辑操作
     * @param ${LittleName}Vqo 操作对象
     * @return
     */
    @RequestMapping("/edit")
    @ResponseBody
    public JsonResultVo edit(${BigName}Vqo ${LittleName}Vqo){
        ${BigName}Bqo ${LittleName}Bqo = transformHelper.transform(${LittleName}Vqo, ${BigName}Bqo.class);

        XpandaUser user = getUserDetail();
        ${LittleName}Bqo.setOperator(user.getId());

        Boolean result = ${LittleName}Service.edit(${LittleName}Bqo);

        return JsonResultVo.buildSuccess();
    }

    /**
     * 删除操作
     * @param ${LittleName}Vqo 操作对象
     * @return
     */
    @RequestMapping("/remove")
    @ResponseBody
    public JsonResultVo remove(${BigName}Vqo ${LittleName}Vqo){
        ${BigName}Bqo ${LittleName}Bqo = transformHelper.transform(${LittleName}Vqo, ${BigName}Bqo.class);

        XpandaUser user = getUserDetail();
        ${LittleName}Bqo.setOperator(user.getId());

        Boolean result = ${LittleName}Service.remove(${LittleName}Bqo);
        return JsonResultVo.buildSuccess();
    }
}
