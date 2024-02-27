package com.frusi.ITAlliance.controllers;

import com.frusi.ITAlliance.models.Request;
import com.frusi.ITAlliance.services.RequestService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class RequestController {
    private final RequestService productService;

    @GetMapping("/")
    public String requests(@RequestParam(name = "title", required = false) String title, Model model, Principal principal) {
        model.addAttribute("requests", productService.listRequest(principal, title));
        return "request";
    }


    @GetMapping("/request/{id}")
    public String requestInfo(@PathVariable Long id, Model model) {
        Request request = productService.getRequestById(id);
        model.addAttribute("request", request);
        return "request-info";
    }

    @PostMapping("/request/create")
    public String createRequest(Principal principal, Request product) {
        productService.saveRequest(principal, product);
        return "redirect:/";
    }

    @PostMapping("/request/delete/{id}")
    public String deleteRequest(@PathVariable Long id) {
        productService.deleteRequest(id);
        return "redirect:/";
    }
    @PostMapping("/admin/request/delete/{id}")
    public String adminDeleteRequest(@PathVariable Long id) {
        productService.deleteRequest(id);
        return "redirect:/admin";
    }
}
