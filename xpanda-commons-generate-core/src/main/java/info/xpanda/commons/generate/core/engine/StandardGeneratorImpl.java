package info.xpanda.commons.generate.core.engine;


import info.xpanda.commons.generate.core.api.DataSource;
import info.xpanda.commons.generate.core.configuration.resolve.ConfigurationResolve;
import info.xpanda.commons.generate.core.configuration.resolve.XMLConfigurationResolve;
import info.xpanda.commons.generate.core.engine.code.template.CodeTemplate;

/**
 * Template + Data = Code
 */
public class StandardGeneratorImpl implements Generator{
	private Configuration configuration;


	/**
	 * Template
	 */
	private CodeTemplate template;

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
	}
}
