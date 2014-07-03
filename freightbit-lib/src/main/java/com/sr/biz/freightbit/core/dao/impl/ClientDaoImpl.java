package com.sr.biz.freightbit.core.dao.impl;

import com.sr.biz.freightbit.core.dao.ClientDao;
import com.sr.biz.freightbit.core.entity.Client;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public class ClientDaoImpl extends HibernateDaoSupport implements ClientDao {

    private static final Log log = LogFactory.getLog(ClientDaoImpl.class);

    @Override
    public Client findClientById(String clientId) {
        log.debug("Finding client with ID [" + clientId + "]");
        try {
            Client client = (Client) getSessionFactory().getCurrentSession()
                    .get(Client.class, new Integer(clientId));
            return client;
        } catch (Exception e) {
            log.error("Client [" + clientId + "] not found", e);
            throw e;
        }
    }
}
