package com.frusi.ITAlliance.repositories;

import com.frusi.ITAlliance.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail(String email);
}
