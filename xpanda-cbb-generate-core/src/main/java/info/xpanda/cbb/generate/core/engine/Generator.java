package info.xpanda.cbb.generate.core.engine;

public interface Generator {
	void load(String xmlPath) throws Exception;
	
	void generator() throws Exception;
}
