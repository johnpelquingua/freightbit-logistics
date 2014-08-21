package com.sr.biz.freightbit.common.service;

import com.sr.biz.freightbit.common.entity.Parameters;

import java.util.List;
import java.util.Map;

public interface ParameterService {

    public List<Parameters> getParameterMap(String referenceColumn);

    public List<Parameters> getParameterMap(String referenceTable, String referenceColumn);

    public List<Parameters> findParametersByProperty(Map<String, Object> params);

	public void addParameter(Parameters param);

	public void deleteParameter(Parameters param);

	public String updateParameters(List<Parameters> paramList, String referenceTable,
			String referenceColumn);
}
