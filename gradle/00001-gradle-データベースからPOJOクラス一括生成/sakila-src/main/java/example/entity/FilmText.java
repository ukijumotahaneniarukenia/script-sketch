package example.entity;

import org.seasar.doma.Column;
import org.seasar.doma.Entity;
import org.seasar.doma.Id;
import org.seasar.doma.Table;

/**
 * 
 */
@Entity(listener = FilmTextListener.class)
@Table(name = "film_text")
public class FilmText {

    /**  */
    @Id
    @Column(name = "film_id")
    Short filmId;

    /**  */
    @Column(name = "title")
    String title;

    /**  */
    @Column(name = "description")
    String description;

    /** 
     * Returns the filmId.
     * 
     * @return the filmId
     */
    public Short getFilmId() {
        return filmId;
    }

    /** 
     * Sets the filmId.
     * 
     * @param filmId the filmId
     */
    public void setFilmId(Short filmId) {
        this.filmId = filmId;
    }

    /** 
     * Returns the title.
     * 
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /** 
     * Sets the title.
     * 
     * @param title the title
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /** 
     * Returns the description.
     * 
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /** 
     * Sets the description.
     * 
     * @param description the description
     */
    public void setDescription(String description) {
        this.description = description;
    }
}