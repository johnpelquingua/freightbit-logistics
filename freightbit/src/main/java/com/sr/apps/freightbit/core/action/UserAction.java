package com.sr.apps.freightbit.core.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.apps.freightbit.core.formbean.PasswordBean;
import com.sr.apps.freightbit.core.formbean.PermissionBean;
import com.sr.apps.freightbit.core.formbean.UserBean;
import com.sr.apps.freightbit.util.CommonUtils;
import com.sr.apps.freightbit.util.ParameterConstants;
import com.sr.biz.freightbit.common.entity.Notification;
import com.sr.biz.freightbit.common.entity.Parameters;
import com.sr.biz.freightbit.common.service.NotificationService;
import com.sr.biz.freightbit.common.service.ParameterService;
import com.sr.biz.freightbit.core.entity.Client;
import com.sr.biz.freightbit.core.entity.Permission;
import com.sr.biz.freightbit.core.entity.PermissionUserGroup;
import com.sr.biz.freightbit.core.entity.User;
import com.sr.biz.freightbit.core.exceptions.UserAlreadyExistsException;
import com.sr.biz.freightbit.core.service.ClientService;
import com.sr.biz.freightbit.core.service.PermissionService;
import com.sr.biz.freightbit.core.service.UserService;
import com.sr.biz.freightbit.customer.entity.Customer;
import com.sr.biz.freightbit.customer.service.CustomerService;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.security.crypto.bcrypt.BCrypt;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static org.springframework.util.StringUtils.isEmpty;

/**
 * UserAction includes view list of users, add, delete, edit, and view user info
 * Implements Preparable to allow the prepopulation of dropdown values inside prepare()
 * Validation done on validateOnSubmit() for addUser() and editUser()
 * FormBean UserBean contains fields that are to be displayed in the JSP
 */
public class UserAction extends ActionSupport implements Preparable {

    private static final long serialVersionUID = 1L;
    private static final Logger log = Logger.getLogger(UserAction.class);
    private List<UserBean> users = new ArrayList<UserBean>(); //list of users displayed in User List page
    private List<Parameters> userTypeList = new ArrayList<Parameters>(); //User type drop down values
    private List<Parameters> statusList = new ArrayList<Parameters>(); //Status drop down values
    private List<Parameters> userSearchList = new ArrayList<Parameters>();
    private List <Customer> customerList = new ArrayList<Customer>();
    private UserBean user = new UserBean(); //single user object
    private String userNameParam; //parameter used to identify which specific user is to be edited/deleted/viewed
    private Integer userIdParam; 
    private List<PermissionBean> permissionsList = new ArrayList<PermissionBean>(); //list of permissions from Permissions table
    private String permissionsSelected; //will contain the checked permissions from the jsp
    private String[] preSelectedPermissions; //the default permission id's assigned to the user
    private String[] preSelectedPermissionNames; //the permission names assigned to the user
    private PasswordBean passwordBean = new PasswordBean();
    private UserService userService;
    private ClientService clientService;
    private ParameterService parameterService;
    private PermissionService permissionService;
    private CustomerService customerService;
    private NotificationService notificationService;
    private CommonUtils commonUtils;

    public String loadSearchUserPage() {
        return SUCCESS;
    }

    public String viewUsers() {
        String column = getColumnFilter();
        List<User> userEntityList = new ArrayList<User>();
        if (StringUtils.isNotBlank(column)) {
            userEntityList = userService.findUsersByCriteria(column, user.getUserKeyword(), getClientId());
        } else {
            userEntityList = userService.findAllUsers(getClientId());
        }
        for (User userElem : userEntityList) {
            users.add(transformToFormBean(userElem));
        }
        return SUCCESS;
    }

