package com.sr.biz.freightbit.core.service.impl;

import com.sr.biz.freightbit.core.dao.ContactsDao;
import com.sr.biz.freightbit.core.entity.Contacts;
import com.sr.biz.freightbit.core.exceptions.ContactAlreadyExistsException;
import com.sr.biz.freightbit.core.service.ContactService;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Clarence C. Victoria on 5/26/14.
 */
public class ContactServiceImpl implements ContactService {
//
    private ContactsDao contactsDao;

    public void setContactsDao(ContactsDao contactsDao) {
        this.contactsDao = contactsDao;
    }

    @Override
    public Contacts findContactById(long contactId) {
        return contactsDao.findContactById(contactId);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addContact(Contacts contacts) throws ContactAlreadyExistsException {
        if (contactsDao.findContactById(contacts.getContactId()) != null) {
            throw new ContactAlreadyExistsException(contacts.getContactId());
        } else {
            contactsDao.addContact(contacts);
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void deleteContact(Contacts contacts) {
        contactsDao.deleteContact(contacts);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void updateContact(Contacts contacts) {
        contactsDao.updateContact(contacts);
    }

    @Override
    public List<Contacts> findAllContacts(long clientId) {
        List<Contacts> contacts =contactsDao.findAllContacts(clientId);
        return contacts;
    }

    @Override
    public List<Contacts> findAllContactsByClientId(long clientId){
        return contactsDao.findAllContactsByClientId(clientId);
    }
}
