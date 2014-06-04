package com.sr.biz.freightbit.common.service;

import java.util.List;
import java.util.Map;

import com.sr.biz.freightbit.common.entity.Parameters;

public interface ParameterService {

    public List<Parameters> getParameterMap(String referenceColumn);
    
    public List<Parameters> getParameterMap(String referenceTable, String referenceColumn);

    public List<Parameters> findParametersByProperty(Map<String, Object> params);
}
