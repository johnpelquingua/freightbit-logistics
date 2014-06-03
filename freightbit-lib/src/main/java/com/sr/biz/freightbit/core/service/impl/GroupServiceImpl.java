package com.sr.biz.freightbit.core.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sr.biz.freightbit.core.dao.GroupDao;
import com.sr.biz.freightbit.core.dao.GroupUserDao;
import com.sr.biz.freightbit.core.dao.UserDao;
import com.sr.biz.freightbit.core.entity.Group;
import com.sr.biz.freightbit.core.entity.GroupUser;
import com.sr.biz.freightbit.core.entity.User;
import com.sr.biz.freightbit.core.exceptions.GroupAlreadyExistsException;
import com.sr.biz.freightbit.core.service.GroupService;

/**
 * 
 * @author junoroxas
 *
 */
public class GroupServiceImpl implements GroupService {
	
	GroupDao groupDao;
	GroupUserDao groupUserDao;
	UserDao userDao;

	public void setGroupUserDao(GroupUserDao groupUserDao) {
		this.groupUserDao = groupUserDao;
	}

	public void setGroupDao(GroupDao groupDao) {
		this.groupDao = groupDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	@Override
	public void addGroup(Group group, List<User> users) throws GroupAlreadyExistsException {
		groupDao.addGroup(group);
		
		//add newly assigned members
		for (User user : users) {
			GroupUser groupUser = new GroupUser();
			groupUser.setClientId(group.getClient().getClientId());
			groupUser.setGroupId(group.getGroupId());
			groupUser.setUserId(user.getUserId());
			groupUserDao.addGroupUser(groupUser);
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	@Override
	public void updateGroup(Group group, List <User> users) {
		groupDao.updateGroup(group);
		
		//delete currently assigned members
		List <GroupUser> groupUsers = groupUserDao.findAllUsersByGroupId(group.getGroupId());
		for (GroupUser groupUser : groupUsers) {
			groupUserDao.deleteGroupUser(groupUser);
		} 
		
		//add newly assigned members
		for (User user : users) {
			GroupUser groupUser = new GroupUser();
			groupUser.setClientId(group.getClient().getClientId());
			groupUser.setGroupId(group.getGroupId());
			groupUser.setUserId(user.getUserId());
			groupUserDao.addGroupUser(groupUser);
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	@Override
	public void deleteGroup(Group group) {
		
		//remove all entries under GroupUser table
	    List<GroupUser> groupUsers = groupUserDao.findAllUsersByGroupId(group.getGroupId());
	    for (int i=0; i < groupUsers.size(); i++) {
	        GroupUser groupUser = (GroupUser) groupUsers.get(i);
	        groupUserDao.deleteGroupUser(groupUser);
	    }
	    
	    //permissionDao.deletePermissions(group);
	    groupDao.deleteGroup(group);
	}

	@Override
	public List<Group> findAllGroups(Integer clientId) {
		return groupDao.findAllGroups(clientId);
	}

	@Override
	public Group findGroupByGroupId(Integer groupId) {
		return groupDao.findByGroupId(groupId);
	}
	
	@Override
	public Group findGroupByGroupCode(String groupCode) {
		return groupDao.findGroupByGroupCode(groupCode);
	}

	@Override
	public Group findGroupByGroupName(String groupName) {
		return null;
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	@Override
	public void addUser(Group group, User user) {
		// TODO Auto-generated method stub
		
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	@Override
	public void removeUser(Group group, User user) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void addUser(Integer userId, Integer groupId, Integer clientId) {
		GroupUser groupUser = new GroupUser();
		groupUser.setUserId(userId);
		groupUser.setGroupId(groupId);
		groupUser.setClientId(clientId);
		//groupUserDao.addGroupUser(groupUser);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void deleteUser(GroupUser groupUser) {
		//groupUserDao.deleteGroupUser(groupUser);
	}

	

	@Override
	public List<User> findAllUsersByGroupId(Integer groupId) {
		List <GroupUser> groupUsers = groupUserDao.findAllUsersByGroupId(groupId);
		List <User> users = new ArrayList();
		for (GroupUser groupUser : groupUsers) {
			users.add(userDao.findUserById(groupUser.getUserId()));
		}
		return users;
	}

	@Override
	public List<GroupUser> findAllGroupsByUserId(Integer userId) {
		//return groupUserDao.findAllGroupsByUserId(userId);
		return null;
	}


	@Override
	public boolean isMember(User user) {
		// TODO Auto-generated method stub
		return false;
	}
	
	@Override
	public Integer getNoOfMembers(Integer groupId) {
		List <GroupUser> groupUsers = groupUserDao.findAllUsersByGroupId(groupId);
		return groupUsers.size();
	}

}
