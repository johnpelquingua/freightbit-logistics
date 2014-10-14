package com.sr.biz.freightbit.common.dao;

import com.sr.biz.freightbit.common.entity.Parameters;

import java.util.List;
import java.util.Map;

public interface ParameterDao {

    public List<Parameters> findParameterMapByRefColumn(String referenceColumn);

    public List<Parameters> findParameterMapByRefColumn(String referenceTable, String referenceColumn);

    public List<Parameters> findParametersByProperty(Map<String, Object> params);

	public void addParameter(Parameters param);

	public void deleteParameter(Parameters param);

	public void addParameters(List<Parameters> paramList);

	public void deleteParameters(String referenceTable, String referenceColumn);

	public void updateParameter(Parameters param);

	public Parameters findParameterById(Integer parameterId);

	public List<Parameters> findShipmentAcitivityParameters(String freightType,
			String serviceMode, Integer currentParameterId);

	public List<Parameters> findParametersByCriteria(String column, String value);
}
