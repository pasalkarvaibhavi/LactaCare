
package com.lactacare.dao;

import com.lactacare.model.User;
import java.sql.SQLException;

public interface UserDAO {
    User findByEmail(String email) throws SQLException;
    void saveUser(User user) throws SQLException;
}

