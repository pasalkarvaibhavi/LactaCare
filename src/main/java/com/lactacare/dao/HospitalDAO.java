package com.lactacare.dao;

import com.lactacare.model.Hospital;
import java.sql.SQLException;

public interface HospitalDAO {
    void saveHospital(Hospital hospital) throws SQLException;
    Hospital getHospitalByUserId(int userId) throws SQLException;
}