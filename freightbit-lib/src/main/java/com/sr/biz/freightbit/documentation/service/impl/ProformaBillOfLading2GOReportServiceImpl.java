package com.sr.biz.freightbit.documentation.service.impl;

import com.sr.biz.freightbit.documentation.service.ProformaBillOfLading2GOReportService;
import com.sr.biz.freightbit.documentation.service.ReportGeneratorService;
import org.pentaho.reporting.engine.classic.core.DataFactory;
import org.pentaho.reporting.engine.classic.core.MasterReport;
import org.pentaho.reporting.libraries.resourceloader.Resource;
import org.pentaho.reporting.libraries.resourceloader.ResourceException;
import org.pentaho.reporting.libraries.resourceloader.ResourceManager;

import java.net.URL;
import java.util.HashMap;
import java.util.Map;

public class ProformaBillOfLading2GOReportServiceImpl extends ReportGeneratorService implements ProformaBillOfLading2GOReportService
{
    public MasterReport getReportDefinition()
    {
        try {
            // Get the URL to the reportDefinition file
            final Class classVar = this.getClass();
            final URL reportDefinitionURL = classVar.getResource("/reports/Proforma_2GO.prpt");

            // Parse the report file
            final ResourceManager resourceManager = new ResourceManager();
            final Resource directly = resourceManager.createDirectly(reportDefinitionURL, MasterReport.class);

            return (MasterReport) directly.getResource();
        }catch (ResourceException e)
        {
            e.printStackTrace();
        }
        return null;
    }

    public DataFactory getDataFactory(Map<String, String> params)
    {
        return null;
    }

    public Map<String, Object> getReportParameters(Map<String, String> params)
    {
        final Map parameters = new HashMap<String, Object>();
        parameters.put("orderId", params.get("orderId"));
        parameters.put("orderItemId", params.get("orderItemId"));
        return parameters;
    }

}
