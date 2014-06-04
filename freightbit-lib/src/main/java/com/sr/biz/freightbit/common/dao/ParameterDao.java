package com.sr.biz.freightbit.common.dao;

import java.util.List;
import java.util.Map;

import com.sr.biz.freightbit.common.entity.Parameters;

public interface ParameterDao {

    public List<Parameters> findParameterMapByRefColumn(String referenceColumn);
    
    public List<Parameters> findParameterMapByRefColumn(String referenceTable, String referenceColumn);

    public List<Parameters> findParametersByProperty(Map<String, Object> params);
}
