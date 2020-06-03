package example.dao;

import example.entity.Address;
import org.seasar.doma.Dao;
import org.seasar.doma.Delete;
import org.seasar.doma.Insert;
import org.seasar.doma.Select;
import org.seasar.doma.Update;

/**
 */
@Dao
public interface AddressDao {

    /**
     * @param addressId
     * @return the Address entity
     */
    @Select
    Address selectById(Integer addressId);

    /**
     * @param entity
     * @return affected rows
     */
    @Insert
    int insert(Address entity);

    /**
     * @param entity
     * @return affected rows
     */
    @Update
    int update(Address entity);

    /**
     * @param entity
     * @return affected rows
     */
    @Delete
    int delete(Address entity);
}