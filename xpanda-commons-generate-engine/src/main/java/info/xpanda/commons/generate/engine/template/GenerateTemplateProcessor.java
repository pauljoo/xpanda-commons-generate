package info.xpanda.commons.generate.engine.template;

import info.xpanda.commons.generate.engine.model.GenerateModel;

import java.util.List;

/**
 * description:
 * copyright:
 *
 * @author Paul Joo
 * @since 20190302
 */
public interface GenerateTemplateProcessor {
    String process(List<GenerateModel> modelList);
}
