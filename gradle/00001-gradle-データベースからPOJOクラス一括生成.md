# domaで自動生成

- http://gradle.monochromeroad.com/docs/userguide/userguide_single.html#hello
- https://ksby.hatenablog.com/entry/2015/10/15/043336
- https://doma.readthedocs.io/en/stable/getting-started-eclipse/#install-jdk
- https://github.com/domaframework/doma/
- https://github.com/domaframework/doma-spring-boot
- https://doma.readthedocs.io/en/stable/config/
- https://kunst1080.hatenablog.com/entry/2016/07/17/181256

# ベンチを使ってリバエン

https://ti-tomo-knowledge.hatenablog.com/entry/2018/05/21/082211


# build.gradleファイル作成

```
$cat build.gradle
configurations {
    domaGenRuntime
}

repositories {
    mavenCentral()
    maven {url 'https://oss.sonatype.org/content/repositories/snapshots/'}
}

dependencies {
    domaGenRuntime 'org.seasar.doma:doma-gen:2.26.0'
    domaGenRuntime 'mysql:mysql-connector-java:8.0.18'
}

task gen {
    group = 'doma-gen'
    doLast {
        ant.taskdef(resource: 'domagentask.properties',
            classpath: configurations.domaGenRuntime.asPath)
        ant.gen(url: 'jdbc:mysql://127.0.0.1/sakila', user: 'root', password: 'Mysql3306') {
            entityConfig()
            daoConfig()
            sqlConfig()
        }
    }
}
```

# build.gradleファイルがあるディレクトリでタスク実行

```
$ls
build.gradle  sakila-db  sakila-db.zip
```

# 実行
```
$gradle gen

> Task :gen
[ant:gen] Loading class `com.mysql.jdbc.Driver'. This is deprecated. The new driver class is `com.mysql.cj.jdbc.Driver'. The driver is automatically registered via the SPI and manual loading of the driver class is generally unnecessary.

