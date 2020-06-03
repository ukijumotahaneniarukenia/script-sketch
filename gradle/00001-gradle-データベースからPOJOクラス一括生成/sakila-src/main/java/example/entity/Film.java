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
@Entity(listener = FilmListener.class)
@Table(name = "film")
public class Film {

    /**  */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "film_id")
    Integer filmId;

    /**  */
    @Column(name = "title")
    String title;

    /**  */
    @Column(name = "description")
    String description;

    /**  */
    @Column(name = "release_year")
    Short releaseYear;

    /**  */
    @Column(name = "language_id")
    Short languageId;

    /**  */
    @Column(name = "original_language_id")
    Short originalLanguageId;

    /**  */
    @Column(name = "rental_duration")
    Short rentalDuration;

    /**  */
    @Column(name = "rental_rate")
    BigDecimal rentalRate;

    /**  */
    @Column(name = "length")
    Integer length;

    /**  */
    @Column(name = "replacement_cost")
    BigDecimal replacementCost;

    /**  */
    @Column(name = "rating")
    String rating;

    /**  */
    @Column(name = "special_features")
    String specialFeatures;

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

    /** 
     * Returns the releaseYear.
     * 
     * @return the releaseYear
     */
    public Short getReleaseYear() {
        return releaseYear;
    }

    /** 
     * Sets the releaseYear.
     * 
     * @param releaseYear the releaseYear
     */
    public void setReleaseYear(Short releaseYear) {
        this.releaseYear = releaseYear;
    }

    /** 
     * Returns the languageId.
     * 
     * @return the languageId
     */
    public Short getLanguageId() {
        return languageId;
    }

    /** 
     * Sets the languageId.
     * 
     * @param languageId the languageId
     */
    public void setLanguageId(Short languageId) {
        this.languageId = languageId;
    }

    /** 
     * Returns the originalLanguageId.
     * 
     * @return the originalLanguageId
     */
    public Short getOriginalLanguageId() {
        return originalLanguageId;
    }

    /** 
     * Sets the originalLanguageId.
     * 
     * @param originalLanguageId the originalLanguageId
     */
    public void setOriginalLanguageId(Short originalLanguageId) {
        this.originalLanguageId = originalLanguageId;
    }

    /** 
     * Returns the rentalDuration.
     * 
     * @return the rentalDuration
     */
    public Short getRentalDuration() {
        return rentalDuration;
    }

    /** 
     * Sets the rentalDuration.
     * 
     * @param rentalDuration the rentalDuration
     */
    public void setRentalDuration(Short rentalDuration) {
        this.rentalDuration = rentalDuration;
    }

    /** 
     * Returns the rentalRate.
     * 
     * @return the rentalRate
     */
    public BigDecimal getRentalRate() {
        return rentalRate;
    }

    /** 
     * Sets the rentalRate.
     * 
     * @param rentalRate the rentalRate
     */
    public void setRentalRate(BigDecimal rentalRate) {
        this.rentalRate = rentalRate;
    }

    /** 
     * Returns the length.
     * 
     * @return the length
     */
    public Integer getLength() {
        return length;
    }

    /** 
     * Sets the length.
     * 
     * @param length the length
     */
    public void setLength(Integer length) {
        this.length = length;
    }

    /** 
     * Returns the replacementCost.
     * 
     * @return the replacementCost
     */
    public BigDecimal getReplacementCost() {
        return replacementCost;
    }

    /** 
     * Sets the replacementCost.
     * 
     * @param replacementCost the replacementCost
     */
    public void setReplacementCost(BigDecimal replacementCost) {
        this.replacementCost = replacementCost;
    }

    /** 
     * Returns the rating.
     * 
     * @return the rating
     */
    public String getRating() {
        return rating;
    }

    /** 
     * Sets the rating.
     * 
     * @param rating the rating
     */
    public void setRating(String rating) {
        this.rating = rating;
    }

    /** 
     * Returns the specialFeatures.
     * 
     * @return the specialFeatures
     */
    public String getSpecialFeatures() {
        return specialFeatures;
    }

    /** 
     * Sets the specialFeatures.
     * 
     * @param specialFeatures the specialFeatures
     */
    public void setSpecialFeatures(String specialFeatures) {
        this.specialFeatures = specialFeatures;
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