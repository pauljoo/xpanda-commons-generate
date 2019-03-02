package info.xpanda.cbb.generate.core;


import info.xpanda.cbb.generate.core.engine.Generator;
import info.xpanda.cbb.generate.core.engine.StandardGeneratorImpl;

public class GeneratorFactory {
	public Generator getInstance(){
		return new StandardGeneratorImpl();
	}
}
