package info.xpanda.commons.generate.core.engine;

public interface Generator {
	void load(String xmlPath) throws Exception;
	
	void generate() throws Exception;
}
