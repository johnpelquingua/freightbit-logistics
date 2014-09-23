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

package com.sr.biz.freightbit.documentation.service;

import java.util.Map;

import org.pentaho.reporting.engine.classic.core.ClassicEngineBoot;
import org.pentaho.reporting.engine.classic.core.DataFactory;
import org.pentaho.reporting.engine.classic.core.MasterReport;

/**
 * This is the base class used with the report generation examples. It contains the actual <code>embedding</code>
 * of the reporting engine and report generation. All example embedded implementations will need to extend this class
 * and perform the following:
 * <ol>
 * <li>Implement the <code>getReportDefinition()</code> method and return the report definition (how the report
 * definition is generated is up to the implementing class).
 * <li>Implement the <code>getTableDataFactory()</code> method and return the data factory to be used (how
 * this is created is up to the implementing class).
 * <li>Implement the <code>getReportParameters()</code> method and return the set of report parameters to be used.
 * If no report parameters are required, then this method can simply return <code>null</code>
 * </ol>
 */
public abstract class ReportGeneratorService
{
  /**
   * The supported output types for this sample
   */
  public static enum OutputType
  {
    PDF, EXCEL, HTML
  }

  /**
   * Performs the basic initialization required to generate a report
   */
  public ReportGeneratorService()
  {
    // Initialize the reporting engine
    ClassicEngineBoot.getInstance().start();
  }

  /**
   * Returns the report definition used by this report generator. If this method returns <code>null</code>,
   * the report generation process will throw a <code>NullPointerException</code>.
   *
   * @return the report definition used by thus report generator
   */
  public abstract MasterReport getReportDefinition();

  /**
   * Returns the data factory used by this report generator. If this method returns <code>null</code>,
   * the report generation process will use the data factory used in the report definition.
   *
   * @return the data factory used by this report generator
   * @param whereClauseParameters filter to the sql query
   */
  public abstract DataFactory getDataFactory(Map<String, String> whereClauseParameters);

  /**
   * Returns the set of parameters that will be passed to the report generation process. If there are no parameters
   * required for report generation, this method may return either an empty or a <code>null</code> <code>Map</code>
   *
   * @return the set of report parameters to be used by the report generation process, or <code>null</code> if no
   *         parameters are required.
   */
  public abstract Map<String, Object> getReportParameters();

  /**
   * Generates the report in the specified <code>outputType</code> and writes it into the specified
   * <code>outputFile</code>.
   *
   * @param whereClauseParamaeters filter to the sql query
   */
  public MasterReport generateReport(Map<String, String> whereClauseParameters)
  {
	  final MasterReport report = getReportDefinition();
	  final DataFactory dataFactory = getDataFactory(whereClauseParameters);

	    // Set the data factory for the report
	  if (dataFactory != null)
	  {
		  report.setDataFactory(dataFactory);
	  }

	  // Add any parameters to the report
	  final Map<String, Object> reportParameters = getReportParameters();
	  if (null != reportParameters)
	  {
	     for (String key : reportParameters.keySet())
	     {
	        report.getParameterValues().put(key, reportParameters.get(key));
	     }
	  }
	  return report;
  }
}
