package info.xpanda.cbb.generate.core.engine;


import info.xpanda.cbb.generate.core.api.DataSource;
import info.xpanda.cbb.generate.core.configuration.resolve.ConfigurationResolve;
import info.xpanda.cbb.generate.core.configuration.resolve.XMLConfigurationResolve;
import info.xpanda.cbb.generate.core.engine.code.template.CodeTemplate;

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
