package example.dao;

import example.entity.Payment;
import org.seasar.doma.Dao;
import org.seasar.doma.Delete;
import org.seasar.doma.Insert;
import org.seasar.doma.Select;
import org.seasar.doma.Update;

/**
 */
@Dao
public interface PaymentDao {

    /**
     * @param paymentId
     * @return the Payment entity
     */
    @Select
    Payment selectById(Integer paymentId);

    /**
     * @param entity
     * @return affected rows
     */
    @Insert
    int insert(Payment entity);

    /**
     * @param entity
     * @return affected rows
     */
    @Update
    int update(Payment entity);

    /**
     * @param entity
     * @return affected rows
     */
    @Delete
    int delete(Payment entity);
}