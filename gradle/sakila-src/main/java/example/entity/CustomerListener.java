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
public class CustomerListener implements EntityListener<Customer> {

    @Override
    public void preInsert(Customer entity, PreInsertContext<Customer> context) {
    }

    @Override
    public void preUpdate(Customer entity, PreUpdateContext<Customer> context) {
    }

    @Override
    public void preDelete(Customer entity, PreDeleteContext<Customer> context) {
    }

    @Override
    public void postInsert(Customer entity, PostInsertContext<Customer> context) {
    }

    @Override
    public void postUpdate(Customer entity, PostUpdateContext<Customer> context) {
    }

    @Override
    public void postDelete(Customer entity, PostDeleteContext<Customer> context) {
    }
}