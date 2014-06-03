package com.sr.biz.freightbit.core.dao;

import java.util.List;

import com.sr.biz.freightbit.core.entity.Group;
import com.sr.biz.freightbit.core.entity.GroupUser;
import com.sr.biz.freightbit.core.entity.User;

public interface GroupUserDao {

	public void addGroupUser(GroupUser groupUser);
	
	public void updateGroupUser(GroupUser groupUser);

	public void deleteGroupUser(GroupUser groupUser);
	
	public List<GroupUser> findAllUsersByGroupId(Integer groupId);
	
	public List<GroupUser> findAllGroupsByUserId(Integer userId);
}
