package info.xpanda.commons.generate.core;

import info.xpanda.commons.generate.core.configuration.resolve.ConfigurationResolve;
import info.xpanda.commons.generate.core.configuration.resolve.XMLConfigurationResolve;
import info.xpanda.commons.generate.core.engine.Configuration;
import info.xpanda.commons.generate.core.engine.ConfigurationHolder;
import info.xpanda.commons.generate.core.engine.code.data.LocalJsonCodeDataLoader;
import info.xpanda.commons.generate.core.engine.code.template.FreemarkerCodeTemplate;

import java.util.List;
import java.util.Map;

public class Bootstrap {
	public static void main(String[] args) throws Exception {
		//加载XML
		ConfigurationResolve resolve = new XMLConfigurationResolve("D://code//configuration.xml");
		Configuration configuration = resolve.resolve();

		ConfigurationHolder.setConfiguration(configuration);

		FreemarkerCodeTemplate template = new FreemarkerCodeTemplate(
				configuration.getTemplate().getSourceDirectory(),
				configuration.getTemplate().getTargetDirectory()
		);

		LocalJsonCodeDataLoader code = new LocalJsonCodeDataLoader("D://code//test.json");
		List<Map<String, String>> dataModelList = code.load();

		for(Map<String, String> dataModel : dataModelList){
			dataModel.putAll(configuration.getSettings());
		}
		template.process(dataModelList);
	}
}
