package info.xpanda.commons.generate.engine.configuration;


import lombok.Data;

@Data
public class Configuration {
	private ModelLoaderConfiguration modelLoader;

	private TemplateProcessorConfiguration templateProcessor;

	private SettingsConfiguration settings;
}
