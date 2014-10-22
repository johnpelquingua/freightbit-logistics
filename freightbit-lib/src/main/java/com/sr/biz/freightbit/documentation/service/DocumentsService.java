package com.sr.biz.freightbit.documentation.service;

import com.sr.biz.freightbit.documentation.entity.Documents;
import com.sr.biz.freightbit.order.entity.Orders;

import java.util.List;

/**
 * Created by Clarence C. Victoria on 8/8/14.
 */
public interface DocumentsService {

    public List<Documents> findDocumentationByCriteria(String column, String value);

    public List<Orders> findAllOrdersDocumentation();

    public void addDocuments(Documents documents);

    public List<Documents> findOrderDocumentation();

    public List<Documents> findDocumentsByOrderId(Integer orderId);

    public Documents findDocumentById(Integer documentId);

    public void updateDocument(Documents documents);

    public List<Documents> findDocumentByOutboundStageAndID (Integer outboundStage, Integer referenceId);

}
