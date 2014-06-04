package com.sr.biz.freightbit.core.service;

import com.sr.biz.freightbit.core.entity.Contacts;
import org.omg.PortableServer.LIFESPAN_POLICY_ID;

import java.util.List;

/**
 * Created by Clarence C. Victoria on 5/26/14.
 */
public interface ContactService {
//
    public Contacts findContactById(long contactId);

    public void addContact(Contacts contacts);

    public void deleteContact(Contacts contacts);

    public void updateContact(Contacts contacts);

    public List<Contacts> findAllContacts(long clientId);

//    public List<Contacts> findAllContactsByClientId(long clientId);
}
