package com.sr.biz.freightbit.documentation.service.impl;

import com.sr.biz.freightbit.documentation.dao.impl.DocumentsDaoImpl;
import com.sr.biz.freightbit.documentation.entity.Documents;
import com.sr.biz.freightbit.documentation.service.DocumentsService;
import com.sr.biz.freightbit.order.entity.Orders;

import java.util.List;

/**
 * Created by Clarence C. Victoria on 8/8/14.
 */
public class DocumentsServiceImpl implements DocumentsService {

    DocumentsDaoImpl documentationDao = new DocumentsDaoImpl();

    public void setDocumentationDao(DocumentsDaoImpl documentationDao) {
        this.documentationDao = documentationDao;
    }

    @Override
    public List<Documents> findDocumentationByCriteria(String column, String value) {
        return documentationDao.findDocumentationByCriteria(column, value);
    }

    @Override
    public List<Orders> findAllOrdersDocumentation() {
        return documentationDao.findAllOrdersDocuments();
    }
}
