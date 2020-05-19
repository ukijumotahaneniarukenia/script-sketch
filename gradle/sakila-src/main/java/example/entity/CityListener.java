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
public class CityListener implements EntityListener<City> {

    @Override
    public void preInsert(City entity, PreInsertContext<City> context) {
    }

    @Override
    public void preUpdate(City entity, PreUpdateContext<City> context) {
    }

    @Override
    public void preDelete(City entity, PreDeleteContext<City> context) {
    }

    @Override
    public void postInsert(City entity, PostInsertContext<City> context) {
    }

    @Override
    public void postUpdate(City entity, PostUpdateContext<City> context) {
    }

    @Override
    public void postDelete(City entity, PostDeleteContext<City> context) {
    }
}