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

    public List<Parameters> getParameterMap(String referenceTable, String referenceColumn) {
        List<Parameters> parameterMap = parameterDao.findParameterMapByRefColumn(referenceTable, referenceColumn);
        return parameterMap;
    }

    public List<Parameters> findParametersByProperty(Map<String, Object> params) {
        return parameterDao.findParametersByProperty(params);
    }

}
