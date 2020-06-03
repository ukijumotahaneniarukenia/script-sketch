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
public class FilmActorListener implements EntityListener<FilmActor> {

    @Override
    public void preInsert(FilmActor entity, PreInsertContext<FilmActor> context) {
    }

    @Override
    public void preUpdate(FilmActor entity, PreUpdateContext<FilmActor> context) {
    }

    @Override
    public void preDelete(FilmActor entity, PreDeleteContext<FilmActor> context) {
    }

    @Override
    public void postInsert(FilmActor entity, PostInsertContext<FilmActor> context) {
    }

    @Override
    public void postUpdate(FilmActor entity, PostUpdateContext<FilmActor> context) {
    }

    @Override
    public void postDelete(FilmActor entity, PostDeleteContext<FilmActor> context) {
    }
}