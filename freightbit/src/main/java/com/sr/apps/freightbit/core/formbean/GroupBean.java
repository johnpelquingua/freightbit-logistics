package com.sr.apps.freightbit.core.formbean;

import java.util.List;

import com.sr.biz.freightbit.core.entity.User;

public class GroupBean {
	private String groupCode;
	private String groupName;
	private String description;
	private List <User> members;
	private String groupId;
	private Integer membersNum;
	
	public Integer getMembersNum() {
		return membersNum;
	}
	public void setMembersNum(Integer membersNum) {
		this.membersNum = membersNum;
	}
	public String getGroupId() {
		return groupId;
	}
	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}
	public String getGroupCode() {
		return groupCode;
	}
	public void setGroupCode(String groupCode) {
		this.groupCode = groupCode;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public List<User> getMembers() {
		return members;
	}
	public void setMembers(List<User> members) {
		this.members = members;
	}
	

}
