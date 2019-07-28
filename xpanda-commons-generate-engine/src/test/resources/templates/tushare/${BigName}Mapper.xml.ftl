<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="info.xpanda.web.tushare.dao.impl.${BigName}DaoImpl">
    <resultMap id="BaseResultMap" type="info.xpanda.web.tushare.entity.${BigName}Entity">
            <id property="id" column="id"/>
        <#list columns as column>
            <result property="${column.FieldName}" column="${column.ColumnName}"/>
        </#list>
            <result property="creater" column="creater"/>
            <result property="updater" column="updater"/>
            <result property="createTime" column="create_time"/>
            <result property="updateTime" column="update_time"/>
            <result property="validStatus" column="valid_status"/>
        </resultMap>

    <insert id="insert" parameterType="info.xpanda.web.tushare.entity.${BigName}Entity">
        <selectKey keyProperty="id" resultType="java.lang.Long" order="BEFORE">
            SELECT nextval('seq_${table}')
        </selectKey>
        INSERT INTO ${table}
        (id, <#list columns as column>${column.ColumnName},</#list> creater, updater, create_time, update_time, valid_status)
        VALUES
        (${r'#{id}'}, <#list columns as column>${r'#{'}${column.FieldName}${r'}'},</#list> ${r'#{creater}'}, ${r'#{updater}'}, now(), now(), 1)
    </insert>

    <update id="update" parameterType="info.xpanda.web.tushare.entity.${BigName}Entity">
        UPDATE ${table}
        <set>
            update_time = now(), updater = ${r'#{updater}'},
        <#list columns as column>
            <if test="${column.ColumnName} != null">
            ${column.ColumnName} = ${r'#{'}${column.FieldName}${r'}'},
            </if>
        </#list>
        </set>
        WHERE valid_status = 1 AND id = ${r'#{id}'}
    </update>

    <select id="getById" parameterType="java.lang.Long" resultMap="BaseResultMap">
        SELECT id, <#list columns as column>${column.ColumnName},</#list> creater, updater, create_time, update_time, valid_status
        FROM ${table}
        WHERE valid_status = 1 AND id = ${r'#{id}'}
    </select>
</mapper>