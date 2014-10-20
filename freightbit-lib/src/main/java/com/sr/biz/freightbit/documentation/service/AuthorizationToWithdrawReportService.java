package com.sr.biz.freightbit.documentation.service;

import org.pentaho.reporting.engine.classic.core.DataFactory;
import org.pentaho.reporting.engine.classic.core.MasterReport;

import java.util.Map;

/**
 * Created by JMXPSX on 10/20/2014.
 */
public interface AuthorizationToWithdrawReportService {
    public DataFactory getDataFactory(Map<String, String> params);
    public Map<String, Object> getReportParameters(Map<String, String> params);
    public MasterReport getReportDefinition();
    public MasterReport generateReport(Map<String,String> params);

}
