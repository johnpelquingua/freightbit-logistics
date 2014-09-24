package com.sr.biz.freightbit.documentation.service.impl;

import com.sr.biz.freightbit.documentation.dao.DocumentsDao;
import com.sr.biz.freightbit.documentation.entity.Documents;
import com.sr.biz.freightbit.documentation.service.DocumentsService;
import com.sr.biz.freightbit.order.entity.Orders;

import java.util.List;

/**
 * Created by Clarence C. Victoria on 8/8/14.
 */
public class DocumentsServiceImpl implements DocumentsService {

    /*DocumentsDaoImpl documentsDao = new DocumentsDaoImpl();*/

    /*public DocumentsDaoImpl getDocumentsDao() {
        return documentsDao;
    }*/

    private DocumentsDao documentsDao;

    public void setDocumentsDao(DocumentsDao documentsDao) {
        this.documentsDao = documentsDao;
    }

    @Override
    public List<Documents> findDocumentationByCriteria(String column, String value) {
        return documentsDao.findDocumentationByCriteria(column, value);
    }

    @Override
    public List<Orders> findAllOrdersDocumentation() {
        return documentsDao.findAllOrdersDocuments();
    }
}
