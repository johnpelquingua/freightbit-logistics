package com.sr.apps.freightbit.core.action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;
import com.sr.apps.freightbit.core.formbean.GroupBean;
import com.sr.biz.freightbit.core.entity.Client;
import com.sr.biz.freightbit.core.entity.Group;
import com.sr.biz.freightbit.core.entity.GroupUser;
import com.sr.biz.freightbit.core.entity.User;
import com.sr.biz.freightbit.core.service.ClientService;
import com.sr.biz.freightbit.core.service.GroupService;
import com.sr.biz.freightbit.core.service.UserService;

/**
 * THIS CLASS BADLY NEEDS REFACTORING. PLS DO NOT USE THIS FOR REFERENCE.
 * @author junoroxas
 *
 */
public class GroupAction extends ActionSupport  {

	private List <GroupBean> groups = new ArrayList<GroupBean>();
	private List <User> users = new ArrayList<User>();
	private String groupCodeParam;
	private GroupBean groupBean = new GroupBean();
	private List <User> groupMembers = new ArrayList<User>();
	private String userNameParam;
	private ClientService clientService;
	private GroupService groupService;
	private UserService userService;


	public String viewGroups() {
    	Map sessionAttributes = ActionContext.getContext().getSession();
    	Integer clientId = (Integer) sessionAttributes.get("clientId");
    	
    	List<Group> groupEntityList = groupService.findAllGroups(clientId);
		for (Group groupElem : groupEntityList) {
			groups.add(transformToGroupFormBean(groupElem, null));
		}
        return SUCCESS;
    }
    
    public String loadAddGroupPage() {
    	Map sessionAttributes = ActionContext.getContext().getSession();
    	Integer clientId = (Integer) sessionAttributes.get("clientId");
        users = userService.findAllUsers(clientId);
        
        sessionAttributes.put("members", new ArrayList<User>());
    	return SUCCESS;
    }
	
    public String addUserToGroupForEdit() {
    	Map sessionAttributes = ActionContext.getContext().getSession();
    	this.groupMembers = (List<User>) sessionAttributes.get("members");
    	User user = userService.findUserByUserName(userNameParam);
    	groupMembers.add(user);
    	sessionAttributes.put("members", groupMembers);

    	//Keep track of groupBean values
    	groupBean.setDescription((String)sessionAttributes.get("groupDesc"));
    	groupBean.setGroupCode((String)sessionAttributes.get("groupCode"));
    	groupBean.setGroupName((String)sessionAttributes.get("groupName"));
    	groupBean.setGroupId((String)sessionAttributes.get("groupId"));
    	
    	//Keep track of user values
    	Integer clientId = (Integer) sessionAttributes.get("clientId");
    	users = userService.findAllUsers(clientId);
    	removeMembersFromAllUsersList(groupMembers);
    	return SUCCESS;
    }
    
    public String removeUserFromGroupForEdit() {
    	Map sessionAttributes = ActionContext.getContext().getSession();
    	this.groupMembers = (List<User>) sessionAttributes.get("members");
    	User user = userService.findUserByUserName(userNameParam);
		for (Iterator<User> iter = groupMembers.listIterator(); iter.hasNext(); ) {
		    User member = iter.next();
		    if (member.getUsername().equals(user.getUsername())) {
		        iter.remove();
		    }
		}
    	sessionAttributes.put("members", groupMembers);

    	//Keep track of groupBean values
    	groupBean.setDescription((String)sessionAttributes.get("groupDesc"));
    	groupBean.setGroupCode((String)sessionAttributes.get("groupCode"));
    	groupBean.setGroupName((String)sessionAttributes.get("groupName"));
    	groupBean.setGroupId((String)sessionAttributes.get("groupId"));
    	
    	//Keep track of user values
    	Integer clientId = (Integer) sessionAttributes.get("clientId");
    	users = userService.findAllUsers(clientId);
    	removeMembersFromAllUsersList(groupMembers);
    	return SUCCESS;
    }
    
    public String addUserToGroupForAdd() {
    	Map sessionAttributes = ActionContext.getContext().getSession();
    	this.groupMembers = (List<User>) sessionAttributes.get("members");
    	User user = userService.findUserByUserName(userNameParam);
    	groupMembers.add(user);
    	sessionAttributes.put("members", groupMembers);

    	//Keep track of groupBean values
    	groupBean.setDescription((String)sessionAttributes.get("groupDesc"));
    	groupBean.setGroupCode((String)sessionAttributes.get("groupCode"));
    	groupBean.setGroupName((String)sessionAttributes.get("groupName"));
    	groupBean.setGroupId((String)sessionAttributes.get("groupId"));
    	
    	//Keep track of user values
    	Integer clientId = (Integer) sessionAttributes.get("clientId");
    	users = userService.findAllUsers(clientId);
    	removeMembersFromAllUsersList(groupMembers);
    	return SUCCESS;
    }
    
    public String removeUserFromGroupForAdd() {
    	Map sessionAttributes = ActionContext.getContext().getSession();
    	this.groupMembers = (List<User>) sessionAttributes.get("members");
    	User user = userService.findUserByUserName(userNameParam);
		for (Iterator<User> iter = groupMembers.listIterator(); iter.hasNext(); ) {
		    User member = iter.next();
		    if (member.getUsername().equals(user.getUsername())) {
		        iter.remove();
		    }
		}
    	sessionAttributes.put("members", groupMembers);

    	//Keep track of groupBean values
    	groupBean.setDescription((String)sessionAttributes.get("groupDesc"));
    	groupBean.setGroupCode((String)sessionAttributes.get("groupCode"));
    	groupBean.setGroupName((String)sessionAttributes.get("groupName"));
    	groupBean.setGroupId((String)sessionAttributes.get("groupId"));
    	
    	//Keep track of user values
    	Integer clientId = (Integer) sessionAttributes.get("clientId");
    	users = userService.findAllUsers(clientId);
    	removeMembersFromAllUsersList(groupMembers);
    	return SUCCESS;
    }

