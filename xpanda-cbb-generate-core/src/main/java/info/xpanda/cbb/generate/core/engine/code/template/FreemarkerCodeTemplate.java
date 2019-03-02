package info.xpanda.cbb.generate.core.engine.code.template;

import freemarker.template.Configuration;
import freemarker.template.Template;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;

import java.io.File;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.*;

/**
 * description:
 * copyright:
 *
 * @author jianghuiyao
 * @since 20190302
 */
public class FreemarkerCodeTemplate implements CodeTemplate {
    private String templateDirectory;

    private String targetDirectory;

    private Configuration cfg;

    private List<String> templateNames = new ArrayList<>();

    public FreemarkerCodeTemplate(String templateDirectory, String targetDirectory) {
        this.templateDirectory = templateDirectory;
        this.targetDirectory = targetDirectory;
    }

    public void init(){
        initFreemarker();

        initTemplateNames();
    }

    private void initFreemarker(){
        try {
            //加载Freemarker
            cfg = new Configuration(Configuration.VERSION_2_3_23);
            //设定去哪里读取相应的ftl模板文件
            cfg.setDirectoryForTemplateLoading(new File(templateDirectory));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void initTemplateNames(){
        File templateDirectoryFile = new File(templateDirectory);
        String[] extensions = new String[]{"ftl"};
        Collection<File> templateFiles = FileUtils.listFiles(templateDirectoryFile, extensions, true);

        try {
            Integer prefixPathLength = templateDirectoryFile.getCanonicalPath().length() + 1;
            for(File templateFile: templateFiles){
                templateNames.add(templateFile.getCanonicalPath().substring(prefixPathLength));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    @Override
    public String process(List<Map<String, String>> dataModelList) {
        init();

        for(Map<String, String> dataModel : dataModelList){
            for(String templateName : templateNames){
                //在模板文件目录中找到名称为name的文件
                try {
                    Template temp = cfg.getTemplate(templateName);
                    File targetFile = resolveTargetFile(temp, dataModel);

                    Writer out = new OutputStreamWriter(FileUtils.openOutputStream(targetFile));
                    temp.process(dataModel, out);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return null;
    }

    private File resolveTargetFile(Template template, Map<String, String> dataModel){
        String fullPath = targetDirectory + File.separator + template.getName();
        fullPath = StringUtils.substringBeforeLast(fullPath, ".");
        String[] tags = StringUtils.substringsBetween(fullPath, "${", "}");
        if(tags != null && tags.length > 0){
            Set<String> setTag = new HashSet<String>(Arrays.asList(tags));
            for(String tag : setTag){
                if(dataModel.containsKey(tag)){
                    fullPath = StringUtils.replace(fullPath, "${" + tag + "}", dataModel.get(tag));
                }
            }
        }
        try {
            FileUtils.forceMkdirParent(new File(fullPath));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return new File(fullPath);
    }
}
