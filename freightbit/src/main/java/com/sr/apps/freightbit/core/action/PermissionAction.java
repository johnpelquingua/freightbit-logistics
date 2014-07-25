package com.sr.apps.freightbit.core.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sr.apps.freightbit.core.formbean.PermissionBean;
import com.sr.biz.freightbit.core.entity.Group;
import com.sr.biz.freightbit.core.entity.Permission;
import com.sr.biz.freightbit.core.entity.PermissionUserGroup;
import com.sr.biz.freightbit.core.entity.User;
import com.sr.biz.freightbit.core.service.GroupService;
import com.sr.biz.freightbit.core.service.PermissionService;
import com.sr.biz.freightbit.core.service.UserService;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * Created by ADMIN on 5/28/2014.
 */
public class PermissionAction extends ActionSupport {

    private List<PermissionBean> permissions = new ArrayList<PermissionBean>();
    private List<PermissionBean> selectedPermissions = new ArrayList<PermissionBean>();
    private PermissionService permissionService;
    private GroupService groupService;
    private UserService userService;
    private List<User> userList = new ArrayList<User>(); //User drop down values
    private List<Group> groupList = new ArrayList<Group>(); //Group drop down values
    private Integer selectedGroupId;
    private Integer selectedUserId;
    private String selectedIds;
    private String removedIds;
    private String userChanged;

    Map sessionAttributes = ActionContext.getContext().getSession();
    HttpServletRequest request = ServletActionContext.getRequest();

    public String viewPermissions() {
        List<Permission> permissionList = (List<Permission>) permissionService.getPermissions(getClientId());
        permissions = new ArrayList<PermissionBean>();
        for (Permission permission : permissionList) {
            permissions.add(transformToFormBean(permission));
        }

        return SUCCESS;
    }

    public String loadEditPermissions() {
        populateGroupDropdown();

        if (sessionAttributes.get("selectedGroupIdAfterSave") != null  //Satisfied means, action invocation came from editPermissions()
                && sessionAttributes.get("selectedUserIdAfterSave") != null) {
            selectedGroupId = (Integer) sessionAttributes.get("selectedGroupIdAfterSave");
            selectedUserId = (Integer) sessionAttributes.get("selectedUserIdAfterSave");
            userChanged = "true";
            clearErrorsAndMessages();
            addActionMessage("Success! Permissions have been updated.");
        } else if (selectedGroupId == null) {
            selectedGroupId = groupService.findGroupByGroupName("Admin", getClientId()).getGroupId(); // Default is Admin
            selectedUserId = getUserId();
        }

        userList = groupService.findAllUsersByGroupId(selectedGroupId);
        if (userList != null && userList.size() > 0 && !"true".equals(userChanged))
            selectedUserId = userList.get(0).getUserId();

        populatePermissionsList();

        sessionAttributes.remove("selectedGroupIdAfterSave");
        sessionAttributes.remove("selectedUserIdAfterSave");
        sessionAttributes.put("selectedPermissionIds", new ArrayList<String>());
        sessionAttributes.put("removedPermissionIds", new ArrayList<String>());

        return SUCCESS;
    }


    public String addSelectedPermissions() {
        populatePermissionsList();

        //Get checked permissions and remove them from All Permissions
        if (selectedIds != null && !"".equals(selectedIds)) {
            String[] selArr = selectedIds.split(",");
            for (int i = 0; i < selArr.length; i++) {
                Permission permissionEntity = permissionService.findPermissionById(Integer.parseInt(selArr[i]));
                selectedPermissions.add(transformToFormBean(permissionEntity));
            }
            List<String> selectedPermissionIds = (List<String>) sessionAttributes.get("selectedPermissionIds");
            selectedPermissionIds.addAll(Arrays.asList(selArr));
            sessionAttributes.put("selectedPermissionIds", selectedPermissionIds);
            removeSelectedIdFromPermissionsList(selectedPermissionIds, permissions);

            //Remove removed permissions from the removedPermissionIds in session
            List<String> removedPermissionIds = (List<String>) sessionAttributes.get("removedPermissionIds");
            removedPermissionIds = removeIdsFromList(removedPermissionIds, Arrays.asList(selArr));
            sessionAttributes.put("removedPermissionIds", removedPermissionIds);
        }

        populateGroupDropdown();
        setUserList(groupService.findAllUsersByGroupId(getSelectedGroupId()));
        userList = groupService.findAllUsersByGroupId(getSelectedGroupId());

        clearErrorsAndMessages();
        return SUCCESS;
    }

    public String removeSelectedPermissions() {
        populatePermissionsList();

        //Get checked permissions and remove them from All Permissions
        if (removedIds != null) {
            String[] selArr = removedIds.split(",");
            List<PermissionBean> permissionBeanToRemove = new ArrayList<PermissionBean>();
            for (int i = 0; i < selArr.length; i++) {
                Permission permissionEntity = permissionService.findPermissionById(Integer.parseInt(selArr[i]));
                permissionBeanToRemove.add(transformToFormBean(permissionEntity));
            }
            permissions.addAll(permissionBeanToRemove);
            removeSelectedPermissionFromPermissionsList(permissionBeanToRemove, selectedPermissions);

            //Remove selected permissions from the selectedPermissionIds in session
            List<String> selectedPermissionIds = (List<String>) sessionAttributes.get("selectedPermissionIds");
            selectedPermissionIds = removeIdsFromList(selectedPermissionIds, Arrays.asList(selArr));
            sessionAttributes.put("selectedPermissionIds", selectedPermissionIds);

            //Add removed permissions from the removedPermissionIds in session
            List<String> removedPermissionIds = (List<String>) sessionAttributes.get("removedPermissionIds");
            removedPermissionIds.addAll(Arrays.asList(selArr));
            sessionAttributes.put("removedPermissionIds", removedPermissionIds);
        }

        populateGroupDropdown();
        setUserList(groupService.findAllUsersByGroupId(getSelectedGroupId()));
        userList = groupService.findAllUsersByGroupId(getSelectedGroupId());

        clearErrorsAndMessages();
        return SUCCESS;
    }

