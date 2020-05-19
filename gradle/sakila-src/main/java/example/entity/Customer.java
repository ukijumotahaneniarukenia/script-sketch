package example.entity;

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
@Entity(listener = CustomerListener.class)
@Table(name = "customer")
public class Customer {

    /**  */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "customer_id")
    Integer customerId;

    /**  */
    @Column(name = "store_id")
    Short storeId;

    /**  */
    @Column(name = "first_name")
    String firstName;

    /**  */
    @Column(name = "last_name")
    String lastName;

    /**  */
    @Column(name = "email")
    String email;

    /**  */
    @Column(name = "address_id")
    Integer addressId;

    /**  */
    @Column(name = "active")
    Boolean active;

    /**  */
    @Column(name = "create_date")
    LocalDateTime createDate;

    /**  */
    @Column(name = "last_update")
    LocalDateTime lastUpdate;

    /** 
     * Returns the customerId.
     * 
     * @return the customerId
     */
    public Integer getCustomerId() {
        return customerId;
    }

    /** 
     * Sets the customerId.
     * 
     * @param customerId the customerId
     */
    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
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
     * Returns the createDate.
     * 
     * @return the createDate
     */
    public LocalDateTime getCreateDate() {
        return createDate;
    }

    /** 
     * Sets the createDate.
     * 
     * @param createDate the createDate
     */
    public void setCreateDate(LocalDateTime createDate) {
        this.createDate = createDate;
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