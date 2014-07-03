package com.sr.biz.freightbit.core.service.impl;

import com.sr.biz.freightbit.core.dao.ClientDao;
import com.sr.biz.freightbit.core.entity.Client;
import com.sr.biz.freightbit.core.service.ClientService;

public class ClientServiceImpl implements ClientService {

    private ClientDao clientDao;

    public void setClientDao(ClientDao clientDao) {
        this.clientDao = clientDao;
    }

    public Client findClientById(String clientId) {
        return clientDao.findClientById(clientId);
    }
}
