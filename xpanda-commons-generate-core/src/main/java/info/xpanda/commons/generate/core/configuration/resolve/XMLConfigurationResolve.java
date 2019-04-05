package info.xpanda.commons.generate.core.configuration.resolve;

import info.xpanda.commons.generate.core.configuration.*;
import info.xpanda.commons.generate.core.engine.Configuration;
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
		digester.addObjectCreate("configuration/settings/setting", NameValuePair.class);
		digester.addSetProperties("configuration/settings/setting");
		digester.addSetNext("configuration/settings/setting", "addSetting");
		
		digester.addObjectCreate("configuration/template", TemplateConfiguration.class);
		digester.addSetProperties("configuration/template");
		digester.addSetNext("configuration/template", "setTemplate");
		
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
