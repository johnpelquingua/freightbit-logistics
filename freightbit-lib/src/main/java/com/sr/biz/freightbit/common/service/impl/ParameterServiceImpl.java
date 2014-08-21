package com.sr.biz.freightbit.common.service.impl;

import com.sr.biz.freightbit.common.dao.ParameterDao;
import com.sr.biz.freightbit.common.entity.Parameters;
import com.sr.biz.freightbit.common.service.ParameterService;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Transactional
public class ParameterServiceImpl implements ParameterService {

    private ParameterDao parameterDao;

    public void setParameterDao(ParameterDao parameterDao) {
        this.parameterDao = parameterDao;
    }

    @Override
    public List<Parameters> getParameterMap(String referenceColumn) {
        List<Parameters> parameterMap = parameterDao.findParameterMapByRefColumn(referenceColumn);
        return parameterMap;
    }

    @Override
    public List<Parameters> getParameterMap(String referenceTable, String referenceColumn) {
        List<Parameters> parameterMap = parameterDao.findParameterMapByRefColumn(referenceTable, referenceColumn);
        return parameterMap;
    }

    @Override
    public List<Parameters> findParametersByProperty(Map<String, Object> params) {
        return parameterDao.findParametersByProperty(params);
    }

    @Override
    public void addParameter(Parameters param) {
         parameterDao.addParameter(param);
    }
    
    @Override
    public void deleteParameter(Parameters param) {
    	 parameterDao.deleteParameter(param);
    }
    
    @Override
    public String updateParameters(List <Parameters> paramList, String referenceTable, String referenceColumn) {
    	try {
    		//Get current parameters and delete them
    		parameterDao.deleteParameters(referenceTable, referenceColumn);
    		parameterDao.addParameters(paramList);
    		return "";
    	} catch (Exception e) {
    		if (paramList != null && paramList.size() > 0)
    			return paramList.get(0).getReferenceColumn();
    		else
    			return "ERROR";
    	}
    }
}
