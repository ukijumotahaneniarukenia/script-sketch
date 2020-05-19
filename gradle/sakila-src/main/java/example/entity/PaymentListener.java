package example.entity;

import org.seasar.doma.jdbc.entity.EntityListener;
import org.seasar.doma.jdbc.entity.PostDeleteContext;
import org.seasar.doma.jdbc.entity.PostInsertContext;
import org.seasar.doma.jdbc.entity.PostUpdateContext;
import org.seasar.doma.jdbc.entity.PreDeleteContext;
import org.seasar.doma.jdbc.entity.PreInsertContext;
import org.seasar.doma.jdbc.entity.PreUpdateContext;

/**
 * 
 */
public class PaymentListener implements EntityListener<Payment> {

    @Override
    public void preInsert(Payment entity, PreInsertContext<Payment> context) {
    }

    @Override
    public void preUpdate(Payment entity, PreUpdateContext<Payment> context) {
    }

    @Override
    public void preDelete(Payment entity, PreDeleteContext<Payment> context) {
    }

    @Override
    public void postInsert(Payment entity, PostInsertContext<Payment> context) {
    }

    @Override
    public void postUpdate(Payment entity, PostUpdateContext<Payment> context) {
    }

    @Override
    public void postDelete(Payment entity, PostDeleteContext<Payment> context) {
    }
}