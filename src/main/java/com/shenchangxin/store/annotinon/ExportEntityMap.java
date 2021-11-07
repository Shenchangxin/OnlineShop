package com.shenchangxin.store.annotinon;



import java.lang.annotation.*;


@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface ExportEntityMap {

    String EnName() default "数据库列名";

    String CnName() default "实体映射名";

}