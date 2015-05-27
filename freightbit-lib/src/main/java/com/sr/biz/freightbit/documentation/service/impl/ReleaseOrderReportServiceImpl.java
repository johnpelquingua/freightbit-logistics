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

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.pentaho.reporting.engine.classic.core.DataFactory;
import org.pentaho.reporting.engine.classic.core.MasterReport;
import org.pentaho.reporting.engine.classic.core.modules.misc.datafactory.sql.DriverConnectionProvider;
import org.pentaho.reporting.engine.classic.core.modules.misc.datafactory.sql.SQLReportDataFactory;
import org.pentaho.reporting.libraries.resourceloader.Resource;
import org.pentaho.reporting.libraries.resourceloader.ResourceException;
import org.pentaho.reporting.libraries.resourceloader.ResourceManager;

import com.sr.biz.freightbit.documentation.service.ReleaseOrderReportService;
import com.sr.biz.freightbit.documentation.service.ReportGeneratorService;

/**
 * Generates a report in the following scenario:
 * <ol>
 * <li>The report definition file is a .prpt file which will be loaded and parsed
 * <li>The data factory is a simple JDBC data factory using HSQLDB
 * <li>There are no runtime report parameters used
 * </ol>
 */
public class ReleaseOrderReportServiceImpl extends ReportGeneratorService  implements ReleaseOrderReportService {
//	private static final String RELEASE_ORDER = "ReleaseOrder";


  /**
   * Returns the report definition which will be used to generate the report. In this case, the report will be
   * loaded and parsed from a file contained in this package.
   *
   * @return the loaded and parsed report definition to be used in report generation.
   */
  public MasterReport getReportDefinition() {
    try {
      // Get the URL to the reportDefinition file
      final Class classVar = this.getClass();
      final URL reportDefinitionURL = classVar.getResource("/reports/Release_Order.prpt");

      // Parse the report file
      final ResourceManager resourceManager = new ResourceManager();
      final Resource directly = resourceManager.createDirectly(reportDefinitionURL, MasterReport.class);
      //final MasterReport report = (MasterReport) directly.getResource();
      //report.setQuery(RELEASE_ORDER);
      //report.addPreProcessor(new RelationalAutoGeneratorPreProcessor());

      //return report;

      return (MasterReport) directly.getResource();

    } catch (ResourceException e) {
      e.printStackTrace();
    }
    return null;
  }

  /**
   * Returns the data factory which will be used to generate the data used during report generation.
   *
   * @return the data factory used with the report generator
   */
  /*public DataFactory getDataFactory(Map<String, String> params)
  {
	Properties prop = new Properties();
	String propFileName = "jdbc.properties";

    InputStream inputStream = getClass().getClassLoader().getResourceAsStream(propFileName);
    try {
		prop.load(inputStream);
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

    final DriverConnectionProvider sampleDriverConnectionProvider = new DriverConnectionProvider();
    sampleDriverConnectionProvider.setDriver(prop.getProperty("jdbc.driverClassName"));
    sampleDriverConnectionProvider.setUrl(prop.getProperty("jdbc.databaseurl"));
    sampleDriverConnectionProvider.setProperty("user", prop.getProperty("jdbc.username"));
    sampleDriverConnectionProvider.setProperty("password", prop.getProperty("jdbc.password"));

    String orderId = params.get("orderId");
    String orderItemId = params.get("orderItemId");
    String query = "SELECT o.createdTimeStamp as dateOfBooking, o.orderNumber as orderNumber, "
    		+ "o.destinationPort as destinationPort, o.originationPort as originPort, "
    		+ "o.serviceMode as serviceMode, "
    		+ "o.paymentMode as paymentMode, "
    		+ "cs.firstName as shipperFirstName, cs.lastName as shipperLastName, cs.middleName as shipperMiddleName, cs.phone as shipperPhone, "
    		+ "cc.firstName as consigneeFirstName, cc.lastName as consigneeLastName, cc.middleName as consigneeMiddleName, cc.phone as consigneePhone, "
    		+ "vs.vesselName as vesselName, t.truckCode as truckCode,"
    		+ "custS.customerName as shipper, "
    		+ "custC.customerName as consignee, "
    		+ "oi.quantity as quantity, oi.classification as classification, oi.commodity as commodity, oi.declaredValue as declaredValue, oi.nameSize as size "
    		+ "FROM orders o "
    		+ "JOIN orderitems oi ON o.orderId = oi.orderId "
    		+ "LEFT JOIN contacts cs ON o.shipperContactId = cs.contactId "
    		+ "LEFT JOIN contacts cc ON o.consigneeContactId = cc.contactId "
    		+ "LEFT JOIN vessels vs ON o.vesselNumber = vs.vesselNumber "
    		+ "LEFT JOIN trucks t ON o.truckCode = t.truckCode "
    		+ "LEFT JOIN customers custS ON o.shipperCode = custS.customerCode "
    		+ "LEFT JOIN customers custC ON o.consigneeCode = custC.customerCode "
    		+ "where o.orderId = '" + orderId + "' "
    		+ "and oi.orderItemId ='" + orderItemId + "';";
    final SQLReportDataFactory dataFactory = new SQLReportDataFactory(sampleDriverConnectionProvider);
    dataFactory.setQuery(RELEASE_ORDER,  query);

    return dataFactory;
  }*/
  public DataFactory getDataFactory(Map<String, String> whereClauseParameters) {
    return null;
  }

  /**
   * Returns the set of runtime report parameters.
   *
   * @return <code>null</code> indicating the report generator does not use any report parameters
   */
  /*public Map<String, Object> getReportParameters(Map<String, String> params) {
    return null;
  }*/

  public Map<String, Object> getReportParameters(Map<String, String> params) {
    final Map parameters = new HashMap<String, Object>();
    parameters.put("orderId", params.get("orderId"));
    parameters.put("documentId", params.get("documentId"));
    return parameters;

  }

}