package com.example.demo.service;

import com.example.demo.domain.Role;
import com.example.demo.domain.User;
import com.example.demo.repository.UserRepo;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;

@SpringBootTest
class UserServiceTest {

    @Autowired
    private UserService service;

    @Autowired
    private UserRepo userRepo;

    @Test
    void loadUserByUsername() {
        User wladimir = userRepo.findByUsername("Wladimir");

        Assertions.assertNotNull(wladimir);
    }


    @Test
    void addUser() {
        User user = new User();
        user.setUsername("hdfchf");
        user.setPassword("12defs314");
        user.setEmail("tupichko201@gmail.com");

        Assertions.assertTrue(service.addUser(user));

        user = (User) service.loadUserByUsername(user.getUsername());

        Assertions.assertTrue(user.isActive());
        Assertions.assertEquals(user.getRoles(), Collections.singleton(Role.USER));
        Assertions.assertNotNull(user.getActivationCode());
        Assertions.assertNotNull(user.getPassword());

        userRepo.deleteById(user.getId());
        Assertions.assertNull(userRepo.findById(user.getId()).orElse(null));
    }

    @Test
    void activateUser() {
        Assertions.assertTrue(service.activateUser("0af86188-5844-4583-9815-39757d383f16"));
    }


    @Test
    void updateNameAndRolesUser() {
        HashMap<String, String> stringStringHashMap = new HashMap<>();
        stringStringHashMap.put(Role.ADMIN.name(), "gavno");

        User userOld = (User) service.loadUserByUsername("Wladimir");
        service.updateNameAndRolesUser(userOld, "Wladimir_v1", stringStringHashMap);

        User userNew = (User) service.loadUserByUsername("Wladimir_v1");
        Assertions.assertNotNull(userNew);
        Assertions.assertEquals(new ArrayList<>(userNew.getRoles()).get(0), Role.ADMIN);

        service.updateNameAndRolesUser(userOld, "Wladimir", stringStringHashMap);
    }

    @Test
    void updateProfile() {
        User user = userRepo.findByUsername("Мираж");
        String oldPassword = user.getPassword();
        String oldActivationCode = user.getActivationCode();
        String oldEmail = user.getEmail();

        service.updateProfile(user, "sgrsgr","befvgsf@gmail.com");
        user = userRepo.findById(user.getId()).orElse(null);

        Assertions.assertNotNull(user);

        Assertions.assertNotEquals(oldPassword, user.getPassword());
        Assertions.assertNotEquals(oldActivationCode, user.getActivationCode());
        Assertions.assertNotEquals(oldEmail, user.getEmail());

        service.updateProfile(user, "egfdg3524g","fewg311@gmail.com");

    }
}