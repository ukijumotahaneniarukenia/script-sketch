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
public class InventoryListener implements EntityListener<Inventory> {

    @Override
    public void preInsert(Inventory entity, PreInsertContext<Inventory> context) {
    }

    @Override
    public void preUpdate(Inventory entity, PreUpdateContext<Inventory> context) {
    }

    @Override
    public void preDelete(Inventory entity, PreDeleteContext<Inventory> context) {
    }

    @Override
    public void postInsert(Inventory entity, PostInsertContext<Inventory> context) {
    }

    @Override
    public void postUpdate(Inventory entity, PostUpdateContext<Inventory> context) {
    }

    @Override
    public void postDelete(Inventory entity, PostDeleteContext<Inventory> context) {
    }
}