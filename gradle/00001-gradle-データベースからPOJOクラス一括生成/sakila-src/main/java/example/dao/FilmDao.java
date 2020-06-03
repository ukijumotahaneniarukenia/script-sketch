package example.dao;

import example.entity.Film;
import org.seasar.doma.Dao;
import org.seasar.doma.Delete;
import org.seasar.doma.Insert;
import org.seasar.doma.Select;
import org.seasar.doma.Update;

/**
 */
@Dao
public interface FilmDao {

    /**
     * @param filmId
     * @return the Film entity
     */
    @Select
    Film selectById(Integer filmId);

    /**
     * @param entity
     * @return affected rows
     */
    @Insert
    int insert(Film entity);

    /**
     * @param entity
     * @return affected rows
     */
    @Update
    int update(Film entity);

    /**
     * @param entity
     * @return affected rows
     */
    @Delete
    int delete(Film entity);
}