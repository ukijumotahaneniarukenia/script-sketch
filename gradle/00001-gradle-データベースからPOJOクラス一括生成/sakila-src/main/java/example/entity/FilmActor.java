package example.entity;

import java.time.LocalDateTime;
import org.seasar.doma.Column;
import org.seasar.doma.Entity;
import org.seasar.doma.Id;
import org.seasar.doma.Table;

/**
 * 
 */
@Entity(listener = FilmActorListener.class)
@Table(name = "film_actor")
public class FilmActor {

    /**  */
    @Id
    @Column(name = "actor_id")
    Integer actorId;

    /**  */
    @Id
    @Column(name = "film_id")
    Integer filmId;

    /**  */
    @Column(name = "last_update")
    LocalDateTime lastUpdate;

    /** 
     * Returns the actorId.
     * 
     * @return the actorId
     */
    public Integer getActorId() {
        return actorId;
    }

    /** 
     * Sets the actorId.
     * 
     * @param actorId the actorId
     */
    public void setActorId(Integer actorId) {
        this.actorId = actorId;
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