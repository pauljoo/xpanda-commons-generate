DROP TABLE IF EXISTS ${table};
CREATE TABLE ${table} (
id int8 NOT NULL,
<#list columns as column>
${column.ColumnName} varchar(32),
</#list>
creater int8,
updater int8,
create_time timestamp without time zone,
update_time timestamp without time zone,
valid_status int2,
CONSTRAINT pk_${table} PRIMARY KEY (id)
);

COMMENT ON TABLE ${table} IS '${TableDescription}';
<#list columns as column>
COMMENT ON COLUMN ${table}.${column.ColumnName} IS '${column.Description}';
</#list>


DROP SEQUENCE IF EXISTS seq_${table};
CREATE SEQUENCE seq_${table}
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 2147483647
 START 1
 CACHE 1;