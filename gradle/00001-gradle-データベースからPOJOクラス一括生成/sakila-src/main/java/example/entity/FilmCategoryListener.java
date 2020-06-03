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
public class FilmCategoryListener implements EntityListener<FilmCategory> {

    @Override
    public void preInsert(FilmCategory entity, PreInsertContext<FilmCategory> context) {
    }

    @Override
    public void preUpdate(FilmCategory entity, PreUpdateContext<FilmCategory> context) {
    }

    @Override
    public void preDelete(FilmCategory entity, PreDeleteContext<FilmCategory> context) {
    }

    @Override
    public void postInsert(FilmCategory entity, PostInsertContext<FilmCategory> context) {
    }

    @Override
    public void postUpdate(FilmCategory entity, PostUpdateContext<FilmCategory> context) {
    }

    @Override
    public void postDelete(FilmCategory entity, PostDeleteContext<FilmCategory> context) {
    }
}