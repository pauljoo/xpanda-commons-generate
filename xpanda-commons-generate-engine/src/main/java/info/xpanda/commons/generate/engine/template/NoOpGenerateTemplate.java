package info.xpanda.commons.generate.engine.template;

import info.xpanda.commons.generate.engine.model.GenerateModel;

import java.util.List;

/**
 * @author Paul Jiang
 * @since 20190407
 */
public class NoOpGenerateTemplate implements GenerateTemplate {
    @Override
    public String process(List<GenerateModel> models) {
        return null;
    }
}
