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
public class StoreListener implements EntityListener<Store> {

    @Override
    public void preInsert(Store entity, PreInsertContext<Store> context) {
    }

    @Override
    public void preUpdate(Store entity, PreUpdateContext<Store> context) {
    }

    @Override
    public void preDelete(Store entity, PreDeleteContext<Store> context) {
    }

    @Override
    public void postInsert(Store entity, PostInsertContext<Store> context) {
    }

    @Override
    public void postUpdate(Store entity, PostUpdateContext<Store> context) {
    }

    @Override
    public void postDelete(Store entity, PostDeleteContext<Store> context) {
    }
}