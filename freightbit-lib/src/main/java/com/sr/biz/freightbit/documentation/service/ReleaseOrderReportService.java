package com.sr.biz.freightbit.documentation.service;

import java.util.Map;

import org.pentaho.reporting.engine.classic.core.DataFactory;
import org.pentaho.reporting.engine.classic.core.MasterReport;

public interface ReleaseOrderReportService {
	public DataFactory getDataFactory(Map<String, String> whereClauseParameters);
	public Map<String, Object> getReportParameters();
	public MasterReport getReportDefinition();
	public MasterReport generateReport(Map<String, String> whereClauseParameters);
}
