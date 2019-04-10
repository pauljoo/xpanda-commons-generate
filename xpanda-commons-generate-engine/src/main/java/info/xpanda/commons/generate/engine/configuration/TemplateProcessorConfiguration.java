package info.xpanda.commons.generate.engine.configuration;

import lombok.Data;

import java.util.HashMap;
import java.util.Map;

@Data
public class TemplateProcessorConfiguration {
    private String clazz;

    private Map<String, String> settings;

    public TemplateProcessorConfiguration() {
        settings = new HashMap<>();
    }

    public void addSetting(NameValuePair pair){
        this.settings.put(pair.getName(), pair.getValue());
    }
}
