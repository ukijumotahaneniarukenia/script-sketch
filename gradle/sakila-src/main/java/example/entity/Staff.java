package example.entity;

import java.sql.Blob;
import java.time.LocalDateTime;
import org.seasar.doma.Column;
import org.seasar.doma.Entity;
import org.seasar.doma.GeneratedValue;
import org.seasar.doma.GenerationType;
import org.seasar.doma.Id;
import org.seasar.doma.Table;

/**
 * 
 */
@Entity(listener = StaffListener.class)
@Table(name = "staff")
public class Staff {

    /**  */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "staff_id")
    Short staffId;

    /**  */
    @Column(name = "first_name")
    String firstName;

    /**  */
    @Column(name = "last_name")
    String lastName;

    /**  */
    @Column(name = "address_id")
    Integer addressId;

    /**  */
    @Column(name = "picture")
    Blob picture;

    /**  */
    @Column(name = "email")
    String email;

    /**  */
    @Column(name = "store_id")
    Short storeId;

    /**  */
    @Column(name = "active")
    Boolean active;

    /**  */
    @Column(name = "username")
    String username;

    /**  */
    @Column(name = "password")
    String password;

    /**  */
    @Column(name = "last_update")
    LocalDateTime lastUpdate;

    /** 
     * Returns the staffId.
     * 
     * @return the staffId
     */
    public Short getStaffId() {
        return staffId;
    }

    /** 
     * Sets the staffId.
     * 
     * @param staffId the staffId
     */
    public void setStaffId(Short staffId) {
        this.staffId = staffId;
    }

    /** 
     * Returns the firstName.
     * 
     * @return the firstName
     */
    public String getFirstName() {
        return firstName;
    }

    /** 
     * Sets the firstName.
     * 
     * @param firstName the firstName
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /** 
     * Returns the lastName.
     * 
     * @return the lastName
     */
    public String getLastName() {
        return lastName;
    }

    /** 
     * Sets the lastName.
     * 
     * @param lastName the lastName
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    /** 
     * Returns the addressId.
     * 
     * @return the addressId
     */
    public Integer getAddressId() {
        return addressId;
    }

    /** 
     * Sets the addressId.
     * 
     * @param addressId the addressId
     */
    public void setAddressId(Integer addressId) {
        this.addressId = addressId;
    }

    /** 
     * Returns the picture.
     * 
     * @return the picture
     */
    public Blob getPicture() {
        return picture;
    }

    /** 
     * Sets the picture.
     * 
     * @param picture the picture
     */
    public void setPicture(Blob picture) {
        this.picture = picture;
    }

    /** 
     * Returns the email.
     * 
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /** 
     * Sets the email.
     * 
     * @param email the email
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /** 
     * Returns the storeId.
     * 
     * @return the storeId
     */
    public Short getStoreId() {
        return storeId;
    }

    /** 
     * Sets the storeId.
     * 
     * @param storeId the storeId
     */
    public void setStoreId(Short storeId) {
        this.storeId = storeId;
    }

    /** 
     * Returns the active.
     * 
     * @return the active
     */
    public Boolean getActive() {
        return active;
    }

    /** 
     * Sets the active.
     * 
     * @param active the active
     */
    public void setActive(Boolean active) {
        this.active = active;
    }

    /** 
     * Returns the username.
     * 
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /** 
     * Sets the username.
     * 
     * @param username the username
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /** 
     * Returns the password.
     * 
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /** 
     * Sets the password.
     * 
     * @param password the password
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /** 
     * Returns the lastUpdate.
     * 
     * @return the lastUpdate
     */
    public LocalDateTime getLastUpdate() {
        return lastUpdate;
    }

    /** 
     * Sets the lastUpdate.
     * 
     * @param lastUpdate the lastUpdate
     */
    public void setLastUpdate(LocalDateTime lastUpdate) {
        this.lastUpdate = lastUpdate;
    }
}