    public String loadviewUsers() {
        String column = getColumnFilter();
        List<User> userEntityList = new ArrayList<User>();
        if (StringUtils.isNotBlank(column)) {
            userEntityList = userService.findUsersByCriteria(column, user.getUserKeyword(), getClientId());
        } else {
            userEntityList = userService.findAllUsers(getClientId());
        }
        for (User userElem : userEntityList) {
            users.add(transformToFormBean(userElem));
        }
        clearErrorsAndMessages();
        addActionMessage("Success! User account has been deleted.");
        return SUCCESS;
    }

//used to view list with deletion of new entries in Notification Database
    public String viewUsersNew() {
        String column = getColumnFilter();
        List<User> userEntityList = new ArrayList<User>();
        notificationService.clearNewUser();
        if (StringUtils.isNotBlank(column)) {
            userEntityList = userService.findUsersByCriteria(column, user.getUserKeyword(), getClientId());
        } else {
            userEntityList = userService.findAllUsers(getClientId());
        }
        for (User userElem : userEntityList) {
            users.add(transformToFormBean(userElem));
        }
        return SUCCESS;
    }

    private String getColumnFilter() {
        String column = "";
        if ("USER TYPE".equals(user.getUserSearchCriteria())) {
            column = "userType";
        } else if ("USER NAME".equals(user.getUserSearchCriteria())) {
            column = "username";
        } else if ("NAME".equals(user.getUserSearchCriteria())) {
            column = "firstName";
        }
        return column;
    }

    public String loadAddUserPage() {
        Client client = clientService.findClientById(getClientId().toString());
    	if (client != null)
    		user.setCompanyName(client.getClientName());
    	else
    		user.setCompanyName("");
    	user.setUserName("");
    	user.setPassword("");
    	populatePermissionsList(1);
        return SUCCESS;
    }

    public String addUser() throws Exception {
    	try {

	        validateOnSubmit(user);
	        if (hasFieldErrors()) {
                populatePermissionsList(1);
                return INPUT;
            }
	        Integer userId = userService.addUser(transformToEntityBean(user));
	        addPermissionsToUser(userId);
	        populatePermissionsList(userId);

            Notification notificationEntity = new Notification();
            notificationEntity.setDescription("USER");
            notificationEntity.setNotificationId(1);
            notificationEntity.setNotificationType("Email");
            notificationEntity.setReferenceId(1);
            notificationEntity.setReferenceTable("User");
            notificationEntity.setUserId(1);

            notificationService.addNotification(notificationEntity);

	        clearErrorsAndMessages();
	        addActionMessage("Success! A New User has been added.");
	
	        return SUCCESS;
        } catch (UserAlreadyExistsException e) {
            addFieldError("user.userName", getText("err.username.already.exists"));

            return INPUT;
        }
    }

    public String loadEditUserPage() {
        User userEntity = userService.findUserByUserName(userNameParam);
        user = transformToFormBean(userEntity);
        populatePermissionsList(1);
        return SUCCESS;
    }

    public String editUser() throws Exception {
    	populatePermissionsList(Integer.parseInt(user.getUserId()));
        try {
	    	userService.updateUser(transformToEntityBean(user));
	        if (StringUtils.isNotBlank(user.getUserId())) {
	        	addPermissionsToUser(Integer.parseInt(user.getUserId()));
	        }
	        
	        clearErrorsAndMessages();
	        addActionMessage("Success! User has been updated.");
	
	        return SUCCESS;
        } catch (UserAlreadyExistsException e) {
             addFieldError("user.userName", getText("err.username.already.exists"));
             return INPUT;
        }
    }

    public String deleteUser() {
        User userEntity = userService.findUserByUserName(userNameParam);
        Integer currentLoggedInUser = commonUtils.getUser().getUserId();
        if (currentLoggedInUser.equals(userEntity.getUserId()))
        	addActionMessage("Current logged-in user cannot be deleted.");
        else 
        	userService.deleteUser(userEntity);

        return SUCCESS;
    }

    public String viewUserInfo() {
        User userEntity = userService.findUserByUserName(userNameParam);
        user = transformToFormBean(userEntity); //specific user to view
        populatePermissionsList(1);
        return SUCCESS;
    }
    
    public String loadChangePassword() {
        User userEntity = userService.findUserById(userIdParam);
        user = transformToFormBean(userEntity); 
        return SUCCESS;
    }
    
    public String changePassword(){
    	User userEntity = userService.findUserByUserName(user.getUserName());
    	validateChangePasswordPage(userEntity.getPassword());
        if (hasFieldErrors())
            return INPUT;
        
        userEntity.setPassword(passwordBean.getNewPassword());
        userService.updateUserPassword(userEntity);
        
        user = transformToFormBean(userEntity); 
        populatePermissionsList(-1);
        
        clearErrorsAndMessages();
        addActionMessage("Success! Password has been updated.");
    	return SUCCESS;   	    
    }
    
