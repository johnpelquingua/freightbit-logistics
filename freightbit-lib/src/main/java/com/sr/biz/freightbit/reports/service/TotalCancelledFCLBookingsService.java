package com.sr.biz.freightbit.reports.service;

import org.pentaho.reporting.engine.classic.core.DataFactory;
import org.pentaho.reporting.engine.classic.core.MasterReport;

import java.util.Map;

/**
 * Created by Kevin on 5/13/2015.
 */
public interface TotalCancelledFCLBookingsService {
    public DataFactory getDataFactory(Map<String, String> params);
    public Map<String, Object> getReportParameters(Map<String, String> params);
    public MasterReport getReportDefinition();
    public MasterReport generateReport(Map<String, String> params);
}
