package example.dao;

import example.entity.Country;
import org.seasar.doma.Dao;
import org.seasar.doma.Delete;
import org.seasar.doma.Insert;
import org.seasar.doma.Select;
import org.seasar.doma.Update;

/**
 */
@Dao
public interface CountryDao {

    /**
     * @param countryId
     * @return the Country entity
     */
    @Select
    Country selectById(Integer countryId);

    /**
     * @param entity
     * @return affected rows
     */
    @Insert
    int insert(Country entity);

    /**
     * @param entity
     * @return affected rows
     */
    @Update
    int update(Country entity);

    /**
     * @param entity
     * @return affected rows
     */
    @Delete
    int delete(Country entity);
}