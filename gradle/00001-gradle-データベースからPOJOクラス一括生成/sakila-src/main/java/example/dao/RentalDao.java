package example.dao;

import example.entity.Rental;
import org.seasar.doma.Dao;
import org.seasar.doma.Delete;
import org.seasar.doma.Insert;
import org.seasar.doma.Select;
import org.seasar.doma.Update;

/**
 */
@Dao
public interface RentalDao {

    /**
     * @param rentalId
     * @return the Rental entity
     */
    @Select
    Rental selectById(Integer rentalId);

    /**
     * @param entity
     * @return affected rows
     */
    @Insert
    int insert(Rental entity);

    /**
     * @param entity
     * @return affected rows
     */
    @Update
    int update(Rental entity);

    /**
     * @param entity
     * @return affected rows
     */
    @Delete
    int delete(Rental entity);
}