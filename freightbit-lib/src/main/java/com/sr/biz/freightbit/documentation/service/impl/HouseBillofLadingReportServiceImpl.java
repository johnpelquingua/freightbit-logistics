package com.sr.biz.freightbit.documentation.service.impl;

import com.sr.biz.freightbit.documentation.service.HouseBillofLadingReportService;
import com.sr.biz.freightbit.documentation.service.ReportGeneratorService;
import org.pentaho.reporting.engine.classic.core.DataFactory;
import org.pentaho.reporting.engine.classic.core.MasterReport;
import org.pentaho.reporting.libraries.resourceloader.Resource;
import org.pentaho.reporting.libraries.resourceloader.ResourceException;
import org.pentaho.reporting.libraries.resourceloader.ResourceManager;

import java.net.URL;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by user on 10/15/2014.
 */
public class HouseBillofLadingReportServiceImpl extends ReportGeneratorService implements HouseBillofLadingReportService {

    public MasterReport getReportDefinition()
    {
        try
        {
            // Get the URL to the reportDefinition file
            final Class classVar = this.getClass();
            final URL reportDefinitionURL = classVar.getResource("/reports/Bill_of_Lading.prpt");

            // Parse the report file
            final ResourceManager resourceManager = new ResourceManager();
            final Resource directly = resourceManager.createDirectly(reportDefinitionURL, MasterReport.class);

            return (MasterReport) directly.getResource();
        }
        catch (ResourceException e)
        {
            e.printStackTrace();
        }
        return null;

    }


    public DataFactory getDataFactory(Map<String, String> whereClauseParameters) {
        return null;
    }


    public Map<String, Object> getReportParameters(Map<String, String> params) {
        final Map parameters = new HashMap<String, Object>();
        parameters.put("orderId", params.get("orderId"));
        parameters.put("orderItemId",params.get("orderItemId"));
        return parameters;

    }
}
