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
public class AddressListener implements EntityListener<Address> {

    @Override
    public void preInsert(Address entity, PreInsertContext<Address> context) {
    }

    @Override
    public void preUpdate(Address entity, PreUpdateContext<Address> context) {
    }

    @Override
    public void preDelete(Address entity, PreDeleteContext<Address> context) {
    }

    @Override
    public void postInsert(Address entity, PostInsertContext<Address> context) {
    }

    @Override
    public void postUpdate(Address entity, PostUpdateContext<Address> context) {
    }

    @Override
    public void postDelete(Address entity, PostDeleteContext<Address> context) {
    }
}