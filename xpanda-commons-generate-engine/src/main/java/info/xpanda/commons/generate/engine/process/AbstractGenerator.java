package info.xpanda.commons.generate.engine.process;

/**
 * @author Paul Jiang
 * @since 20190407
 */
public abstract class AbstractGenerator {
    public void generate(){
        loadConfiguration();
        loadModel();
        loadTemplate();
        doGenerate();
    }

    protected abstract void loadConfiguration();

    protected abstract void loadModel();

    protected abstract void loadTemplate();

    protected abstract void doGenerate();
}
