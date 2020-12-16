/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstoreUtils;
import java.sql.*;
import org.apache.derby.jdbc.*;

public class Item {
    private String ISBN, title, price, coverpic;
    private int quantity;
    
    public Item(String isbn) throws Exception{
        String dbURI = "jdbc:derby://localhost:1527/bookstore";
        DriverManager.registerDriver(new ClientDriver());
        Connection con = DriverManager.getConnection(dbURI);
        Statement stmt = con.createStatement();
        String sql = "select ISBN, Title, Price, Coverpic from Books where ISBN = '" + isbn + "'";
        ResultSet rs = stmt.executeQuery(sql);
        rs.next();
        this.ISBN = isbn;
        this.title = rs.getString("Title");
        this.price = rs.getString("Price");
        this.coverpic = rs.getString("Coverpic");
        this.quantity = 1;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    public String getCoverpic(){
        return coverpic;
    }

    public String getISBN() {
        return ISBN;
    }

    public String getTitle() {
        return title;
    }

    public String getPrice() {
        return price;
    }

    public int getQuantity() {
        return quantity;
    }
}
