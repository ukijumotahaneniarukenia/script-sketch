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
@Entity(listener = InventoryListener.class)
@Table(name = "inventory")
public class Inventory {

    /**  */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "inventory_id")
    Integer inventoryId;

    /**  */
    @Column(name = "film_id")
    Integer filmId;

    /**  */
    @Column(name = "store_id")
    Short storeId;

    /**  */
    @Column(name = "last_update")
    LocalDateTime lastUpdate;

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
     * Returns the filmId.
     * 
     * @return the filmId
     */
    public Integer getFilmId() {
        return filmId;
    }

    /** 
     * Sets the filmId.
     * 
     * @param filmId the filmId
     */
    public void setFilmId(Integer filmId) {
        this.filmId = filmId;
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