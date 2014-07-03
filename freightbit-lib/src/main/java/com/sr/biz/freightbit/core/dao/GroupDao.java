package com.sr.biz.freightbit.core.dao;

import com.sr.biz.freightbit.core.entity.Group;

import java.util.List;

public interface GroupDao {

    public void updateGroup(Group group);

    public void addGroup(Group group);

    public void deleteGroup(Group group);

    public Group findByGroupId(Integer id);

    public List<Group> findGroupByExample(Group instance);

    public List<Group> findAllGroups(Integer groupId);

    public Group findGroupByGroupCode(String groupCode);

    public Group findGroupByGroupName(String groupName, Integer clientId);

}