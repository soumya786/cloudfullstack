package com.soumya.cloudfullstack.repo;

import com.soumya.cloudfullstack.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepo extends JpaRepository<User, Long> {

}