    public String editPermission() {
        List<String> selectedPermissionIds = (List<String>) sessionAttributes.get("selectedPermissionIds");
        PermissionUserGroup permissionUserGroup;
        for (String selectedPermissionId : selectedPermissionIds) {
            permissionUserGroup = new PermissionUserGroup();
            permissionUserGroup.setClientId(getClientId());
            permissionUserGroup.setGroupId(selectedGroupId);
            permissionUserGroup.setUserId(selectedUserId);
            permissionUserGroup.setPermissionId(Integer.parseInt(selectedPermissionId));
            permissionService.addPermissionToUser(permissionUserGroup);
        }
        List<String> removedPermissionIds = (List<String>) sessionAttributes.get("removedPermissionIds");
        for (String removedPermissionId : removedPermissionIds) {
            permissionUserGroup = permissionService.findPermissionUserGroup(getClientId(), selectedGroupId, selectedUserId, Integer.parseInt(removedPermissionId));
            if (permissionUserGroup != null) {
                permissionService.deletePermissionOfUser(permissionUserGroup);
            }
        }
        sessionAttributes.put("selectedGroupIdAfterSave", selectedGroupId);
        sessionAttributes.put("selectedUserIdAfterSave", selectedUserId);
        return SUCCESS;
    }

    private void populatePermissionsList() {
        List<Permission> permissionList = (List<Permission>) permissionService.getPermissions(getClientId());
        for (Permission permission : permissionList) {
            permissions.add(transformToFormBean(permission));
        }
        List<Permission> selectedPermissionsList = (List<Permission>) permissionService.findPermissionByGroupAndUser(getClientId(), selectedGroupId, selectedUserId);
        for (Permission selectedPermissionElem : selectedPermissionsList) {
            selectedPermissions.add(transformToFormBean(selectedPermissionElem));
        }
        removeSelectedPermissionFromPermissionsList(selectedPermissions, permissions);
    }

    private List<String> removeIdsFromList(List<String> selectedPermissionIds, List<String> newlySelectedPermissionIds) {
        for (String newlySelectedPermissionId : newlySelectedPermissionIds) {
            for (Iterator<String> iter = selectedPermissionIds.listIterator(); iter.hasNext(); ) {
                String selectedPermissionId = iter.next();
                if (selectedPermissionId.equals(newlySelectedPermissionId)) {
                    iter.remove();
                }
            }
        }
        return selectedPermissionIds;
    }

    private void removeSelectedIdFromPermissionsList(List<String> selectedPermissionIds, List<PermissionBean> allPermissions) {
        for (String selectedPermissionId : selectedPermissionIds) {
            for (Iterator<PermissionBean> iter = allPermissions.listIterator(); iter.hasNext(); ) {
                PermissionBean permission = iter.next();
                if (permission.getPermissionId().equals(selectedPermissionId)) {
                    iter.remove();
                }
            }
        }
    }

    private void removeSelectedPermissionFromPermissionsList(List<PermissionBean> selectedPermissions, List<PermissionBean> allPermissions) {
        for (PermissionBean selectedPermission : selectedPermissions) {
            for (Iterator<PermissionBean> iter = allPermissions.listIterator(); iter.hasNext(); ) {
                PermissionBean permission = iter.next();
                if (permission.getPermissionId().equals(selectedPermission.getPermissionId())) {
                    iter.remove();
                }
            }
        }
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
        Integer clientId = (Integer) sessionAttributes.get("clientId");
        return clientId;
    }

    private Integer getUserId() {
        User user = (User) sessionAttributes.get("user");
        return user.getUserId();
    }

    /**
     * @param permissionService the permissionService to set
     */
    public void setPermissionService(PermissionService permissionService) {
        this.permissionService = permissionService;
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
/*        List<Permission> permissionList = (List<Permission>) permissionService.getPermissions(getClientId());
        setPermissions(new ArrayList<PermissionBean>());
        for (Permission permission : permissionList) {
            getPermissions().add(transformToFormBean(permission));
        }*/
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

    /**
     * @return the selectedPermissions
     */
    public List<PermissionBean> getSelectedPermissions() {
        return selectedPermissions;
    }

    /**
     * @param selectedPermissions the selectedPermissions to set
     */
    public void setSelectedPermissions(List<PermissionBean> selectedPermissions) {
        this.selectedPermissions = selectedPermissions;
    }

    /**
     * @return the selectedIds
     */
    public String getSelectedIds() {
        return selectedIds;
    }

    /**
     * @param selectedIds the selectedIds to set
     */
    public void setSelectedIds(String selectedIds) {
        this.selectedIds = selectedIds;
    }

    public String getRemovedIds() {
        return removedIds;
    }

    public void setRemovedIds(String removedIds) {
        this.removedIds = removedIds;
    }


    public String getUserChanged() {
        return userChanged;
    }

    public void setUserChanged(String userChanged) {
        this.userChanged = userChanged;
    }

}
