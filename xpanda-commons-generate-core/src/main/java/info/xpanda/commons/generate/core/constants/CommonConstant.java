package info.xpanda.commons.generate.core.constants;


import info.xpanda.commons.generate.core.custom.CamelCaseMethodModel;
import info.xpanda.commons.generate.core.freemarker.MyBatisParamMethodModel;

public class CommonConstant {
	public final static String KEY_TABLE = "TABLE";
	public final static String KEY_COLUMNS = "COLUMNS";
	
	public final static String KEY_CAMEL_UTIL = "CAMEL_UTIL";
	public final static String KEY_MYBATIS_PARAM_UTIL = "MYBATIS_PARAM_UTIL";
	public final static CamelCaseMethodModel CAMEL_UTIL = new CamelCaseMethodModel();
	public final static MyBatisParamMethodModel MYBATIS_PARAM_UTIL = new MyBatisParamMethodModel();
}
