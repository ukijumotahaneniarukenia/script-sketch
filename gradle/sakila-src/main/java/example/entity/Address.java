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
@Entity(listener = AddressListener.class)
@Table(name = "address")
public class Address {

    /**  */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "address_id")
    Integer addressId;

    /**  */
    @Column(name = "address")
    String address;

    /**  */
    @Column(name = "address2")
    String address2;

    /**  */
    @Column(name = "district")
    String district;

    /**  */
    @Column(name = "city_id")
    Integer cityId;

    /**  */
    @Column(name = "postal_code")
    String postalCode;

    /**  */
    @Column(name = "phone")
    String phone;

    /**  */
    @Column(name = "location")
    byte[] location;

    /**  */
    @Column(name = "last_update")
    LocalDateTime lastUpdate;

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
     * Returns the address.
     * 
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /** 
     * Sets the address.
     * 
     * @param address the address
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /** 
     * Returns the address2.
     * 
     * @return the address2
     */
    public String getAddress2() {
        return address2;
    }

    /** 
     * Sets the address2.
     * 
     * @param address2 the address2
     */
    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    /** 
     * Returns the district.
     * 
     * @return the district
     */
    public String getDistrict() {
        return district;
    }

    /** 
     * Sets the district.
     * 
     * @param district the district
     */
    public void setDistrict(String district) {
        this.district = district;
    }

    /** 
     * Returns the cityId.
     * 
     * @return the cityId
     */
    public Integer getCityId() {
        return cityId;
    }

    /** 
     * Sets the cityId.
     * 
     * @param cityId the cityId
     */
    public void setCityId(Integer cityId) {
        this.cityId = cityId;
    }

    /** 
     * Returns the postalCode.
     * 
     * @return the postalCode
     */
    public String getPostalCode() {
        return postalCode;
    }

    /** 
     * Sets the postalCode.
     * 
     * @param postalCode the postalCode
     */
    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    /** 
     * Returns the phone.
     * 
     * @return the phone
     */
    public String getPhone() {
        return phone;
    }

    /** 
     * Sets the phone.
     * 
     * @param phone the phone
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /** 
     * Returns the location.
     * 
     * @return the location
     */
    public byte[] getLocation() {
        return location;
    }

    /** 
     * Sets the location.
     * 
     * @param location the location
     */
    public void setLocation(byte[] location) {
        this.location = location;
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