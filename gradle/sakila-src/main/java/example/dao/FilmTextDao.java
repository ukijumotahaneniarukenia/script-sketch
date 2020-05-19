package example.dao;

import example.entity.FilmText;
import org.seasar.doma.Dao;
import org.seasar.doma.Delete;
import org.seasar.doma.Insert;
import org.seasar.doma.Select;
import org.seasar.doma.Update;

/**
 */
@Dao
public interface FilmTextDao {

    /**
     * @param filmId
     * @return the FilmText entity
     */
    @Select
    FilmText selectById(Short filmId);

    /**
     * @param entity
     * @return affected rows
     */
    @Insert
    int insert(FilmText entity);

    /**
     * @param entity
     * @return affected rows
     */
    @Update
    int update(FilmText entity);

    /**
     * @param entity
     * @return affected rows
     */
    @Delete
    int delete(FilmText entity);
}