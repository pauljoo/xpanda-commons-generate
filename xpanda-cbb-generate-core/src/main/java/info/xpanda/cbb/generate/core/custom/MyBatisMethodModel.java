package info.xpanda.cbb.generate.core.custom;

import freemarker.template.TemplateMethodModelEx;
import freemarker.template.TemplateModelException;

import java.util.List;

public class MyBatisMethodModel implements TemplateMethodModelEx{

	public Object exec(List arguments) throws TemplateModelException {
		if(arguments.size() != 1)  
        {  
            throw new TemplateModelException("Wrong argments !");  
        }  
		return "#{" + arguments.get(0).toString() + "}";
	}
}
