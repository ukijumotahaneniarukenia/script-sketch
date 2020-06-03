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
@Entity(listener = RentalListener.class)
@Table(name = "rental")
public class Rental {

    /**  */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "rental_id")
    Integer rentalId;

    /**  */
    @Column(name = "rental_date")
    LocalDateTime rentalDate;

    /**  */
    @Column(name = "inventory_id")
    Integer inventoryId;

    /**  */
    @Column(name = "customer_id")
    Integer customerId;

    /**  */
    @Column(name = "return_date")
    LocalDateTime returnDate;

    /**  */
    @Column(name = "staff_id")
    Short staffId;

    /**  */
    @Column(name = "last_update")
    LocalDateTime lastUpdate;

    /** 
     * Returns the rentalId.
     * 
     * @return the rentalId
     */
    public Integer getRentalId() {
        return rentalId;
    }

    /** 
     * Sets the rentalId.
     * 
     * @param rentalId the rentalId
     */
    public void setRentalId(Integer rentalId) {
        this.rentalId = rentalId;
    }

    /** 
     * Returns the rentalDate.
     * 
     * @return the rentalDate
     */
    public LocalDateTime getRentalDate() {
        return rentalDate;
    }

    /** 
     * Sets the rentalDate.
     * 
     * @param rentalDate the rentalDate
     */
    public void setRentalDate(LocalDateTime rentalDate) {
        this.rentalDate = rentalDate;
    }

    /** 
     * Returns the inventoryId.
     * 
     * @return the inventoryId
     */
    public Integer getInventoryId() {
        return inventoryId;
    }

    /** 
     * Sets the inventoryId.
     * 
     * @param inventoryId the inventoryId
     */
    public void setInventoryId(Integer inventoryId) {
        this.inventoryId = inventoryId;
    }

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
     * Returns the returnDate.
     * 
     * @return the returnDate
     */
    public LocalDateTime getReturnDate() {
        return returnDate;
    }

    /** 
     * Sets the returnDate.
     * 
     * @param returnDate the returnDate
     */
    public void setReturnDate(LocalDateTime returnDate) {
        this.returnDate = returnDate;
    }

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