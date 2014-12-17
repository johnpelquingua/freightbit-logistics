package com.sr.biz.freightbit.core.service.impl;

import com.sr.biz.freightbit.core.dao.PermissionDao;
import com.sr.biz.freightbit.core.dao.UserDao;
import com.sr.biz.freightbit.core.entity.Permission;
import com.sr.biz.freightbit.core.entity.PermissionUserGroup;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserDetailsServiceImpl implements UserDetailsService {
	
    private UserDao userDao;
    private PermissionDao permissionDao;

    public void setPermissionDao(PermissionDao permissionDao) {
		this.permissionDao = permissionDao;
	}

	public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @SuppressWarnings("deprecation")
    @Override
    public UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException, DataAccessException
    {
        com.sr.biz.freightbit.core.entity.User user = userDao.findUserByUserName(username);
        if (user != null) {
        	List<GrantedAuthority> authList = new ArrayList<GrantedAuthority>();
        	List <String> permissionNames = findPermissionByUser(user.getClient().getClientId(), user.getUserId());
        	for (String permissionName : permissionNames) {
        		authList.add(new GrantedAuthorityImpl(permissionName));
        		System.out.println("Permissions: [" + permissionName +"]\n");
        	}
	        UserDetails userDetails = new org.springframework.security.core.userdetails.User(username, user.getPassword(), true, true, true, true, authList);
	        return userDetails;
        }
        return null;
    }
    
    public List<String> findPermissionByUser(Integer clientId, Integer userId) {
        List <String> permissionNames = new ArrayList<String>();
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("clientId", clientId);
        paramMap.put("userId", userId);
        List<PermissionUserGroup> permissionUserGroupList = permissionDao.findPermissionUserGroups(paramMap, "PermissionUserGroup");
        for (PermissionUserGroup permissionUserGroup : permissionUserGroupList) {
            Permission permission = permissionDao.getPermissionById(permissionUserGroup.getPermissionId());
            permissionNames.add(permission.getName());
        }
        return permissionNames;
    }
}
