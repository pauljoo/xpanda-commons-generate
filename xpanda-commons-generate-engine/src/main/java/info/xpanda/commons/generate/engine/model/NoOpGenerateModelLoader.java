package info.xpanda.commons.generate.engine.model;

import java.util.List;

/**
 *
 * @author Paul Jiang
 * @since 20190302
 */
public class NoOpGenerateModelLoader implements GenerateModelLoader {
    public List<GenerateModel> load() {
        return null;
    }
}
