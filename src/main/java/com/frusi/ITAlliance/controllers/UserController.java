package com.frusi.ITAlliance.controllers;

import com.frusi.ITAlliance.models.User;
import com.frusi.ITAlliance.services.RequestService;
import com.frusi.ITAlliance.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.naming.AuthenticationException;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;
    private final RequestService requestService;

    @GetMapping("/login")
    public String login(Principal principal, Model model) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "login";
    }

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }


    @PostMapping("/registration")
    public String createUser(User user, Model model) {
        try {
            if (!userService.createUser(user)) {
                throw new Exception("Пользователь уже с email: " + user.getEmail() + " уже существует!");
            }
            return "redirect:/login";
        } catch (Exception e) {
            model.addAttribute("errorMessage", e.getMessage());
            return "registration";
        }
    }
    @GetMapping("/user/{user}")
    public String userInfo(@PathVariable("user") User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("requests", requestService.getAllRequests());
        return "user-info";
    }





    //Exception
    @ExceptionHandler(Exception.class)
    public String handleException(Exception e, Model model) {
        model.addAttribute("errorMessage", "Произошла ошибка: " + e.getMessage());
        return "your-template"; // Замените на имя вашего шаблона
    }
}
