package com.sr.biz.freightbit.common.dao;

import com.sr.biz.freightbit.common.entity.Contacts;

import java.util.List;
import java.util.Map;

public interface ContactsDao {

    public Integer addContact(Contacts contacts);

    public void deleteContact(Contacts contacts);

    public void updateContact(Contacts contacts);

    public List<Contacts> findAllContacts();

    public Contacts findContactById(Integer contactId);

    public List<Contacts> findDuplicateContactByNameAndId(String lastName, String firstName, Integer contactId, Integer referenceId);

    public Contacts findContactByReferenceTableAndId(String referenceTable, Integer referenceID);

    public List<Contacts> findContactsByCustomer(Integer referenceId);

    public List<Contacts> findContactByRefTableAndIdAndType(String referenceTable, Integer referenceId, String contactType);

    public List<Contacts> findContactByRefTableAndId(String referenceTable, Integer referenceId);

    public List<Contacts> findContactByReferenceId(Integer referenceId);

    public List<Contacts> findContactsByReferenceIdOnly(Integer referenceId);

    public List<Contacts> findContactByLastNameAndFirstName(String lastName, String firstName);

    public List<Contacts> findContactsByParameterMap(Map<String, Object> paramMap,
                                                     String entity);
}
