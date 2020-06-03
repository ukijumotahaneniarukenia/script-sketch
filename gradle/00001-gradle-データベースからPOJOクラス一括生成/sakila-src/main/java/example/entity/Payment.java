package example.entity;

import java.math.BigDecimal;
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
@Entity(listener = PaymentListener.class)
@Table(name = "payment")
public class Payment {

    /**  */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "payment_id")
    Integer paymentId;

    /**  */
    @Column(name = "customer_id")
    Integer customerId;

    /**  */
    @Column(name = "staff_id")
    Short staffId;

    /**  */
    @Column(name = "rental_id")
    Integer rentalId;

    /**  */
    @Column(name = "amount")
    BigDecimal amount;

    /**  */
    @Column(name = "payment_date")
    LocalDateTime paymentDate;

    /**  */
    @Column(name = "last_update")
    LocalDateTime lastUpdate;

    /** 
     * Returns the paymentId.
     * 
     * @return the paymentId
     */
    public Integer getPaymentId() {
        return paymentId;
    }

    /** 
     * Sets the paymentId.
     * 
     * @param paymentId the paymentId
     */
    public void setPaymentId(Integer paymentId) {
        this.paymentId = paymentId;
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
     * Returns the amount.
     * 
     * @return the amount
     */
    public BigDecimal getAmount() {
        return amount;
    }

    /** 
     * Sets the amount.
     * 
     * @param amount the amount
     */
    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    /** 
     * Returns the paymentDate.
     * 
     * @return the paymentDate
     */
    public LocalDateTime getPaymentDate() {
        return paymentDate;
    }

    /** 
     * Sets the paymentDate.
     * 
     * @param paymentDate the paymentDate
     */
    public void setPaymentDate(LocalDateTime paymentDate) {
        this.paymentDate = paymentDate;
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