package com.frusi.ITAlliance.controllers;

import com.frusi.ITAlliance.enums.Role;
import com.frusi.ITAlliance.models.Request;
import com.frusi.ITAlliance.models.Status;
import com.frusi.ITAlliance.models.User;
import com.frusi.ITAlliance.services.CustomUserDetailsService;
import com.frusi.ITAlliance.services.RequestService;
import com.frusi.ITAlliance.services.StatusService;
import com.frusi.ITAlliance.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@PreAuthorize("hasAuthority('ROLE_ADMIN')")
public class AdminController {
    private final CustomUserDetailsService customUserDetailsService;
    private final UserService userService;
    private final RequestService requestService;
    private final StatusService statusService;

    @GetMapping("/admin")
    public String admin(Model model) {
        List<Request> requests = requestService.getAllRequests();
        model.addAttribute("users", userService.list());
        model.addAttribute("requests", requests);
        return "admin";
    }


    @PostMapping("/admin/user/ban/{id}")
    public String userBan(@PathVariable("id") Long id) {
        userService.banUser(id);
        return "redirect:/admin";
    }

    @GetMapping("/admin/user/edit/{user}")
    public String userEdit(@PathVariable("user") User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "user-edit";
    }

    @PostMapping("/admin/user/edit")
    public String userEdit(@RequestParam("userId") User user, @RequestParam Map<String, String> form) {
        userService.changeUserRoles(user, form);
        return "redirect:/admin";
    }
    @PostMapping("/admin/request/updateStatus/{requestId}")
    public String updateRequestStatus(@PathVariable("requestId") Long requestId,
                                      @RequestParam("statusId") Long statusId,
                                      Principal principal) {
        Request request = requestService.getRequestById(requestId);
        Status status = statusService.getStatusById(statusId);

        request.setStatus(status);
        requestService.saveRequest(principal, request);
        return "redirect:/admin";
    }

    @PostMapping("/user/delete/{userId}")
    public String deleteUser(@PathVariable("userId") Long userId) {
        userService.deleteUser(userId);
        return "redirect:/admin";
    }





}
