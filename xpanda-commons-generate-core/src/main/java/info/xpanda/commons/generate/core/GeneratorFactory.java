package info.xpanda.commons.generate.core;


import info.xpanda.commons.generate.core.engine.Generator;
import info.xpanda.commons.generate.core.engine.StandardGeneratorImpl;

public class GeneratorFactory {
	public Generator getInstance(){
		return new StandardGeneratorImpl();
	}
}