	public String addGroup() {
    	Map sessionAttributes = ActionContext.getContext().getSession();
    	this.groupMembers = (List<User>) sessionAttributes.get("members");
		groupService.addGroup(transformToGroupEntityBean(groupBean), groupMembers);
		
    	Integer clientId = (Integer) sessionAttributes.get("clientId");
    	users = userService.findAllUsers(clientId);
    	removeMembersFromAllUsersList(groupMembers);
    	return SUCCESS;
    }
    
    public String loadEditGroupPage() {
    	Group groupEntity = groupService.findGroupByGroupCode(groupCodeParam);
    	List <User> groupMembers = groupService.findAllUsersByGroupId(groupEntity.getGroupId());
    	groupBean = transformToGroupFormBean(groupEntity, groupMembers); 
    	this.groupMembers = groupMembers;
    	
    	Map sessionAttributes = ActionContext.getContext().getSession();
    	Integer clientId = (Integer) sessionAttributes.get("clientId");
    	users = userService.findAllUsers(clientId);
    	removeMembersFromAllUsersList(groupMembers);
    	
        sessionAttributes.put("members", new ArrayList<User>());
    	sessionAttributes.put("members", groupMembers);
    	return SUCCESS;
    }
    
    public String editGroup() {
    	Map sessionAttributes = ActionContext.getContext().getSession();
    	this.groupMembers = (List<User>) sessionAttributes.get("members");
    	groupService.updateGroup(transformToGroupEntityBean(groupBean), groupMembers);
    	
    	Integer clientId = (Integer) sessionAttributes.get("clientId");
    	users = userService.findAllUsers(clientId);
    	removeMembersFromAllUsersList(groupMembers);
    	return SUCCESS;
    }
    
    public String deleteGroup() {
    	Group groupEntity = groupService.findGroupByGroupCode(groupCodeParam);
    	groupService.deleteGroup(groupEntity);
    	return SUCCESS;
    }
    
    
	private Group transformToGroupEntityBean(GroupBean formBean) {
		Group groupEntity = new Group();
    	Map sessionAttributes = ActionContext.getContext().getSession();
    	Integer clientId = (Integer) sessionAttributes.get("clientId");
    	
    	Client client = clientService.findClientById(clientId.toString());
    	groupEntity.setClient(client);
    	if (StringUtils.isNotBlank(formBean.getGroupId()))
    		groupEntity.setGroupId(new Integer(formBean.getGroupId()));
    	groupEntity.setName(formBean.getGroupName());
    	groupEntity.setDescription(formBean.getDescription());
    	groupEntity.setCode(formBean.getGroupCode());
    	
    	return groupEntity;
	}
	
	private void transformToGroupUserEntityBean(GroupBean formBean) {
    	Map sessionAttributes = ActionContext.getContext().getSession();
    	String clientId = (String) sessionAttributes.get("clientId");
    	
    	for (User user : formBean.getMembers()) {
    		GroupUser groupUserEntity = new GroupUser();
    		if (clientId != null)
    			groupUserEntity.setClientId(new Integer(clientId));
    		if (formBean.getGroupId() != null)
    			groupUserEntity.setGroupId(new Integer(formBean.getGroupId()));
    		if (user.getUserId() != null)
    			groupUserEntity.setUserId(new Integer(user.getUserId()));	
    	}
	}
	
	private GroupBean transformToGroupFormBean(Group groupEntity, List <User> usersEntity) {
		GroupBean groupBean = new GroupBean();
		if (groupEntity != null) {
			groupBean.setDescription(groupEntity.getDescription());
			groupBean.setGroupCode(groupEntity.getCode());
			groupBean.setGroupName(groupEntity.getName());
			groupBean.setMembersNum(groupService.getNoOfMembers(groupEntity.getGroupId()));
			groupBean.setGroupId(groupEntity.getGroupId().toString());
		}
		if (usersEntity != null) {
			groupBean.setMembers(usersEntity);
		}
		return groupBean;
	}

	/**
	 * In the jsp, the users who are already members of the group should no longer appear
	 * under the Users List
	 */
	private void removeMembersFromAllUsersList(List <User> groupMembers){
		for (User groupMember : groupMembers) {
			for (Iterator<User> iter = users.listIterator(); iter.hasNext(); ) {
			    User user = iter.next();
			    if (groupMember.getUsername().equals(user.getUsername())) {
			        iter.remove();
			    }
			}
		}
	}
	
	public List<User> getGroupMembers() {
		return groupMembers;
	}

	public void setGroupMembers(List<User> groupMembers) {
		this.groupMembers = groupMembers;
	}

	public GroupBean getGroupBean() {
		return groupBean;
	}

	public void setGroupBean(GroupBean groupBean) {
		this.groupBean = groupBean;
	}
	
    public List<GroupBean> getGroups() {
		return groups;
	}

	public void setGroups(List<GroupBean> groups) {
		this.groups = groups;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	
	public String getGroupCodeParam() {
		return groupCodeParam;
	}

	public void setGroupCodeParam(String groupCodeParam) {
		this.groupCodeParam = groupCodeParam;
	}
	
    public String getUserNameParam() {
		return userNameParam;
	}

	public void setUserNameParam(String userNameParam) {
		this.userNameParam = userNameParam;
	}

	
	public void setClientService(ClientService clientService) {
		this.clientService = clientService;
	}


	public void setGroupService(GroupService groupService) {
		this.groupService = groupService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	
}
