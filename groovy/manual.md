# 参考文献

https://docs.spring.io/spring-boot/docs/2.2.2.RELEASE/reference/htmlsingle/#getting-started-installing-the-cli

# springコマンドラインいんすこ

```
$cd /usr/local/src
$curl -LO https://repo.spring.io/release/org/springframework/boot/spring-boot-cli/2.2.2.RELEASE/spring-boot-cli-2.2.2.RELEASE-bin.tar.gz
$tar xvf spring-boot-cli-2.2.2.RELEASE-bin.tar.gz
$echo 'export SPRING_HOME=/usr/local/src/spring-2.2.2.RELEASE' >>~/.bashrc
$echo 'export PATH=$PATH:$SPRING_HOME/bin' >>~/.bashrc
$ln -fns /usr/local/src/spring-2.2.2.RELEASE/shell-completion/bash/spring /etc/bash_completion.d/spring
$source ~/.bashrc
```

動作確認
```
$spring --version
Spring CLI v2.2.2.RELEASE
```

app.groovyファイル作成

```
$cat app.groovy 
@RestController
class ThisWillActuallyRun {

    @RequestMapping("/")
    String home() {
        "Hello World!"
    }

}
```


restサーバプロセス起動
```
$spring run app.groovy 1>~/launch_spring-groovy.log 2>&1 </dev/null &
```

ログ確認
```
$cat launch_spring-groovy.log 
WARNING: An illegal reflective access operation has occurred
WARNING: Illegal reflective access by org.codehaus.groovy.vmplugin.v7.Java7$1 (jar:file:/usr/local/src/spring-2.2.2.RELEASE/lib/spring-boot-cli-2.2.2.RELEASE.jar!/BOOT-INF/lib/groovy-2.5.8.jar!/) to constructor java.lang.invoke.MethodHandles$Lookup(java.lang.Class,int)
WARNING: Please consider reporting this to the maintainers of org.codehaus.groovy.vmplugin.v7.Java7$1
WARNING: Use --illegal-access=warn to enable warnings of further illegal reflective access operations
WARNING: All illegal access operations will be denied in a future release

  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/
 :: Spring Boot ::        (v2.2.2.RELEASE)

2020-01-18 22:18:23.842  INFO 9262 --- [       runner-0] o.s.boot.SpringApplication               : Starting application on 2343aeb5ad0a with PID 9262 (started by kuraine in /home/kuraine)
2020-01-18 22:18:23.846  INFO 9262 --- [       runner-0] o.s.boot.SpringApplication               : No active profile set, falling back to default profiles: default
2020-01-18 22:18:24.428  INFO 9262 --- [       runner-0] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat initialized with port(s): 8080 (http)
2020-01-18 22:18:24.442  INFO 9262 --- [       runner-0] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
2020-01-18 22:18:24.442  INFO 9262 --- [       runner-0] org.apache.catalina.core.StandardEngine  : Starting Servlet engine: [Apache Tomcat/9.0.29]
2020-01-18 22:18:24.468  INFO 9262 --- [       runner-0] org.apache.catalina.loader.WebappLoader  : Unknown class loader [org.springframework.boot.cli.compiler.ExtendedGroovyClassLoader$DefaultScopeParentClassLoader@763d9750] of class [class org.springframework.boot.cli.compiler.ExtendedGroovyClassLoader$DefaultScopeParentClassLoader]
2020-01-18 22:18:24.492  INFO 9262 --- [       runner-0] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring embedded WebApplicationContext
2020-01-18 22:18:24.492  INFO 9262 --- [       runner-0] o.s.web.context.ContextLoader            : Root WebApplicationContext: initialization completed in 539 ms
2020-01-18 22:18:24.601  INFO 9262 --- [       runner-0] o.s.s.concurrent.ThreadPoolTaskExecutor  : Initializing ExecutorService 'applicationTaskExecutor'
2020-01-18 22:18:24.801  INFO 9262 --- [       runner-0] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port(s): 8080 (http) with context path ''
2020-01-18 22:18:24.803  INFO 9262 --- [       runner-0] o.s.boot.SpringApplication               : Started application in 1.313 seconds (JVM running for 2.409)
```

URLアクセス
```
http://localhost:8080/
```
