package com.frusi.ITAlliance.services;

import com.frusi.ITAlliance.models.Status;
import com.frusi.ITAlliance.repositories.StatusRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StatusService {
    private final StatusRepository statusRepository;

    @Autowired
    public StatusService(StatusRepository statusRepository) {
        this.statusRepository = statusRepository;
    }

    public Status getStatusById(Long id) {
        return statusRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid status id: " + id));
    }
}

