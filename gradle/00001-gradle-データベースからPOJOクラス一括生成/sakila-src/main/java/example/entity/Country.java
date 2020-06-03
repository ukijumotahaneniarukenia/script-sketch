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
@Entity(listener = CountryListener.class)
@Table(name = "country")
public class Country {

    /**  */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "country_id")
    Integer countryId;

    /**  */
    @Column(name = "country")
    String country;

    /**  */
    @Column(name = "last_update")
    LocalDateTime lastUpdate;

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
     * Returns the country.
     * 
     * @return the country
     */
    public String getCountry() {
        return country;
    }

    /** 
     * Sets the country.
     * 
     * @param country the country
     */
    public void setCountry(String country) {
        this.country = country;
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