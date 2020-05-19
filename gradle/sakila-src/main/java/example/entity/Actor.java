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
@Entity(listener = ActorListener.class)
@Table(name = "actor")
public class Actor {

    /**  */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "actor_id")
    Integer actorId;

    /**  */
    @Column(name = "first_name")
    String firstName;

    /**  */
    @Column(name = "last_name")
    String lastName;

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
     * Returns the firstName.
     * 
     * @return the firstName
     */
    public String getFirstName() {
        return firstName;
    }

    /** 
     * Sets the firstName.
     * 
     * @param firstName the firstName
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /** 
     * Returns the lastName.
     * 
     * @return the lastName
     */
    public String getLastName() {
        return lastName;
    }

    /** 
     * Sets the lastName.
     * 
     * @param lastName the lastName
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
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