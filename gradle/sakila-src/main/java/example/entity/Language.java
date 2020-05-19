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
@Entity(listener = LanguageListener.class)
@Table(name = "language")
public class Language {

    /**  */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "language_id")
    Short languageId;

    /**  */
    @Column(name = "name")
    String name;

    /**  */
    @Column(name = "last_update")
    LocalDateTime lastUpdate;

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
     * Returns the name.
     * 
     * @return the name
     */
    public String getName() {
        return name;
    }

    /** 
     * Sets the name.
     * 
     * @param name the name
     */
    public void setName(String name) {
        this.name = name;
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