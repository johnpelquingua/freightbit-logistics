package com.sr.biz.freightbit.common.dao;

import com.sr.biz.freightbit.common.entity.Contacts;

import java.util.List;
import java.util.Map;

/**
 * Created by Clarence C. Victoria on 5/26/14.
 */
public interface ContactsDao {

    public void addContact(Contacts contacts);

    public void deleteContact(Contacts contacts);

    public void updateContact(Contacts contacts);

    public List<Contacts> findAllContacts();

    public Contacts findContactById(Integer id);

//    public List<Contacts> findAllContactsByClientId(long clientId);

    public Contacts findContactByReferenceTableAndId(String referenceTable, Integer referenceID);
    
    public List <Contacts>  findContactByRefTableAndIdAndType(String referenceTable, Integer referenceId, String contactType);

    public List<Contacts> findContactByReferenceId(Integer referenceId);

    public List<Contacts> findContactByLastName (String lastName);

	List<Contacts> findContactsByParameterMap(Map<String, Object> paramMap,
			String entity);
}
