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
public class LanguageListener implements EntityListener<Language> {

    @Override
    public void preInsert(Language entity, PreInsertContext<Language> context) {
    }

    @Override
    public void preUpdate(Language entity, PreUpdateContext<Language> context) {
    }

    @Override
    public void preDelete(Language entity, PreDeleteContext<Language> context) {
    }

    @Override
    public void postInsert(Language entity, PostInsertContext<Language> context) {
    }

    @Override
    public void postUpdate(Language entity, PostUpdateContext<Language> context) {
    }

    @Override
    public void postDelete(Language entity, PostDeleteContext<Language> context) {
    }
}