    public String viewUserProfile(){
        User userEntity = userService.findUserByUserName(commonUtils.getUserNameFromSession());
        user = transformToFormBean(userEntity); //specific user to view
    	return SUCCESS;
    }
    
    public String loadEditUserProfile() {
        User userEntity = userService.findUserByUserName(commonUtils.getUserNameFromSession());
        user = transformToFormBean(userEntity);
    	return SUCCESS;
    }
    
    public String editUserProfile() throws Exception {
    	if(StringUtils.isNotBlank(user.getUserId())) {
    		try {
	    		User userEntity = userService.findUserById(Integer.parseInt(user.getUserId()));
	        
		        userEntity.setFirstName(user.getFirstName());
		        userEntity.setLastName(user.getLastName());
		        userEntity.setUsername(user.getUserName());
		        userEntity.setTitle(user.getTitle());
		        userEntity.setEmail(user.getEmailAddress());
		        userEntity.setContactNo(user.getContactNumber());
		        userService.updateUser(userEntity);        
		        
		        clearErrorsAndMessages();
		        addActionMessage("Success! User Profile has been updated.");
		    	return SUCCESS;
    		} catch (UserAlreadyExistsException e) {
                addFieldError("user.userName", getText("err.username.already.exists"));
                return INPUT;
            }
    	} else {
    		clearErrorsAndMessages();
 	        addActionMessage("An error has occured during update.");
    		return INPUT;
    	}
    }

    private void addPermissionsToUser(Integer userId) {
        PermissionUserGroup permissionUserGroup;
        //remove current permissions assigned to the user
    	findCurrentUserPermissions(userId); //populates preSelectedPermissions
        for (String permissionId : preSelectedPermissions) {
            permissionUserGroup = permissionService.findPermissionUserGroup(getClientId(), getClientId(), userId, Integer.parseInt(permissionId)); //-1 represents the groupId
            if (permissionUserGroup != null) {
                permissionService.deletePermissionOfUser(permissionUserGroup);
            }
        }
        if (permissionsSelected == null) {
            System.out.print("Permission ID is NULL");
        } else {
            String permissionId = permissionsSelected.trim();
			permissionUserGroup = new PermissionUserGroup();
			permissionUserGroup.setClientId(getClientId());
			permissionUserGroup.setGroupId(getClientId());
			permissionUserGroup.setUserId(userId);
			permissionUserGroup.setPermissionId(Integer.parseInt(permissionId));
			permissionService.addPermissionToUser(permissionUserGroup);
            System.out.print("Permission applied is: " + permissionsSelected + "=" + permissionUserGroup);
        }
    }

    @Override
    public void prepare() {
        userSearchList = parameterService.getParameterMap(ParameterConstants.USER, ParameterConstants.SEARCH_CRITERIA);
        userTypeList = parameterService.getParameterMap(ParameterConstants.USER_TYPE);
        statusList = parameterService.getParameterMap(ParameterConstants.STATUS);
        customerList = customerService.findCustomerByClientId(commonUtils.getClientId());
    }

    public void validateOnSubmit(UserBean userBean) {
        clearErrorsAndMessages();
/*        if (StringUtils.isBlank(userBean.getCompanyName())) {
            addFieldError("user.companyName", getText("err.companyName.required"));
        }*/
        if (StringUtils.isBlank(userBean.getFirstName())) {
            addFieldError("user.firstName", getText("err.firstName.required"));
        }
        if (StringUtils.isBlank(userBean.getLastName())) {
            addFieldError("user.lastName", getText("err.lastName.required"));
        }
        if (StringUtils.isBlank(userBean.getUserName())) {
            addFieldError("user.userName", getText("err.userName.required"));
        }
        if (StringUtils.isBlank(userBean.getPassword())) {
            addFieldError("user.password", getText("err.password.required"));
        }
        if (StringUtils.isBlank(userBean.getReenterPassword())) {
            addFieldError("user.reenterPassword", getText("err.reenterPassword.required"));
        }
        if (StringUtils.isBlank(userBean.getEmailAddress())) {
            addFieldError("user.email", getText("err.email.required"));
        }
        if (StringUtils.isBlank(userBean.getContactNumber())) {
            addFieldError("user.contactNumber", getText("err.contactNumber.required"));
        }
        if (StringUtils.isNotBlank(userBean.getPassword()) && StringUtils.isNotBlank(userBean.getReenterPassword())) {
        	if (!userBean.getPassword().equals(userBean.getReenterPassword()))
        		addFieldError("user.password", getText("err.password.not.matched"));
        }
    }
    
