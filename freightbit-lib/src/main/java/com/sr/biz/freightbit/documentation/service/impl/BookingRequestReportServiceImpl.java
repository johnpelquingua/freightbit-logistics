/*!
* This program is free software; you can redistribute it and/or modify it under the
* terms of the GNU Lesser General Public License, version 2.1 as published by the Free Software
* Foundation.
*
* You should have received a copy of the GNU Lesser General Public License along with this
* program; if not, you can obtain a copy at http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html
* or from the Free Software Foundation, Inc.,
* 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
*
* This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
* without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
* See the GNU Lesser General Public License for more details.
*
* Copyright (c) 2002-2013 Pentaho Corporation..  All rights reserved.
*/

package com.sr.biz.freightbit.documentation.service.impl;

import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.pentaho.reporting.engine.classic.core.DataFactory;
import org.pentaho.reporting.engine.classic.core.MasterReport;
import org.pentaho.reporting.libraries.resourceloader.Resource;
import org.pentaho.reporting.libraries.resourceloader.ResourceException;
import org.pentaho.reporting.libraries.resourceloader.ResourceManager;

import com.sr.biz.freightbit.documentation.service.BookingRequestReportService;
import com.sr.biz.freightbit.documentation.service.ReportGeneratorService;


public class BookingRequestReportServiceImpl extends ReportGeneratorService  implements BookingRequestReportService
{


  public MasterReport getReportDefinition()
  {
	    try
	    {
	      // Get the URL to the reportDefinition file
	      final Class classVar = this.getClass();
	      final URL reportDefinitionURL = classVar.getResource("/reports/Booking_Request_Form.prpt");
	
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
	    parameters.put("orderId", params.get("orderId"));
	    parameters.put("orderItemId", params.get("orderItemId"));
	    return parameters;
  }
}
