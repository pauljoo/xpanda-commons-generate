package info.xpanda.commons.generate.core.freemarker;

import freemarker.template.TemplateMethodModelEx;
import freemarker.template.TemplateModelException;
import info.xpanda.commons.generate.core.utils.CamelCaseUtil;

import java.util.List;

public class CamelCaseMethodModel implements TemplateMethodModelEx{

	public Object exec(List arguments) throws TemplateModelException {
		if(arguments.size() != 1)  
        {  
            throw new TemplateModelException("Wrong argments !");  
        }  
		return CamelCaseUtil.toCamelCase(arguments.get(0).toString());
	}
}
