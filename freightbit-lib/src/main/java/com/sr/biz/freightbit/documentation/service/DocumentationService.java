package com.sr.biz.freightbit.documentation.service;

import com.sr.biz.freightbit.documentation.entity.Documentation;
import com.sr.biz.freightbit.order.entity.Orders;

import java.util.List;

/**
 * Created by Clarence C. Victoria on 8/8/14.
 */
public interface DocumentationService {

    public List<Documentation> findDocumentationByCriteria(String column, String value);

    public List<Orders> findAllOrdersDocumentation();

}
