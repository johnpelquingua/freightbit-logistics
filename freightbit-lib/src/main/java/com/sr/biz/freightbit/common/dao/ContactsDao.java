package com.sr.biz.freightbit.common.dao;

import com.sr.biz.freightbit.common.entity.Contacts;

import java.util.List;
import java.util.Map;

/**
 * Created by Clarence C. Victoria on 5/26/14.
 */
public interface ContactsDao {

    public Integer addContact(Contacts contacts);

    public void deleteContact(Contacts contacts);

    public void updateContact(Contacts contacts);

    public List<Contacts> findAllContacts();

    public Contacts findContactById(Integer contactId);

//    public List<Contacts> findAllContactsByClientId(long clientId);

    public List<Contacts> findDuplicateContactByLastName(String lastName, Integer contactId);

    public Contacts findContactByReferenceTableAndId(String referenceTable, Integer referenceID);

    public List<Contacts> findContactByRefTableAndIdAndType(String referenceTable, Integer referenceId, String contactType);

    public List<Contacts> findContactByReferenceId(Integer referenceId);

    public List<Contacts> findContactByLastName(String lastName);

    public List<Contacts> findContactsByParameterMap(Map<String, Object> paramMap,
                                                     String entity);
}
