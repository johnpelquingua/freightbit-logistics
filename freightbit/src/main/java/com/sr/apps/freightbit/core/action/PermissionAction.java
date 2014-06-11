package com.sr.apps.freightbit.core.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sr.apps.freightbit.core.formbean.PermissionBean;
import com.sr.biz.freightbit.common.service.ParameterService;
import com.sr.biz.freightbit.core.entity.Group;
import com.sr.biz.freightbit.core.entity.Permission;
import com.sr.biz.freightbit.core.entity.PermissionUserGroup;
import com.sr.biz.freightbit.core.entity.User;
import com.sr.biz.freightbit.core.service.ClientService;
import com.sr.biz.freightbit.core.service.GroupService;
import com.sr.biz.freightbit.core.service.PermissionService;
import com.sr.biz.freightbit.core.service.UserService;

/**
 * Created by ADMIN on 5/28/2014.
 */
public class PermissionAction extends ActionSupport {

    private List<PermissionBean> permissions;
    private List<PermissionBean> selectedPermissions;
    private PermissionService permissionService;
    private ClientService clientService;
    private ParameterService parameterService;
    private GroupService groupService;
    private UserService userService;
    private List<User> userList = new ArrayList<User>(); //User drop down values
    private List<Group> groupList = new ArrayList<Group>(); //Group drop down values
    private Integer selectedGroupId;
    private Integer selectedUserId;

    public String viewPermissions() {
        List<Permission> permissionList = (List<Permission>) permissionService.getPermissions(getClientId());
        setPermissions(new ArrayList<PermissionBean>());
        for (Permission permission : permissionList) {
            getPermissions().add(transformToFormBean(permission));
        }
        return SUCCESS;
    }

    public String editPermissions() {
        List<Permission> permissionList = (List<Permission>) permissionService.getPermissions(getClientId());
        setPermissions(new ArrayList<PermissionBean>());
        for (Permission permission : permissionList) {
            getPermissions().add(transformToFormBean(permission));
        }
        populateGroupDropdown();
        if (getSelectedGroupId() == null) {
            setSelectedGroupId(2); // Default is Admin
            populateUserDropdown();
            setSelectedUserId(getUserId());
        }
        setUserList(groupService.findAllUsersByGroupId(getSelectedGroupId()));
        return SUCCESS;
    }

    private PermissionBean transformToFormBean(Permission permission) {
        PermissionBean formBean = new PermissionBean();
        formBean.setClientId(permission.getClientId().toString());
        formBean.setPermissionId(permission.getPermissionId().toString());
        formBean.setPermissionName(permission.getDescription());
        List<PermissionUserGroup> permissionUserGroups
                = permissionService.getPermissionUserGroupsByClientIdAndPermissionId(permission.getClientId(), permission.getPermissionId());
        StringBuilder userGroups = new StringBuilder("");
        for (PermissionUserGroup permissionUserGroup : permissionUserGroups) {
            User user = null;
            if (permissionUserGroup.getUserId() != null) {
                user = userService.findUserById(permissionUserGroup.getUserId());
                if (userGroups.length() == 0) {
                    userGroups.append(user.getUsername());
                } else {
                    userGroups.append(", ").append(user.getUsername());
                }
            }
            if (permissionUserGroup.getGroupId() != null) {
                Group group = groupService.findGroupByGroupId(permissionUserGroup.getGroupId());
                if (userGroups.length() == 0) {
                    userGroups.append(group.getName());
                } else if (user != null) {
                    userGroups.append("/").append(group.getName());
                } else {
                    userGroups.append(", ").append(group.getName());
                }
            }
        }
        if (userGroups.length() > 0) {
            formBean.setUserGroups(userGroups.toString());
            formBean.setIsSelected(true);
        } else {
            formBean.setIsSelected(false);
        }

        return formBean;
    }

    private Integer getClientId() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Integer clientId = (Integer) sessionAttributes.get("clientId");
        return clientId;
    }

    private Integer getUserId() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Integer userId = (Integer) sessionAttributes.get("userId");
        return userId;
    }

    /**
     * @param permissionService the permissionService to set
     */
    public void setPermissionService(PermissionService permissionService) {
        this.permissionService = permissionService;
    }

    /**
     * @param clientService the clientService to set
     */
    public void setClientService(ClientService clientService) {
        this.clientService = clientService;
    }

    /**
     * @param parameterService the parameterService to set
     */
    public void setParameterService(ParameterService parameterService) {
        this.parameterService = parameterService;
    }

    /**
     * @return the permissions
     */
    public List<PermissionBean> getPermissions() {
        return permissions;
    }

    /**
     * @param permissions the permissions to set
     */
    public void setPermissions(List<PermissionBean> permissions) {
        this.permissions = permissions;
    }

    /**
     * @param groupService the groupService to set
     */
    public void setGroupService(GroupService groupService) {
        this.groupService = groupService;
    }

    /**
     * @param userService the userService to set
     */
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public void populateGroupDropdown() {
        groupList = groupService.findAllGroups(getClientId());
    }

    public void populateUserDropdown() {
        List<Permission> permissionList = (List<Permission>) permissionService.getPermissions(getClientId());
        setPermissions(new ArrayList<PermissionBean>());
        for (Permission permission : permissionList) {
            getPermissions().add(transformToFormBean(permission));
        }
        populateGroupDropdown();
        if (getSelectedGroupId() != null) {
            setUserList(groupService.findAllUsersByGroupId(getSelectedGroupId()));
        }
    }

    /**
     * @return the userList
     */
    public List<User> getUserList() {
        return userList;
    }

    /**
     * @param userList the userList to set
     */
    public void setUserList(List<User> userList) {
        this.userList = userList;
    }

    /**
     * @return the groupList
     */
    public List<Group> getGroupList() {
        return groupList;
    }

    /**
     * @param groupList the groupList to set
     */
    public void setGroupList(List<Group> groupList) {
        this.groupList = groupList;
    }

    /**
     * @return the selectedGroupId
     */
    public Integer getSelectedGroupId() {
        return selectedGroupId;
    }

    /**
     * @param selectedGroupId the selectedGroupId to set
     */
    public void setSelectedGroupId(Integer selectedGroupId) {
        this.selectedGroupId = selectedGroupId;
    }

    /**
     * @return the selectedUserId
     */
    public Integer getSelectedUserId() {
        return selectedUserId;
    }

    /**
     * @param selectedUserId the selectedUserId to set
     */
    public void setSelectedUserId(Integer selectedUserId) {
        this.selectedUserId = selectedUserId;
    }
}
