package info.xpanda.commons.generate.engine.template;

import info.xpanda.commons.generate.engine.model.GenerateModel;

import java.util.List;

/**
 * description:
 * copyright:
 *
 * @author jianghuiyao
 * @since 20190302
 */
public interface GenerateTemplate {
    String process(List<GenerateModel> models);
}
