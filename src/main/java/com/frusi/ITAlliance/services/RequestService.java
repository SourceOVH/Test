package com.frusi.ITAlliance.services;

import com.frusi.ITAlliance.models.Request;
import com.frusi.ITAlliance.models.Status;
import com.frusi.ITAlliance.models.User;
import com.frusi.ITAlliance.repositories.RequestRepository;
import com.frusi.ITAlliance.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class RequestService {
    private final RequestRepository requestRepository;
    private final UserRepository userRepository;
    public List<Request> listRequest(Principal principal, String title) {
        User user = getUserByPrincipal(principal);
        if (title != null) {
            return requestRepository.findByUserAndTitle(user, title);
        }
        return requestRepository.findByUser(user);
    }


    public void saveRequest(Principal principal, Request request) {
        User user = getUserByPrincipal(principal);
        request.setUser(user);
        requestRepository.save(request);
    }
    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }
    public void deleteRequest(Long id) {
        requestRepository.deleteById(id);
    }

    public Request getRequestById(Long id) {
        return requestRepository.findById(id).orElse(null);
    }
    public List<Request> getAllRequests() {
        return requestRepository.findAll();
    }


}

