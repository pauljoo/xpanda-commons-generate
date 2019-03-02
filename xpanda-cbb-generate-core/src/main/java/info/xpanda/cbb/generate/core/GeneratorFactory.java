package info.xpanda.cbb.generate.core;


import info.xpanda.cbb.generate.core.engine.Generator;
import info.xpanda.cbb.generate.core.engine.GeneratorImpl;

public class GeneratorFactory {
	public Generator getInstance(){
		return new GeneratorImpl();
	}
}
