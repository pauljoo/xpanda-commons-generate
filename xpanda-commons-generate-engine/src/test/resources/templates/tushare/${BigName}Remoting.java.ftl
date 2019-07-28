package info.xpanda.web.tushare.remoting;

import info.xpanda.web.tushare.core.TushareUtil;
import info.xpanda.web.tushare.core.ResponseDTO;
import info.xpanda.web.tushare.core.TushareHelper;
import info.xpanda.web.tushare.dto.${BigName}RequestDto;
import info.xpanda.web.tushare.dto.${BigName}ResponseDto;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * description:
 * copyright:
 *
 * @author Paul Joo
 * @since 20190227
 */
@Service
public class ${BigName}Remoting {
    private static final String API_NAME = "${ApiName}";

    @Resource
    private TushareHelper tushareHelper;

    public List<${BigName}ResponseDto> exchange(${BigName}RequestDto request){
        SimpleDateFormat sdf = new SimpleDateFormat();

        Map<String, Object> params = new HashMap<>();

        ResponseDTO response = tushareHelper.doPost(API_NAME, params,
                "<#list columns as column>${column.ColumnName},</#list>");


        Map<String, Integer> mapFieldIndex = TushareUtil.resolveFieldIndex(response.getData().getFields());

        List<${BigName}ResponseDto> resultList = new ArrayList<>();
        List<List<String>> items = response.getData().getItems();
        for(List<String> item : items){
            ${BigName}ResponseDto result = new ${BigName}ResponseDto();
            <#list columns as column>
                result.set${column.FieldName?cap_first}(item.get(mapFieldIndex.get("${column.ColumnName}")));
            </#list>
            resultList.add(result);
        }
        return resultList;
    }
}
