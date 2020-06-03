package example.dao;

import example.entity.Inventory;
import org.seasar.doma.Dao;
import org.seasar.doma.Delete;
import org.seasar.doma.Insert;
import org.seasar.doma.Select;
import org.seasar.doma.Update;

/**
 */
@Dao
public interface InventoryDao {

    /**
     * @param inventoryId
     * @return the Inventory entity
     */
    @Select
    Inventory selectById(Integer inventoryId);

    /**
     * @param entity
     * @return affected rows
     */
    @Insert
    int insert(Inventory entity);

    /**
     * @param entity
     * @return affected rows
     */
    @Update
    int update(Inventory entity);

    /**
     * @param entity
     * @return affected rows
     */
    @Delete
    int delete(Inventory entity);
}