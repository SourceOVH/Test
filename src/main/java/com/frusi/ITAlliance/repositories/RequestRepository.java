package com.frusi.ITAlliance.repositories;

import com.frusi.ITAlliance.models.Request;
import com.frusi.ITAlliance.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RequestRepository extends JpaRepository<Request, Long> {
    List<Request> findByUserAndTitle(User user, String title);
    List<Request> findByUser(User user);
}

