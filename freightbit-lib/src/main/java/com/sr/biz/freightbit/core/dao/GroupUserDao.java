package com.sr.biz.freightbit.core.dao;

import com.sr.biz.freightbit.core.entity.GroupUser;

import java.util.List;

public interface GroupUserDao {

    public void addGroupUser(GroupUser groupUser);

    public void updateGroupUser(GroupUser groupUser);

    public void deleteGroupUser(GroupUser groupUser);

    public List<GroupUser> findAllUsersByGroupId(Integer groupId);

    public List<GroupUser> findAllGroupsByUserId(Integer userId);
}
