package com.sr.biz.freightbit.core.service;

import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sr.biz.freightbit.core.entity.Group;
import com.sr.biz.freightbit.core.entity.GroupUser;
import com.sr.biz.freightbit.core.entity.User;
import com.sr.biz.freightbit.core.exceptions.GroupAlreadyExistsException;

public interface GroupService {

	public void addGroup(Group group, List <User> users) throws GroupAlreadyExistsException;

	public void updateGroup(Group group, List <User> users);

	public void deleteGroup(Group group);

	public List<Group> findAllGroups(Integer groupId);
	
	public Group findGroupByGroupId(Integer groupId);
	
	public Group findGroupByGroupCode(String groupCode);
	
	public Group findGroupByGroupName(String groupName, Integer clientId);
	
    public void addUser(Group group, User user);

    public void removeUser(Group group, User user);

    public boolean isMember(User user);
    
	public void addUser(Integer userId, Integer groupId, Integer clientId);
	
	public void deleteUser(GroupUser groupUser);

	public List<User> findAllUsersByGroupId(Integer groupId);
	
	public List<GroupUser> findAllGroupsByUserId(Integer userId);
	
	public Integer getNoOfMembers(Integer groupId);
}
