package example.dao;

import example.entity.Store;
import org.seasar.doma.Dao;
import org.seasar.doma.Delete;
import org.seasar.doma.Insert;
import org.seasar.doma.Select;
import org.seasar.doma.Update;

/**
 */
@Dao
public interface StoreDao {

    /**
     * @param storeId
     * @return the Store entity
     */
    @Select
    Store selectById(Short storeId);

    /**
     * @param entity
     * @return affected rows
     */
    @Insert
    int insert(Store entity);

    /**
     * @param entity
     * @return affected rows
     */
    @Update
    int update(Store entity);

    /**
     * @param entity
     * @return affected rows
     */
    @Delete
    int delete(Store entity);
}