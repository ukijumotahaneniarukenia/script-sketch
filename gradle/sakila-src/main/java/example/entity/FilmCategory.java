package example.entity;

import java.time.LocalDateTime;
import org.seasar.doma.Column;
import org.seasar.doma.Entity;
import org.seasar.doma.Id;
import org.seasar.doma.Table;

/**
 * 
 */
@Entity(listener = FilmCategoryListener.class)
@Table(name = "film_category")
public class FilmCategory {

    /**  */
    @Id
    @Column(name = "film_id")
    Integer filmId;

    /**  */
    @Id
    @Column(name = "category_id")
    Short categoryId;

    /**  */
    @Column(name = "last_update")
    LocalDateTime lastUpdate;

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
     * Returns the categoryId.
     * 
     * @return the categoryId
     */
    public Short getCategoryId() {
        return categoryId;
    }

    /** 
     * Sets the categoryId.
     * 
     * @param categoryId the categoryId
     */
    public void setCategoryId(Short categoryId) {
        this.categoryId = categoryId;
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