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
public class StaffListener implements EntityListener<Staff> {

    @Override
    public void preInsert(Staff entity, PreInsertContext<Staff> context) {
    }

    @Override
    public void preUpdate(Staff entity, PreUpdateContext<Staff> context) {
    }

    @Override
    public void preDelete(Staff entity, PreDeleteContext<Staff> context) {
    }

    @Override
    public void postInsert(Staff entity, PostInsertContext<Staff> context) {
    }

    @Override
    public void postUpdate(Staff entity, PostUpdateContext<Staff> context) {
    }

    @Override
    public void postDelete(Staff entity, PostDeleteContext<Staff> context) {
    }
}