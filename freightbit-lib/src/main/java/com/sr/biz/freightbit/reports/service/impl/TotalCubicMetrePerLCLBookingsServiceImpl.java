package com.sr.biz.freightbit.reports.service.impl;

import com.sr.biz.freightbit.documentation.service.ReportGeneratorService;
import com.sr.biz.freightbit.reports.service.TotalCubicMetrePerLCLBookingsService;
import org.pentaho.reporting.engine.classic.core.DataFactory;
import org.pentaho.reporting.engine.classic.core.MasterReport;
import org.pentaho.reporting.libraries.resourceloader.Resource;
import org.pentaho.reporting.libraries.resourceloader.ResourceException;
import org.pentaho.reporting.libraries.resourceloader.ResourceManager;

import java.net.URL;
import java.util.HashMap;
import java.util.Map;

public class TotalCubicMetrePerLCLBookingsServiceImpl extends ReportGeneratorService implements TotalCubicMetrePerLCLBookingsService{
    public MasterReport getReportDefinition()
    {
        try
        {
            // Get the URL to the reportDefinition file
            final Class classVar = this.getClass();
            final URL reportDefinitionURL = classVar.getResource("/reports/LCL_Total_Cubic_Meter_per_Bookings.prpt");

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


    public DataFactory getDataFactory(Map<String, String> params)
    {
        return null;
    }

    /**
     * Returns the set of runtime report parameters.
     *
     * NOTE: Make sure to populate the params Map in your action
     * e.g., param.put("orderId", order.getOrderId());
     */
    public Map<String, Object> getReportParameters(Map<String, String> params)
    {
        final Map parameters = new HashMap<String, Object>();
        parameters.put("dateFrom", params.get("dateFrom"));
        parameters.put("dateTo", params.get("dateTo"));
        parameters.put("reportGenerator", params.get("reportGenerator"));
        return parameters;
    }
}
