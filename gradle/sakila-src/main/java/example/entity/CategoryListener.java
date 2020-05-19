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
public class CategoryListener implements EntityListener<Category> {

    @Override
    public void preInsert(Category entity, PreInsertContext<Category> context) {
    }

    @Override
    public void preUpdate(Category entity, PreUpdateContext<Category> context) {
    }

    @Override
    public void preDelete(Category entity, PreDeleteContext<Category> context) {
    }

    @Override
    public void postInsert(Category entity, PostInsertContext<Category> context) {
    }

    @Override
    public void postUpdate(Category entity, PostUpdateContext<Category> context) {
    }

    @Override
    public void postDelete(Category entity, PostDeleteContext<Category> context) {
    }
}