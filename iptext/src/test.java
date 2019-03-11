import com.mysql.jdbc.Driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class test {
    public static void main(String[] args) throws Exception {
        // 1. 加载驱动程序
        new Driver();
        // 2. 连接数据库
        Connection connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306?useSSL=false", "root", "mysql");

        String sql = "select address from ip_pool.pool where ";
        PreparedStatement prest = connection.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE,
        ResultSet.CONCUR_READ_ONLY);
        connection.setAutoCommit(false);








    }
}







