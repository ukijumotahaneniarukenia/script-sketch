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
public class FilmListener implements EntityListener<Film> {

    @Override
    public void preInsert(Film entity, PreInsertContext<Film> context) {
    }

    @Override
    public void preUpdate(Film entity, PreUpdateContext<Film> context) {
    }

    @Override
    public void preDelete(Film entity, PreDeleteContext<Film> context) {
    }

    @Override
    public void postInsert(Film entity, PostInsertContext<Film> context) {
    }

    @Override
    public void postUpdate(Film entity, PostUpdateContext<Film> context) {
    }

    @Override
    public void postDelete(Film entity, PostDeleteContext<Film> context) {
    }
}