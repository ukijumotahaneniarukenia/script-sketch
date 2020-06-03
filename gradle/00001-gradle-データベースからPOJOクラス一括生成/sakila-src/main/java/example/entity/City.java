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
@Entity(listener = CityListener.class)
@Table(name = "city")
public class City {

    /**  */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "city_id")
    Integer cityId;

    /**  */
    @Column(name = "city")
    String city;

    /**  */
    @Column(name = "country_id")
    Integer countryId;

    /**  */
    @Column(name = "last_update")
    LocalDateTime lastUpdate;

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
     * Returns the city.
     * 
     * @return the city
     */
    public String getCity() {
        return city;
    }

    /** 
     * Sets the city.
     * 
     * @param city the city
     */
    public void setCity(String city) {
        this.city = city;
    }

    /** 
     * Returns the countryId.
     * 
     * @return the countryId
     */
    public Integer getCountryId() {
        return countryId;
    }

    /** 
     * Sets the countryId.
     * 
     * @param countryId the countryId
     */
    public void setCountryId(Integer countryId) {
        this.countryId = countryId;
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