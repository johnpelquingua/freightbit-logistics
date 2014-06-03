package com.sr.biz.freightbit.core.service;

import com.sr.biz.freightbit.core.dao.ContactsDao;
import com.sr.biz.freightbit.core.entity.Client;
import com.sr.biz.freightbit.core.entity.Contacts;
import com.sr.biz.freightbit.core.exceptions.ContactAlreadyExistsException;
import com.sr.biz.freightbit.core.service.impl.ContactServiceImpl;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Clarence C. Victoria on 5/26/14.
 */

@ContextConfiguration(locations = {"classpath:/conf/applicationContext-lib.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class ContactServiceTest {
    //
    @Mock
    private ContactsDao contactsDao;

    @InjectMocks
    private ContactServiceImpl contactService;

    @Before
    public void setUp() throws Exception {
        MockitoAnnotations.initMocks(this);
    }

   /*@Test(expected = ContactAlreadyExistsException.class)
    public void testAddExistingContact() {
        Contacts contacts = initContact();

        List<Contacts> existingContactList = new ArrayList<>();
        existingContactList.add(contacts);

        Mockito.when(contactsDao.findAllContactsByClientId(1)).thenReturn(existingContactList);
        contactService.addContact(contacts);
    }*/

    @Test
    public void testFindAllContacts() {
        Integer clientId = 1;
        List<Contacts> contacts = new ArrayList<>();
        contacts.add(initContact());

       /* Mockito.when(contactsDao.findAllContacts(clientId)).thenReturn(contacts);
        List<Contacts> result = contactService.findAllContactsByClientId(clientId);
        Assert.assertEquals(1, result.size());*/

    }

    /*@Test
    public void findAllContactsByClientId() {
        long clientId = 1;
        List<Contacts> contacts = new ArrayList<>();
        contacts.add(initContact());
        Mockito.when(contactsDao.findAllContacts(clientId)).thenReturn(contacts);
        List<Contacts> results = contactService.findAllContactsByClientId(clientId);
        Assert.assertEquals(contacts.size(), 1);
    }*/

    private Contacts initContact() {
        Client client = new Client("Ernest", new Date(), "Juno", new Date(), "Juno");

        Contacts contacts = new Contacts();
        contacts.setContactId(2);
        contacts.setClient(client);
        contacts.setReferenceTable("AAA");
        contacts.setReferenceId(3);
        contacts.setContactType("Vendor");
        contacts.setFirstName("Clarence");
        contacts.setMiddleName("Columna");
        contacts.setLastName("Victoria");
        contacts.setPhone("123-4567");
        contacts.setMobile("09091234567");
        contacts.setFax("765-4321");
        contacts.setEmail("email@email.com");
        contacts.setCreatedTimestamp(new Date());
        contacts.setCreatedBy("admin");
        contacts.setModifiedTimestamp(new Date());
        contacts.setModifiedBy("admin");

        return contacts;
    }

}