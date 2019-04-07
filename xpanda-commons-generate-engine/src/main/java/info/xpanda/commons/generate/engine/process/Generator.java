package info.xpanda.commons.generate.engine.process;

public interface Generator {
	void load(String xmlPath) throws Exception;
	
	void generate() throws Exception;
}