BUILD SUCCESSFUL in 23s
1 actionable task: 1 executed
```

ダウンロードされたjarファイルは以下にある

```
$cd ~/.gradle/caches/modules-2/files-2.1
$find $(pwd) -name "*jar" 2>/dev/null
/home/kuraine/.gradle/caches/modules-2/files-2.1/org.seasar.doma/doma/2.26.0/a5c3237730a2c68215b7bbaa29b96bbbf9374b98/doma-2.26.0.jar
/home/kuraine/.gradle/caches/modules-2/files-2.1/org.seasar.doma/doma-gen/2.26.0/c72d09c4cc03e4cda66f172ba6c40997382ef423/doma-gen-2.26.0.jar
/home/kuraine/.gradle/caches/modules-2/files-2.1/org.freemarker/freemarker/2.3.20/5ad6bea46b5af666d88c260c8acc6a03408723c8/freemarker-2.3.20.jar
/home/kuraine/.gradle/caches/modules-2/files-2.1/mysql/mysql-connector-java/8.0.18/e088efaa4b568bc7d9f7274b9c5ea1a00da1a45c/mysql-connector-java-8.0.18.jar
/home/kuraine/.gradle/caches/modules-2/files-2.1/com.google.protobuf/protobuf-java/3.6.1/d06d46ecfd92ec6d0f3b423b4cd81cb38d8b924/protobuf-java-3.6.1.jar
/home/kuraine/.gradle/caches/modules-2/files-2.1/org.apache.ant/ant/1.9.3/311ac248030ff4f9f27e55561fadf3e99c646abb/ant-1.9.3.jar
/home/kuraine/.gradle/caches/modules-2/files-2.1/org.apache.ant/ant-launcher/1.9.3/a98ddc70a74c9cc6cad6520f857db59af8227e07/ant-launcher-1.9.3.jar
```

# 実行結果

実行後、中身が空のgradleフォルダと成果物が入ったsrcフォルダができた

```
$ls
build.gradle  gradle  sakila-db  sakila-db.zip  src
```

便利。
```
$find src -name "****"
src
src/main
src/main/resources
src/main/resources/META-INF
src/main/resources/META-INF/example
src/main/resources/META-INF/example/dao
src/main/resources/META-INF/example/dao/LanguageDao
src/main/resources/META-INF/example/dao/LanguageDao/selectById.sql
src/main/resources/META-INF/example/dao/PaymentDao
src/main/resources/META-INF/example/dao/PaymentDao/selectById.sql
src/main/resources/META-INF/example/dao/CityDao
src/main/resources/META-INF/example/dao/CityDao/selectById.sql
src/main/resources/META-INF/example/dao/FilmCategoryDao
src/main/resources/META-INF/example/dao/FilmCategoryDao/selectById.sql
src/main/resources/META-INF/example/dao/AddressDao
src/main/resources/META-INF/example/dao/AddressDao/selectById.sql
src/main/resources/META-INF/example/dao/CountryDao
src/main/resources/META-INF/example/dao/CountryDao/selectById.sql
src/main/resources/META-INF/example/dao/InventoryDao
src/main/resources/META-INF/example/dao/InventoryDao/selectById.sql
src/main/resources/META-INF/example/dao/ActorDao
src/main/resources/META-INF/example/dao/ActorDao/selectById.sql
src/main/resources/META-INF/example/dao/CustomerDao
src/main/resources/META-INF/example/dao/CustomerDao/selectById.sql
src/main/resources/META-INF/example/dao/CategoryDao
src/main/resources/META-INF/example/dao/CategoryDao/selectById.sql
src/main/resources/META-INF/example/dao/FilmDao
src/main/resources/META-INF/example/dao/FilmDao/selectById.sql
src/main/resources/META-INF/example/dao/RentalDao
src/main/resources/META-INF/example/dao/RentalDao/selectById.sql
src/main/resources/META-INF/example/dao/FilmTextDao
src/main/resources/META-INF/example/dao/FilmTextDao/selectById.sql
src/main/resources/META-INF/example/dao/SysConfigDao
src/main/resources/META-INF/example/dao/SysConfigDao/selectById.sql
src/main/resources/META-INF/example/dao/FilmActorDao
src/main/resources/META-INF/example/dao/FilmActorDao/selectById.sql
src/main/resources/META-INF/example/dao/StoreDao
src/main/resources/META-INF/example/dao/StoreDao/selectById.sql
src/main/resources/META-INF/example/dao/StaffDao
src/main/resources/META-INF/example/dao/StaffDao/selectById.sql
src/main/java
src/main/java/example
src/main/java/example/entity
src/main/java/example/entity/Language.java
src/main/java/example/entity/AddressListener.java
src/main/java/example/entity/StaffListener.java
src/main/java/example/entity/PaymentListener.java
src/main/java/example/entity/FilmTextListener.java
src/main/java/example/entity/CountryListener.java
src/main/java/example/entity/Category.java
src/main/java/example/entity/Country.java
src/main/java/example/entity/Payment.java
src/main/java/example/entity/FilmCategoryListener.java
src/main/java/example/entity/RentalListener.java
src/main/java/example/entity/Inventory.java
src/main/java/example/entity/ActorListener.java
src/main/java/example/entity/City.java
src/main/java/example/entity/SysConfig.java
src/main/java/example/entity/CustomerListener.java
src/main/java/example/entity/Film.java
src/main/java/example/entity/StoreListener.java
src/main/java/example/entity/FilmText.java
src/main/java/example/entity/FilmActorListener.java
src/main/java/example/entity/FilmActor.java
src/main/java/example/entity/Address.java
src/main/java/example/entity/InventoryListener.java
src/main/java/example/entity/Rental.java
src/main/java/example/entity/FilmCategory.java
src/main/java/example/entity/Customer.java
src/main/java/example/entity/CategoryListener.java
src/main/java/example/entity/SysConfigListener.java
src/main/java/example/entity/Store.java
src/main/java/example/entity/FilmListener.java
src/main/java/example/entity/Actor.java
src/main/java/example/entity/CityListener.java
src/main/java/example/entity/LanguageListener.java
src/main/java/example/entity/Staff.java
src/main/java/example/dao
src/main/java/example/dao/LanguageDao.java
src/main/java/example/dao/CustomerDao.java
src/main/java/example/dao/CountryDao.java
src/main/java/example/dao/CityDao.java
src/main/java/example/dao/SysConfigDao.java
src/main/java/example/dao/StoreDao.java
src/main/java/example/dao/FilmDao.java
src/main/java/example/dao/FilmActorDao.java
src/main/java/example/dao/CategoryDao.java
src/main/java/example/dao/InventoryDao.java
src/main/java/example/dao/FilmTextDao.java
src/main/java/example/dao/ActorDao.java
src/main/java/example/dao/AddressDao.java
src/main/java/example/dao/PaymentDao.java
src/main/java/example/dao/FilmCategoryDao.java
src/main/java/example/dao/StaffDao.java
src/main/java/example/dao/RentalDao.java
```

テーブル単位で確認

```
$find src -name "*" -type f | grep Rental
src/main/resources/META-INF/example/dao/RentalDao/selectById.sql
src/main/java/example/entity/RentalListener.java
src/main/java/example/entity/Rental.java
src/main/java/example/dao/RentalDao.java
```

主キー検索sql

```
$cat src/main/resources/META-INF/example/dao/RentalDao/selectById.sql
select
  /*%expand*/*
from
  rental
where
  rental_id = /* rentalId */1
```

リスナークラス
```
$cat src/main/java/example/entity/RentalListener.java
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
public class RentalListener implements EntityListener<Rental> {

