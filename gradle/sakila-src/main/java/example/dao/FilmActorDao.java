package example.dao;

import example.entity.FilmActor;
import org.seasar.doma.Dao;
import org.seasar.doma.Delete;
import org.seasar.doma.Insert;
import org.seasar.doma.Select;
import org.seasar.doma.Update;

/**
 */
@Dao
public interface FilmActorDao {

    /**
     * @param actorId
     * @param filmId
     * @return the FilmActor entity
     */
    @Select
    FilmActor selectById(Integer actorId, Integer filmId);

    /**
     * @param entity
     * @return affected rows
     */
    @Insert
    int insert(FilmActor entity);

    /**
     * @param entity
     * @return affected rows
     */
    @Update
    int update(FilmActor entity);

    /**
     * @param entity
     * @return affected rows
     */
    @Delete
    int delete(FilmActor entity);
}