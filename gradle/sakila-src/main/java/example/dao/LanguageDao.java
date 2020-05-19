package example.dao;

import example.entity.Language;
import org.seasar.doma.Dao;
import org.seasar.doma.Delete;
import org.seasar.doma.Insert;
import org.seasar.doma.Select;
import org.seasar.doma.Update;

/**
 */
@Dao
public interface LanguageDao {

    /**
     * @param languageId
     * @return the Language entity
     */
    @Select
    Language selectById(Short languageId);

    /**
     * @param entity
     * @return affected rows
     */
    @Insert
    int insert(Language entity);

    /**
     * @param entity
     * @return affected rows
     */
    @Update
    int update(Language entity);

    /**
     * @param entity
     * @return affected rows
     */
    @Delete
    int delete(Language entity);
}