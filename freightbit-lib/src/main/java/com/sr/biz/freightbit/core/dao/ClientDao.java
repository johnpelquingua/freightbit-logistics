package com.sr.biz.freightbit.core.dao;

import com.sr.biz.freightbit.core.entity.Client;

public interface ClientDao {

    public abstract Client findClientById(String clientId);

}