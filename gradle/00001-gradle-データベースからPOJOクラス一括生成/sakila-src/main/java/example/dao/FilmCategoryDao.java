package example.dao;

import example.entity.FilmCategory;
import org.seasar.doma.Dao;
import org.seasar.doma.Delete;
import org.seasar.doma.Insert;
import org.seasar.doma.Select;
import org.seasar.doma.Update;

/**
 */
@Dao
public interface FilmCategoryDao {

    /**
     * @param filmId
     * @param categoryId
     * @return the FilmCategory entity
     */
    @Select
    FilmCategory selectById(Integer filmId, Short categoryId);

    /**
     * @param entity
     * @return affected rows
     */
    @Insert
    int insert(FilmCategory entity);

    /**
     * @param entity
     * @return affected rows
     */
    @Update
    int update(FilmCategory entity);

    /**
     * @param entity
     * @return affected rows
     */
    @Delete
    int delete(FilmCategory entity);
}