    @Override
    public void preInsert(Rental entity, PreInsertContext<Rental> context) {
    }

    @Override
    public void preUpdate(Rental entity, PreUpdateContext<Rental> context) {
    }

    @Override
    public void preDelete(Rental entity, PreDeleteContext<Rental> context) {
    }

    @Override
    public void postInsert(Rental entity, PostInsertContext<Rental> context) {
    }

    @Override
    public void postUpdate(Rental entity, PostUpdateContext<Rental> context) {
    }

    @Override
    public void postDelete(Rental entity, PostDeleteContext<Rental> context) {
    }
}
```

ピュアクラス
```
$cat src/main/java/example/entity/Rental.java
package example.entity;

import java.time.LocalDateTime;
import org.seasar.doma.Column;
import org.seasar.doma.Entity;
import org.seasar.doma.GeneratedValue;
import org.seasar.doma.GenerationType;
import org.seasar.doma.Id;
import org.seasar.doma.Table;

/**
 *
 */
@Entity(listener = RentalListener.class)
@Table(name = "rental")
public class Rental {

    /**  */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "rental_id")
    Integer rentalId;

    /**  */
    @Column(name = "rental_date")
    LocalDateTime rentalDate;

    /**  */
    @Column(name = "inventory_id")
    Integer inventoryId;

    /**  */
    @Column(name = "customer_id")
    Integer customerId;

    /**  */
    @Column(name = "return_date")
    LocalDateTime returnDate;

    /**  */
    @Column(name = "staff_id")
    Short staffId;

    /**  */
    @Column(name = "last_update")
    LocalDateTime lastUpdate;

    /**
     * Returns the rentalId.
     *
     * @return the rentalId
     */
    public Integer getRentalId() {
        return rentalId;
    }

    /**
     * Sets the rentalId.
     *
     * @param rentalId the rentalId
     */
    public void setRentalId(Integer rentalId) {
        this.rentalId = rentalId;
    }

    /**
     * Returns the rentalDate.
     *
     * @return the rentalDate
     */
    public LocalDateTime getRentalDate() {
        return rentalDate;
    }

    /**
     * Sets the rentalDate.
     *
     * @param rentalDate the rentalDate
     */
    public void setRentalDate(LocalDateTime rentalDate) {
        this.rentalDate = rentalDate;
    }

    /**
     * Returns the inventoryId.
     *
     * @return the inventoryId
     */
    public Integer getInventoryId() {
        return inventoryId;
    }

    /**
     * Sets the inventoryId.
     *
     * @param inventoryId the inventoryId
     */
    public void setInventoryId(Integer inventoryId) {
        this.inventoryId = inventoryId;
    }

    /**
     * Returns the customerId.
     *
     * @return the customerId
     */
    public Integer getCustomerId() {
        return customerId;
    }

    /**
     * Sets the customerId.
     *
     * @param customerId the customerId
     */
    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    /**
     * Returns the returnDate.
     *
     * @return the returnDate
     */
    public LocalDateTime getReturnDate() {
        return returnDate;
    }

    /**
     * Sets the returnDate.
     *
     * @param returnDate the returnDate
     */
    public void setReturnDate(LocalDateTime returnDate) {
        this.returnDate = returnDate;
    }

    /**
     * Returns the staffId.
     *
     * @return the staffId
     */
    public Short getStaffId() {
        return staffId;
    }

    /**
     * Sets the staffId.
     *
     * @param staffId the staffId
     */
    public void setStaffId(Short staffId) {
        this.staffId = staffId;
    }

    /**
     * Returns the lastUpdate.
     *
     * @return the lastUpdate
     */
    public LocalDateTime getLastUpdate() {
        return lastUpdate;
    }

    /**
     * Sets the lastUpdate.
     *
     * @param lastUpdate the lastUpdate
     */
    public void setLastUpdate(LocalDateTime lastUpdate) {
        this.lastUpdate = lastUpdate;
    }
}
```
Daoクラス
```
$cat src/main/java/example/dao/RentalDao.java
package example.dao;

import example.entity.Rental;
import org.seasar.doma.Dao;
import org.seasar.doma.Delete;
import org.seasar.doma.Insert;
import org.seasar.doma.Select;
import org.seasar.doma.Update;

/**
 */
@Dao
public interface RentalDao {

    /**
     * @param rentalId
     * @return the Rental entity
     */
    @Select
    Rental selectById(Integer rentalId);

    /**
     * @param entity
     * @return affected rows
     */
    @Insert
    int insert(Rental entity);

    /**
     * @param entity
     * @return affected rows
     */
    @Update
    int update(Rental entity);

    /**
     * @param entity
     * @return affected rows
     */
    @Delete
    int delete(Rental entity);
}
```
