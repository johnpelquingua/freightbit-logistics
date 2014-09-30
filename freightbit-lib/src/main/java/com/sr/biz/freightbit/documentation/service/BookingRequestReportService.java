package com.sr.biz.freightbit.documentation.service;

import java.util.Map;

import org.pentaho.reporting.engine.classic.core.DataFactory;
import org.pentaho.reporting.engine.classic.core.MasterReport;

public interface BookingRequestReportService {
	public DataFactory getDataFactory(Map<String, String> params);
	public Map<String, Object> getReportParameters(Map<String, String> params);
	public MasterReport getReportDefinition();
	public MasterReport generateReport(Map<String, String> params);
}
