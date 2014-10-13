package com.sr.biz.freightbit.documentation.dao;

import com.sr.biz.freightbit.documentation.entity.Documents;
import com.sr.biz.freightbit.order.entity.Orders;

import java.util.List;

/**
 * Created by Clarence C. Victoria on 8/8/14.
 */
public interface DocumentsDao {

    public List<Documents> findDocumentationByCriteria(String column, String value);

    public List<Orders> findAllOrdersDocuments();

    public void addDocuments(Documents documents);

    public List<Documents> findOrderDocumentations();

    public List<Documents> findDocumentsByOrderId(Integer orderId);

    public Documents findDocumentById(Integer documentId);

    public List <Documents> findDuplicateDocumentByDocumentName(String documentName, Integer documentId);

    public void updateDocument(Documents documents);

    public List<Documents> findDocumentByStageAndID(String documentType, Integer referenceId);
}
