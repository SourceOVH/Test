package com.frusi.ITAlliance.repositories;

import com.frusi.ITAlliance.models.Status;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StatusRepository extends JpaRepository<Status, Long> {
}

