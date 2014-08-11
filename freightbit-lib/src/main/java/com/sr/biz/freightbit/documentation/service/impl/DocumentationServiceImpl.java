package com.sr.biz.freightbit.documentation.service.impl;

import com.sr.biz.freightbit.documentation.dao.impl.DocumentationDaoImpl;
import com.sr.biz.freightbit.documentation.entity.Documentation;
import com.sr.biz.freightbit.documentation.service.DocumentationService;
import com.sr.biz.freightbit.order.entity.Orders;

import java.util.List;

/**
 * Created by Clarence C. Victoria on 8/8/14.
 */
public class DocumentationServiceImpl implements DocumentationService{

    DocumentationDaoImpl documentationDao = new DocumentationDaoImpl();

    public void setDocumentationDao(DocumentationDaoImpl documentationDao) {
        this.documentationDao = documentationDao;
    }

    @Override
    public List<Documentation> findDocumentationByCriteria(String column, String value) {
        return documentationDao.findDocumentationByCriteria(column, value);
    }

    @Override
    public List<Orders> findAllOrdersDocumentation() {
        return documentationDao.findAllOrders();
    }
}
