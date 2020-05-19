package example.dao;

import example.entity.Customer;
import org.seasar.doma.Dao;
import org.seasar.doma.Delete;
import org.seasar.doma.Insert;
import org.seasar.doma.Select;
import org.seasar.doma.Update;

/**
 */
@Dao
public interface CustomerDao {

    /**
     * @param customerId
     * @return the Customer entity
     */
    @Select
    Customer selectById(Integer customerId);

    /**
     * @param entity
     * @return affected rows
     */
    @Insert
    int insert(Customer entity);

    /**
     * @param entity
     * @return affected rows
     */
    @Update
    int update(Customer entity);

    /**
     * @param entity
     * @return affected rows
     */
    @Delete
    int delete(Customer entity);
}