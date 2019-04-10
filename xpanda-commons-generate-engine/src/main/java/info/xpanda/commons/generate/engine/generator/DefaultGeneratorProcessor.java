package info.xpanda.commons.generate.engine.generator;


import info.xpanda.commons.generate.engine.configuration.Configuration;
import info.xpanda.commons.generate.engine.configuration.ConfigurationHolder;
import info.xpanda.commons.generate.engine.configuration.resolve.ConfigurationResolve;
import info.xpanda.commons.generate.engine.configuration.resolve.XMLConfigurationResolve;
import info.xpanda.commons.generate.engine.model.GenerateModel;
import info.xpanda.commons.generate.engine.model.GenerateModelLoader;
import info.xpanda.commons.generate.engine.template.GenerateTemplateProcessor;

import java.util.List;

/**
 * Template + Data = Code
 */
public class DefaultGeneratorProcessor implements Generator {
	private String path;

	public DefaultGeneratorProcessor(String path) {
		this.path = path;
	}

	@Override
	public void generate() {
		try {
			//加载XML
			ConfigurationResolve resolve = new XMLConfigurationResolve(path);
			Configuration configuration = resolve.resolve();

			ConfigurationHolder.setConfiguration(configuration);

			GenerateTemplateProcessor processor = (GenerateTemplateProcessor) Class.forName(configuration.getTemplateProcessor().getClazz()).newInstance();

			GenerateModelLoader loader = (GenerateModelLoader) Class.forName(configuration.getModelLoader().getClazz()).newInstance();

			List<GenerateModel> modelList = loader.load();
			for(GenerateModel model : modelList){
                model.putAll(configuration.getSettings().getSettings());
            }
			processor.process(modelList);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
