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
public class RentalListener implements EntityListener<Rental> {

    @Override
    public void preInsert(Rental entity, PreInsertContext<Rental> context) {
    }

    @Override
    public void preUpdate(Rental entity, PreUpdateContext<Rental> context) {
    }

    @Override
    public void preDelete(Rental entity, PreDeleteContext<Rental> context) {
    }

    @Override
    public void postInsert(Rental entity, PostInsertContext<Rental> context) {
    }

    @Override
    public void postUpdate(Rental entity, PostUpdateContext<Rental> context) {
    }

    @Override
    public void postDelete(Rental entity, PostDeleteContext<Rental> context) {
    }
}