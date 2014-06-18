package com.sr.biz.freightbit.common.service;

import com.sr.biz.freightbit.common.entity.Contacts;

import java.util.List;

/**
 * Created by Clarence C. Victoria on 5/26/14.
 */
public interface ContactService {
//


    public void addContact(Contacts contacts);

    public void deleteContact(Contacts contacts);

    public void updateContact(Contacts contacts);

    public List<Contacts> findAllContacts();

//    public List<Contacts> findAllContactsByClientId(long clientId);
}
