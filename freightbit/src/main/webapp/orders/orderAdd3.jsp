<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>


<div class="table-responsive list-table">
    <table class="table table-striped table-hover table-bordered text-center tablesorter" id="tab_logic">
        <thead>
        <tr >
            <th class="text-center">
                #
            </th>
            <th class="text-center">
                Quantity
            </th>
            <th class="text-center">
                Name
            </th>
            <th class="text-center">
                Weight
            </th>
            <th class="text-center">
                Value
            </th>
            <th class="text-center">
                Class
            </th>
            <th class="text-center">
                Rate
            </th>
            <th class="text-center">
                Description
            </th>
            <th class="text-center">
                Remarks
            </th>

        </tr>
        </thead>
        <tbody>
        <tr id='item0'>
            <td>
                1
            </td>
            <td>
                <input type="text" name='quantity0'  placeholder='Quantity' class="form-control"/>
            </td>
            <td>
                <input type="text" name=name0' placeholder='Name' class="form-control"/>
            </td>
            <td>
                <input type="text" name='weight0' placeholder='Weight' class="form-control"/>
            </td>
            <td>
                <input type="text" name='value0'  placeholder='Value' class="form-control"/>
            </td>
            <td>
                <input type="text" name='class0' placeholder='Classification' class="form-control"/>
            </td>
            <td>
                <input type="text" name='rate0' placeholder='Rate' class="form-control"/>
            </td>
            <td>
                <input type="text" name='description0'  placeholder='Description' class="form-control"/>
            </td>
            <td>
                <input type="text" name='remarks0' placeholder='Remarks' class="form-control"/>
            </td>

        </tr>
        <tr id='item1'></tr>
        </tbody>
    </table>
</div>

<a id="add_row" class="btn btn-default pull-left">Add Row</a><a id='delete_row' class="pull-right btn btn-default">Delete Row</a>