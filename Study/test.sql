    create table user(
        user_id varchar(45),
        user_pw varchar(45),
        name varchar(45),
        phone varchar(45),
        grade varchar(45),
        age int
    );

    public void updateUser(UserDTO userDTO) {
    try {
        Class.forName(dbDriver);
        conn = DriverManager.getConnection(dbUrl, dbID, dbPW);

        String updateSQL = "update user set user_pw=?, name=?, phone=?, grade=?, age=? where user_id=?";

        pt = conn.prepareStatement(updateSQL);

        pt.setString(1, userDTO.getUser_pw());
        pt.setString(2, userDTO.getName());
        pt.setString(3, userDTO.getPhone());
        pt.setString(4, userDTO.getGrade());
        pt.setInt(5, userDTO.getAge());
        pt.setString(6, userDTO.getUser_id());

        pt.executeUpdate();

        pt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
}

public void deleteUser(String userId) {
    try {
        Class.forName(dbDriver);
        conn = DriverManager.getConnection(dbUrl, dbID, dbPW);

        String deleteSQL = "delete from user where user_id=?";

        pt = conn.prepareStatement(deleteSQL);
        pt.setString(1, userId);

        pt.executeUpdate();

        pt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
}