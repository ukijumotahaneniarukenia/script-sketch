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
@Entity(listener = StoreListener.class)
@Table(name = "store")
public class Store {

    /**  */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "store_id")
    Short storeId;

    /**  */
    @Column(name = "manager_staff_id")
    Short managerStaffId;

    /**  */
    @Column(name = "address_id")
    Integer addressId;

    /**  */
    @Column(name = "last_update")
    LocalDateTime lastUpdate;

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
     * Returns the managerStaffId.
     * 
     * @return the managerStaffId
     */
    public Short getManagerStaffId() {
        return managerStaffId;
    }

    /** 
     * Sets the managerStaffId.
     * 
     * @param managerStaffId the managerStaffId
     */
    public void setManagerStaffId(Short managerStaffId) {
        this.managerStaffId = managerStaffId;
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