    private void validateChangePasswordPage(String currentPassword) {
        if (StringUtils.isNotBlank(passwordBean.getNewPassword()) && StringUtils.isNotBlank(passwordBean.getRetypeNewPassword())) {
        	if (!passwordBean.getNewPassword().equals(passwordBean.getRetypeNewPassword()))
        		addFieldError("passwordBean.newPassword", getText("err.password.not.matched"));
        }
    	/*if (!BCrypt.checkpw(passwordBean.getCurrentPassword(), currentPassword))
    		addFieldError("passwordBean.currentPassword", getText("err.current.password.not.matched"));*/
    }

    private void populatePermissionsList(Integer userId) {
        List<Permission> permissionList = (List<Permission>) permissionService.getPermissions(getClientId());
        for (Permission permission : permissionList) {
            permissionsList.add(transformToPermissionsFormBean(permission));
        }
        //Integer userId = -1;
        if (userId.equals(-1)) {
            User user = userService.findUserByUserName(userNameParam);
            if (user!=null)
                userId = user.getUserId();
        }
        findCurrentUserPermissions(userId); //populates preSelectedPermissions
    }

	private void findCurrentUserPermissions(Integer userId) {
		List<Permission> selectedPermissionsList = (List<Permission>) permissionService.findPermissionByUser(getClientId(), userId);
        if (null != selectedPermissionsList) {
        	preSelectedPermissions = new String[selectedPermissionsList.size()];
        	preSelectedPermissionNames = new String[selectedPermissionsList.size()];
        }
		int i;
		if(isEmpty(selectedPermissionsList.size())){
			for (i = 0; i<selectedPermissionsList.size(); i++) {
					String permissionId;
					permissionId = selectedPermissionsList.get(i).getPermissionId().toString();
					preSelectedPermissions[i] = permissionId;
					String permissionName=selectedPermissionsList.get(i).getDescription();
					preSelectedPermissionNames[i] = permissionName;
			}
		}
	}
    
    //used to transform a formbean to an entity bean
    private User transformToEntityBean(UserBean formBean) {
        User entity = new User();
        Client client = clientService.findClientById(getClientId().toString());
        entity.setClient(client);
        if (StringUtils.isNotBlank(formBean.getUserId())) {
            entity.setUserId(new Integer(formBean.getUserId()));
            entity = userService.findUserById(Integer.parseInt(formBean.getUserId()));
        }

        entity.setUsername(formBean.getUserName());
        if(StringUtils.isNotBlank(formBean.getPassword()))
        	entity.setPassword(formBean.getPassword());
        
        entity.setTitle(formBean.getTitle());
        entity.setEmail(formBean.getEmailAddress());
        entity.setFirstName(formBean.getFirstName());
        entity.setLastName(formBean.getLastName());
        entity.setStatus(formBean.getStatus());
        entity.setContactNo(formBean.getContactNumber());
        entity.setUserType(formBean.getUserType());

        if ("REGULAR CUSTOMER".equals(formBean.getUserType()))
        	entity.setCustomerId(formBean.getCustomerId());
        
        return entity;
    }

