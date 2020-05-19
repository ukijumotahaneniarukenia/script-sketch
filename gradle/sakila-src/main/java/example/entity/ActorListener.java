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
public class ActorListener implements EntityListener<Actor> {

    @Override
    public void preInsert(Actor entity, PreInsertContext<Actor> context) {
    }

    @Override
    public void preUpdate(Actor entity, PreUpdateContext<Actor> context) {
    }

    @Override
    public void preDelete(Actor entity, PreDeleteContext<Actor> context) {
    }

    @Override
    public void postInsert(Actor entity, PostInsertContext<Actor> context) {
    }

    @Override
    public void postUpdate(Actor entity, PostUpdateContext<Actor> context) {
    }

    @Override
    public void postDelete(Actor entity, PostDeleteContext<Actor> context) {
    }
}