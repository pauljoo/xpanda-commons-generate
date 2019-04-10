package info.xpanda.commons.generate.engine.generator;


import org.junit.Test;

public class DefaultGeneratorProcessorTest {

    @Test
    public void generate(){
        Generator generator = new DefaultGeneratorProcessor("D://code//configuration.xml");
        generator.generate();
    }
}