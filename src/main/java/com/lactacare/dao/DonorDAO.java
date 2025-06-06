
package com.lactacare.dao;
import com.lactacare.model.Donor;
import java.sql.SQLException;

public interface DonorDAO {
    void saveDonor(Donor donor) throws SQLException;
    Donor getDonorByUserId(int userId) throws SQLException;
}

