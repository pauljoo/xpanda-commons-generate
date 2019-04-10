package info.xpanda.commons.generate.engine.configuration.resolve;

import info.xpanda.commons.generate.engine.configuration.*;
import info.xpanda.commons.generate.engine.configuration.Configuration;
import org.apache.commons.digester3.Digester;
import org.xml.sax.ErrorHandler;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;

import java.io.File;

public class XMLConfigurationResolve implements ConfigurationResolve{
	
	private String filePath;
	
	public XMLConfigurationResolve(String filePath) {
		this.filePath = filePath;
	}
	
	@Override
	public Configuration resolve() throws Exception{
		Digester digester = new Digester();
//		URL url = new URL("classpath:configuration.dtd");
//		digester.register("-//Huiyao Jiang//DTD Configuration 0.1//EN", url);
//		digester.setValidating(true);
		
		digester.addObjectCreate("configuration", Configuration.class);

		digester.addObjectCreate("configuration/settings", SettingsConfiguration.class);
		digester.addSetProperties("configuration/settings");
		digester.addSetNext("configuration/settings", "setSettings");
		digester.addObjectCreate("configuration/settings/setting", NameValuePair.class);
		digester.addSetProperties("configuration/settings/setting");
		digester.addSetNext("configuration/settings/setting", "addSetting");

		digester.addObjectCreate("configuration/modelLoader", ModelLoaderConfiguration.class);
		digester.addSetProperties("configuration/modelLoader");
		digester.addSetNext("configuration/modelLoader", "setModelLoader");
		digester.addObjectCreate("configuration/modelLoader/setting", NameValuePair.class);
		digester.addSetProperties("configuration/modelLoader/setting");
		digester.addSetNext("configuration/modelLoader/setting", "addSetting");

		digester.addObjectCreate("configuration/templateProcessor", TemplateProcessorConfiguration.class);
		digester.addSetProperties("configuration/templateProcessor");
		digester.addSetNext("configuration/templateProcessor", "setTemplateProcessor");
		digester.addObjectCreate("configuration/templateProcessor/setting", NameValuePair.class);
		digester.addSetProperties("configuration/templateProcessor/setting");
		digester.addSetNext("configuration/templateProcessor/setting", "addSetting");

		File file = new File(filePath);
		if(null != file && file.isFile()){
			try {
				digester.setErrorHandler(new ErrorHandler() {
					
					@Override
					public void warning(SAXParseException exception) throws SAXException {
						System.out.println(exception);
					}
					
					@Override
					public void fatalError(SAXParseException exception) throws SAXException {
						System.out.println(exception);
					}
					
					@Override
					public void error(SAXParseException exception) throws SAXException {
						System.out.println(exception);
					}
				});
				Configuration vc = (Configuration) digester.parse(file);
				return vc;
			} catch (SAXException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
}
