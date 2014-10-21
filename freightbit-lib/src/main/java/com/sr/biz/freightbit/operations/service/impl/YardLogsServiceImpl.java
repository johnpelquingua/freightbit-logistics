package com.sr.biz.freightbit.operations.service.impl;

import com.sr.biz.freightbit.operations.dao.YardLogsDao;
import com.sr.biz.freightbit.operations.service.YardLogsService;

/**
 * Created by user on 10/21/2014.
 */
public class YardLogsServiceImpl implements YardLogsService {

    private YardLogsDao yardLogsDao;

    public void setYardLogsDao(YardLogsDao yardLogsDao) {
        this.yardLogsDao = yardLogsDao;
    }
}
