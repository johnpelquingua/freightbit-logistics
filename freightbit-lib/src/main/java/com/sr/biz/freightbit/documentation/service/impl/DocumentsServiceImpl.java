package com.sr.biz.freightbit.documentation.service.impl;

import com.sr.biz.freightbit.documentation.dao.DocumentsDao;
import com.sr.biz.freightbit.documentation.entity.Documents;
import com.sr.biz.freightbit.documentation.service.DocumentsService;
import com.sr.biz.freightbit.order.entity.Orders;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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
    public List<Documents> findDocumentsByOrderNumber(String orderNumber) { return documentsDao.findDocumentsByOrderNumber(orderNumber); }

    @Override
    public List<Documents> findOperationDocumentsByOrderId(Integer orderId) { return documentsDao.findOperationDocumentsByOrderId(orderId); }

    @Override
    public Documents findDocumentById(Integer documentId) { return documentsDao.findDocumentById(documentId); }

    @Override
    public List<Documents> findDocumentsByAging(Integer aging) {
        return documentsDao.findDocumentsByAging(aging);    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void updateDocument(Documents documents) {
//        if(documentsDao.findDuplicateDocumentByDocumentName(documents.getDocumentName(), documents.getDocumentId()).size() > 0){
//            throw new DocumentAlreadyExistsException(documents.getDocumentName());
//        }else{
            documentsDao.updateDocument(documents);
//        }
    }

    @Override
    public List<Documents> findDocumentByOutboundStageAndID (Integer outboundStage, Integer referenceId) {
        return documentsDao.findDocumentByOutboundStageAndID(outboundStage, referenceId);
    }

    @Override
    public List<Documents> findDocumentByInboundStageAndID (Integer inboundStage, Integer referenceId) {
        return documentsDao.findDocumentByInboundStageAndID(inboundStage, referenceId);
    }

    @Override
    public List<Documents> findDocumentByFinalOutboundStageAndID (Integer finalOutboundStage, Integer referenceId) {
        return documentsDao.findDocumentByFinalOutboundStageAndID(finalOutboundStage, referenceId);
    }

    @Override
    public List<Documents> findDocumentByFinalInboundStageAndID (Integer finalInboundStage, Integer referenceId) {
        return documentsDao.findDocumentByFinalInboundStageAndID(finalInboundStage, referenceId);
    }

    @Override
    public List<Documents> findDocumentByCompleteStageAndID (Integer completeStage, Integer referenceId) {
        return documentsDao.findDocumentByCompleteStageAndID(completeStage, referenceId);
    }

    @Override
    public List<Documents> findDocumentByArchiveStageAndID (Integer archiveStage, Integer referenceId) {
        return documentsDao.findDocumentByArchiveStageAndID(archiveStage, referenceId);
    }

    @Override
    public List<Documents> findDocumentByBillingStageAndID (Integer billingStage, Integer referenceId) {
        return documentsDao.findDocumentByBillingStageAndID(billingStage, referenceId);
    }

    @Override
    public Documents findDocumentByNameAndVendorCode(String documentName, String vendorCode) {
        return documentsDao.findDocumentByNameAndVendorCode(documentName, vendorCode);
    }

    @Override
    public List<Documents> findDocumentNameAndId(String documentName, Integer referenceId){
        return documentsDao.findDocumentNameAndId(documentName, referenceId);
    }

    @Override
    public List<Documents> findAllFreightDocuments(Integer referenceId){
        return documentsDao.findAllFreightDocuments(referenceId);
    }

    @Override
    public Documents findDocumentNameAndOrderId (String documentName, Integer referenceId){
        return documentsDao.findDocumentNameAndOrderId(documentName, referenceId);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void deleteDocument(Documents documents){
        documentsDao.deleteDocument(documents);
    }

    @Override
    public List<Documents> findEIRAndRefId(String documentName, Integer referenceId, String referenceTable){
        return documentsDao.findEIRAndRefId(documentName, referenceId, referenceTable );
    }
}
