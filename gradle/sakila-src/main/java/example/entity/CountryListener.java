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
public class CountryListener implements EntityListener<Country> {

    @Override
    public void preInsert(Country entity, PreInsertContext<Country> context) {
    }

    @Override
    public void preUpdate(Country entity, PreUpdateContext<Country> context) {
    }

    @Override
    public void preDelete(Country entity, PreDeleteContext<Country> context) {
    }

    @Override
    public void postInsert(Country entity, PostInsertContext<Country> context) {
    }

    @Override
    public void postUpdate(Country entity, PostUpdateContext<Country> context) {
    }

    @Override
    public void postDelete(Country entity, PostDeleteContext<Country> context) {
    }
}