package com.sr.biz.freightbit.documentation.service.impl;

import com.sr.biz.freightbit.core.exceptions.DocumentAlreadyExistsException;
import com.sr.biz.freightbit.documentation.dao.DocumentsDao;
import com.sr.biz.freightbit.documentation.entity.Documents;
import com.sr.biz.freightbit.documentation.service.DocumentsService;
import com.sr.biz.freightbit.order.entity.Orders;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

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

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addDocuments(Documents documents){
        documentsDao.addDocuments(documents);
    }

    @Override
    public List<Documents> findOrderDocumentation() {
        return documentsDao.findOrderDocumentations();
    }

    @Override
    public List<Documents> findDocumentsByOrderId(Integer orderId) { return documentsDao.findDocumentsByOrderId(orderId); }

    @Override
    public Documents findDocumentById(Integer documentId) { return documentsDao.findDocumentById(documentId); }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void updateDocument(Documents documents) {
        if(documentsDao.findDuplicateDocumentByDocumentName(documents.getDocumentName(), documents.getDocumentId()).size() > 0){
            throw new DocumentAlreadyExistsException(documents.getDocumentName());
        }else{
            documentsDao.updateDocument(documents);
        }
    }

    @Override
    public List<Documents> findDocumentByStageAndID (String documentType, Integer referenceId) {
        return documentsDao.findDocumentByStageAndID(documentType, referenceId);
    }

}
