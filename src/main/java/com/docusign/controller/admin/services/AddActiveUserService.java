package com.docusign.controller.admin.services;

import com.docusign.admin.api.UsersApi;
import com.docusign.admin.model.*;

import java.util.ArrayList;
import java.util.UUID;

public  class AddActiveUserService {

    public static NewUserResponse createNewActiveUser(
            String groupId,
            String profileId,
            String email,
            String userName,
            String firstName,
            String lastName,
            UsersApi usersApi,
            UUID organizationId,
            UUID accountId) throws Exception
    {
        java.util.List<GroupRequest> groups = new ArrayList<>();
        groups.add(new GroupRequest().id(Long.valueOf(groupId)));

        // Fill the request with data from the form
        NewUserRequest accountUserRequest = new NewUserRequest()
                .defaultAccountId(accountId)
                .addAccountsItem(
                        new NewUserRequestAccountProperties()
                                .id(accountId)
                                .permissionProfile(
                                        new PermissionProfileRequest()
                                                .id(Long.valueOf(profileId))
                                )
                                .groups(groups)
                )
                .email(email)
                .userName(userName)
                .firstName(firstName)
                .lastName(lastName)
                .autoActivateMemberships(true);
        // Step 5 end

        // Step 6 start
        return usersApi.createUser(organizationId, accountUserRequest);
        // Step 6 end
    }
}
