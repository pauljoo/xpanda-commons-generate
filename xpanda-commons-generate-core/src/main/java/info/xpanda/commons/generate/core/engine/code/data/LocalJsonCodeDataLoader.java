package info.xpanda.commons.generate.core.engine.code.data;

import com.alibaba.fastjson.JSON;
import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * description:
 * copyright:
 *
 * @author jianghuiyao
 * @since 20190302
 */
public class LocalJsonCodeDataLoader implements CodeDataLoader {
    private String path;

    public LocalJsonCodeDataLoader(String path) {
        this.path = path;
    }

    @Override
    public List<Map<String, String>> load() {
        try {
            String text = FileUtils.readFileToString(new File(path));
            return JSON.parseObject(text, List.class);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
