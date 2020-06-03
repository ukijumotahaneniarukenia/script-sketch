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
public class FilmTextListener implements EntityListener<FilmText> {

    @Override
    public void preInsert(FilmText entity, PreInsertContext<FilmText> context) {
    }

    @Override
    public void preUpdate(FilmText entity, PreUpdateContext<FilmText> context) {
    }

    @Override
    public void preDelete(FilmText entity, PreDeleteContext<FilmText> context) {
    }

    @Override
    public void postInsert(FilmText entity, PostInsertContext<FilmText> context) {
    }

    @Override
    public void postUpdate(FilmText entity, PostUpdateContext<FilmText> context) {
    }

    @Override
    public void postDelete(FilmText entity, PostDeleteContext<FilmText> context) {
    }
}