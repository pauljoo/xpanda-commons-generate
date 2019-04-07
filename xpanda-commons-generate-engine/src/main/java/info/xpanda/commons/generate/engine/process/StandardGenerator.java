package info.xpanda.commons.generate.engine.process;


import info.xpanda.commons.generate.engine.configuration.Configuration;
import info.xpanda.commons.generate.engine.configuration.ConfigurationHolder;
import info.xpanda.commons.generate.engine.configuration.resolve.ConfigurationResolve;
import info.xpanda.commons.generate.engine.configuration.resolve.XMLConfigurationResolve;
import info.xpanda.commons.generate.engine.model.GenerateModel;
import info.xpanda.commons.generate.engine.model.GenerateModelLoader;
import info.xpanda.commons.generate.engine.model.NoOpGenerateModelLoader;
import info.xpanda.commons.generate.engine.template.FreemarkerGenerateTemplate;
import info.xpanda.commons.generate.engine.template.GenerateTemplate;

import java.util.List;

/**
 * Template + Data = Code
 */
public class StandardGenerator extends AbstractGenerator{
	private Configuration configuration;


	/**
	 * Template
	 */
	private GenerateTemplate template;

	/**
	 * DataSource
	 */
	private DataSource dataSource;
	@Override
	public void load(String xmlPath) throws Exception{
		//加载XML
		ConfigurationResolve resolve = new XMLConfigurationResolve(xmlPath);
		configuration = resolve.resolve();
	}

	@Override
	public void generate() throws Exception{
		//加载XML
		ConfigurationResolve resolve = new XMLConfigurationResolve("D://code//configuration.xml");
		Configuration configuration = resolve.resolve();

		ConfigurationHolder.setConfiguration(configuration);

		GenerateTemplate template = new FreemarkerGenerateTemplate(
				configuration.getTemplate().getSourceDirectory(),
				configuration.getTemplate().getTargetDirectory()
		);

		GenerateModelLoader loader = new NoOpGenerateModelLoader("D://code//test.json");
		List<GenerateModel> models = loader.load();

		for(GenerateModel model : models){
			model.putAll(configuration.getSettings());
		}
		template.process(models);
	}
}
