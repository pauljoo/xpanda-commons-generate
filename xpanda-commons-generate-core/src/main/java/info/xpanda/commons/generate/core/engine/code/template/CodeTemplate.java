package info.xpanda.commons.generate.core.engine.code.template;

import java.util.List;
import java.util.Map;

/**
 * description:
 * copyright:
 *
 * @author jianghuiyao
 * @since 20190302
 */
public interface CodeTemplate {
    String process(List<Map<String, String>> dataModelList);
}