    //used to transform an entity bean to a form bean
    private UserBean transformToFormBean(User entity) {
        UserBean formBean = new UserBean();
        formBean.setUserId(Long.toString(entity.getUserId()));
        formBean.setFirstName(entity.getFirstName());
        formBean.setLastName(entity.getLastName());
        formBean.setCompanyName(entity.getClient().getClientName());
        formBean.setClientId(entity.getClient().getClientId());
        formBean.setUserName(entity.getUsername());
        formBean.setPassword(entity.getPassword());
        formBean.setUserType(entity.getUserType());
        formBean.setTitle(entity.getTitle());
        formBean.setEmailAddress(entity.getEmail());
        formBean.setContactNumber(entity.getContactNo());
        formBean.setStatus(entity.getStatus());
        formBean.setCustomerId(entity.getCustomerId());
        if (entity.getCustomerId() != null) {
        	Customer customer = customerService.findCustomerById(entity.getCustomerId());
        	formBean.setCustomerName(customer.getCustomerName());
        }
        return formBean;
    }

    private PermissionBean transformToPermissionsFormBean(Permission permission) {
        PermissionBean formBean = new PermissionBean();
        formBean.setClientId(permission.getClientId().toString());
        formBean.setPermissionId(permission.getPermissionId().toString());
        formBean.setPermissionName(permission.getDescription());
        List<PermissionUserGroup> permissionUserGroups
                = permissionService.getPermissionUserGroupsByClientIdAndPermissionId(permission.getClientId(), permission.getPermissionId());

        return formBean;
    }
    
    private Integer getClientId() {
    	Map sessionAttributes = ActionContext.getContext().getSession();
        Integer clientId = (Integer) sessionAttributes.get("clientId");
        return clientId;
    }

    public Integer getUserIdParam() {
		return userIdParam;
	}

	public void setUserIdParam(Integer userIdParam) {
		this.userIdParam = userIdParam;
	}

	public String getUserNameParam() {
        return userNameParam;
    }

    public void setUserNameParam(String userNameParam) {
        this.userNameParam = userNameParam;
    }

    public List<Parameters> getStatusList() {
        return statusList;
    }

    public void setStatusList(List<Parameters> statusList) {
        this.statusList = statusList;
    }

    public List<Parameters> getUserTypeList() {
        return userTypeList;
    }

    public void setUserTypeList(List<Parameters> userTypeList) {
        this.userTypeList = userTypeList;
    }

    public List<Parameters> getUserSearchList() {
        return userSearchList;
    }

    public void setUserSearchList(List<Parameters> userSearchList) {
        this.userSearchList = userSearchList;
    }

    public List<Customer> getCustomerList() {
		return customerList;
	}

	public void setCustomerList(List<Customer> customerList) {
		this.customerList = customerList;
	}

	public UserBean getUser() {
        return user;
    }

    public void setUser(UserBean user) {
        this.user = user;
    }

    public List<UserBean> getUsers() {
        return users;
    }

    public void setUsers(List<UserBean> users) {
        this.users = users;
    }

    public String getPermissionsSelected() {
		return permissionsSelected;
	}

	public void setPermissionsSelected(String permissionsSelected) {
		this.permissionsSelected = permissionsSelected;
	}

	public String[] getPreSelectedPermissions() {
		return preSelectedPermissions;
	}

	public void setPreSelectedPermissions(
			String[] preSelectedPermissions) {
		this.preSelectedPermissions = preSelectedPermissions;
	}

	public List<PermissionBean> getPermissionsList() {
		return permissionsList;
	}

	public void setPermissionsList(List<PermissionBean> permissionsList) {
		this.permissionsList = permissionsList;
	}

	public String[] getPreSelectedPermissionNames() {
		return preSelectedPermissionNames;
	}

	public void setPreSelectedPermissionNames(String[] preSelectedPermissionNames) {
		this.preSelectedPermissionNames = preSelectedPermissionNames;
	}

	public PasswordBean getPasswordBean() {
		return passwordBean;
	}

	public void setPasswordBean(PasswordBean passwordBean) {
		this.passwordBean = passwordBean;
	}

	public PermissionService getPermissionService() {
		return permissionService;
	}

	public void setPermissionService(PermissionService permissionService) {
		this.permissionService = permissionService;
	}

	public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public void setClientService(ClientService clientService) {
        this.clientService = clientService;
    }

    public void setParameterService(ParameterService parameterService) {
        this.parameterService = parameterService;
    }

	public void setCommonUtils(CommonUtils commonUtils) {
		this.commonUtils = commonUtils;
	}

	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}

    public void setNotificationService(NotificationService notificationService) {
        this.notificationService = notificationService;
    }
}
