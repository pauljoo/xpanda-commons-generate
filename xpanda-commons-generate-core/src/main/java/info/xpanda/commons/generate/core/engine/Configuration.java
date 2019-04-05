package info.xpanda.commons.generate.core.engine;



import info.xpanda.commons.generate.core.configuration.NameValuePair;
import info.xpanda.commons.generate.core.configuration.TemplateConfiguration;

import java.util.HashMap;
import java.util.Map;

public class Configuration {
	private Map<String, String> settings;

	private TemplateConfiguration template;
	
	public Configuration() {
		settings = new HashMap<String, String>();
	}

	public void addSetting(NameValuePair pair){
		settings.put(pair.getName(), pair.getValue());
	}

	public TemplateConfiguration getTemplate() {
		return template;
	}

	public void setTemplate(TemplateConfiguration template){
		this.template = template;
	}

	public Map<String, String> getSettings() {
		return settings;
	}

	public void setSettings(Map<String, String> settings) {
		this.settings = settings;
	}
}
