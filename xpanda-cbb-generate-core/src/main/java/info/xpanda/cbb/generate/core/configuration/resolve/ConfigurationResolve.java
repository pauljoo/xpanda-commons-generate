package info.xpanda.cbb.generate.core.configuration.resolve;


import info.xpanda.cbb.generate.core.engine.ApplicationContext;

public interface ConfigurationResolve {
	ApplicationContext resolve() throws Exception;
}
