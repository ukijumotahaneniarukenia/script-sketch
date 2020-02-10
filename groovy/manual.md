# 参考文献
https://tyablog.net/2017/05/12/groovy-setup/ </br>
https://kobo.github.io/groovyserv/userguide.html </br>

# sdkコマンドからインストール

ユーザー単位でインストールできる

```
$curl -s "https://get.sdkman.io" | bash

                                -+syyyyyyys:
                            `/yho:`       -yd.
                         `/yh/`             +m.
                       .oho.                 hy                          .`
                     .sh/`                   :N`                `-/o`  `+dyyo:.
                   .yh:`                     `M-          `-/osysoym  :hs` `-+sys:      hhyssssssssy+
                 .sh:`                       `N:          ms/-``  yy.yh-      -hy.    `.N-````````+N.
               `od/`                         `N-       -/oM-      ddd+`     `sd:     hNNm        -N:
              :do`                           .M.       dMMM-     `ms.      /d+`     `NMMs       `do
            .yy-                             :N`    ```mMMM.      -      -hy.       /MMM:       yh
          `+d+`           `:/oo/`       `-/osyh/ossssssdNMM`           .sh:         yMMN`      /m.
         -dh-           :ymNMMMMy  `-/shmNm-`:N/-.``   `.sN            /N-         `NMMy      .m/
       `oNs`          -hysosmMMMMydmNmds+-.:ohm           :             sd`        :MMM/      yy
      .hN+           /d:    -MMMmhs/-.`   .MMMh   .ss+-                 `yy`       sMMN`     :N.
     :mN/           `N/     `o/-`         :MMMo   +MMMN-         .`      `ds       mMMh      do
    /NN/            `N+....--:/+oooosooo+:sMMM:   hMMMM:        `my       .m+     -MMM+     :N.
   /NMo              -+ooooo+/:-....`...:+hNMN.  `NMMMd`        .MM/       -m:    oMMN.     hs
  -NMd`                                    :mm   -MMMm- .s/     -MMm.       /m-   mMMd     -N.
 `mMM/                                      .-   /MMh. -dMo     -MMMy        od. .MMMs..---yh
 +MMM.                                           sNo`.sNMM+     :MMMM/        sh`+MMMNmNm+++-
 mMMM-                                           /--ohmMMM+     :MMMMm.       `hyymmmdddo
 MMMMh.                  ````                  `-+yy/`yMMM/     :MMMMMy       -sm:.``..-:-.`
 dMMMMmo-.``````..-:/osyhddddho.           `+shdh+.   hMMM:     :MmMMMM/   ./yy/` `:sys+/+sh/
 .dMMMMMMmdddddmmNMMMNNNNNMMMMMs           sNdo-      dMMM-  `-/yd/MMMMm-:sy+.   :hs-      /N`
  `/ymNNNNNNNmmdys+/::----/dMMm:          +m-         mMMM+ohmo/.` sMMMMdo-    .om:       `sh
     `.-----+/.`       `.-+hh/`         `od.          NMMNmds/     `mmy:`     +mMy      `:yy.
           /moyso+//+ossso:.           .yy`          `dy+:`         ..       :MMMN+---/oys:
         /+m:  `.-:::-`               /d+                                    +MMMMMMMNh:`
        +MN/                        -yh.                                     `+hddhy+.
       /MM+                       .sh:
      :NMo                      -sh/
     -NMs                    `/yy:
    .NMy                  `:sh+.
   `mMm`               ./yds-
  `dMMMmyo:-.````.-:oymNy:`
  +NMMMMMMMMMMMMMMMMms:`
    -+shmNMMMNmdy+:`


                                                                 Now attempting installation...


Looking for a previous installation of SDKMAN...
Looking for unzip...
Looking for zip...
Looking for curl...
Looking for sed...
Installing SDKMAN scripts...
Create distribution directories...
Getting available candidates...
Prime the config file...
Download script archive...
######################################################################## 100.0%
Extract script archive...
Install scripts...
Set version to 5.7.4+362 ...
Attempt update of interactive bash profile on regular UNIX...
Added sdkman init snippet to /root/.bashrc
Attempt update of zsh profile...
Updated existing /root/.zshrc



All done!


Please open a new terminal, or run the following in the existing one:

    source "/root/.sdkman/bin/sdkman-init.sh"

Then issue the following command:

    sdk help

Enjoy!!!
```

初期セットアップスクリプトを実行
```
$source "/root/.sdkman/bin/sdkman-init.sh"
```

ヘルプ表示
```
$sdk help
==== BROADCAST =================================================================
* 2020-01-18: Jbang 0.7.1 released on SDKMAN! #jbang
* 2020-01-18: Jbang 0.7.0 released on SDKMAN! #jbang
* 2020-01-18: Jbang 0.6.4.3 released on SDKMAN! #jbang
================================================================================

Usage: sdk <command> [candidate] [version]
       sdk offline <enable|disable>

   commands:
       install   or i    <candidate> [version] [local-path]
       uninstall or rm   <candidate> <version>
       list      or ls   [candidate]
       use       or u    <candidate> <version>
       default   or d    <candidate> [version]
       current   or c    [candidate]
       upgrade   or ug   [candidate]
       version   or v
       broadcast or b
       help      or h
       offline           [enable|disable]
       selfupdate        [force]
       update
       flush             <broadcast|archives|temp>

   candidate  :  the SDK to install: groovy, scala, grails, gradle, kotlin, etc.
                 use list command for comprehensive list of candidates
                 eg: $ sdk list
   version    :  where optional, defaults to latest stable if not provided
                 eg: $ sdk install groovy
   local-path :  optional path to an existing local installation
                 eg: $ sdk install groovy 2.4.13-local /opt/groovy-2.4.13
```

# sdk経由でいんすこできるコマンド一覧取得

```
$sdk list >a
$cat a

================================================================================
Available Candidates
================================================================================
q-quit                                  /-search down
j-down                                  ?-search up
k-up                                    h-help

--------------------------------------------------------------------------------
Ant (1.10.1)                                             https://ant.apache.org/

Apache Ant is a Java library and command-line tool whose mission is to drive
processes described in build files as targets and extension points dependent
upon each other. The main known usage of Ant is the build of Java applications.
Ant supplies a number of built-in tasks allowing to compile, assemble, test and
run Java applications. Ant can also be used effectively to build non Java
applications, for instance C or C++ applications. More generally, Ant can be
used to pilot any type of process which can be described in terms of targets and
tasks.

                                                               $ sdk install ant
--------------------------------------------------------------------------------
AsciidoctorJ (2.2.0)                                     http://asciidoctor.org/

AsciidoctorJ is the official library for running Asciidoctor on the JVM. Using
AsciidoctorJ, you can convert AsciiDoc content or analyze the structure of a
parsed AsciiDoc document from Java and other JVM languages.

                                                      $ sdk install asciidoctorj
--------------------------------------------------------------------------------
Bpipe (0.9.9.8)                                                 http://bpipe.org

Bpipe is a framework for running computational pipelines and workflows

                                                             $ sdk install bpipe
--------------------------------------------------------------------------------
Ceylon (1.3.3)                                           http://ceylon-lang.org/

Ceylon is a modern, modular, statically typed programming language for the Java
and JavaScript virtual machines. The language features a flexible and very
readable syntax, a unique and uncommonly elegant static type system, a powerful
module architecture, and excellent tooling.

                                                            $ sdk install ceylon
--------------------------------------------------------------------------------
CRaSH (1.3.0)                                            http://www.crashub.org/

The Common Reusable SHell (CRaSH) deploys in a Java runtime and provides
interactions with the JVM. Commands are written in Groovy or Java and can be
developed at runtime making the extension of the shell very easy with fast
development cycle.

                                                             $ sdk install crash
--------------------------------------------------------------------------------
CUBA CLI (2.1.0)                                       https://cuba-platform.com

CUBA CLI is an open source command line utility that enables you to easily
create projects based on CUBA Platform

                                                              $ sdk install cuba
--------------------------------------------------------------------------------
CXF (3.2.5)                                              https://cxf.apache.org/

Apache CXF is an open source services framework. CXF helps you build and develop
services using frontend programming APIs, like JAX-WS and JAX-RS. These services
can speak a variety of protocols such as SOAP, XML/HTTP, RESTful HTTP, or CORBA
and work over a variety of transports such as HTTP, JMS or JBI.

                                                               $ sdk install cxf
--------------------------------------------------------------------------------
Gaiden (1.2)                                       http://kobo.github.io/gaiden/

Gaiden is a tool that makes it easy to create documentation with Markdown.

                                                            $ sdk install gaiden
--------------------------------------------------------------------------------
Glide (0.9.2)                                      http://glide-gae.appspot.com/

Glide makes it incredibly easy to develop apps that harness the power of Google
App Engine for Java using expressiveness of Groovy and sweetness of Gaelyk's
syntactic sugar.

                                                             $ sdk install glide
--------------------------------------------------------------------------------
Gradle (6.1)                                                  http://gradle.org/

Gradle is a build automation tool that builds upon the concepts of Apache Ant
and Apache Maven and introduces a Groovy-based domain-specific language (DSL)
instead of the more traditional XML form of declaring the project configuration.
Gradle uses a directed acyclic graph (DAG) to determine the order in which tasks
can be run.

                                                            $ sdk install gradle
--------------------------------------------------------------------------------
Grails (4.0.1)                                               https://grails.org/

Grails is a powerful web framework, for the Java platform aimed at multiplying
developers productivity thanks to a Convention-over-Configuration, sensible
defaults and opinionated APIs. It integrates smoothly with the JVM, allowing you
to be immediately productive whilst providing powerful features, including
integrated ORM, Domain-Specific Languages, runtime and compile-time
meta-programming and Asynchronous programming.

                                                            $ sdk install grails
--------------------------------------------------------------------------------
Groovy (2.5.9)                                       http://www.groovy-lang.org/

Groovy is a powerful, optionally typed and dynamic language, with static-typing
and static compilation capabilities, for the Java platform aimed at multiplying
developers' productivity thanks to a concise, familiar and easy to learn syntax.
It integrates smoothly with any Java program, and immediately delivers to your
application powerful features, including scripting capabilities, Domain-Specific
Language authoring, runtime and compile-time meta-programming and functional
programming.

                                                            $ sdk install groovy
--------------------------------------------------------------------------------
GroovyServ (1.2.0)                            https://kobo.github.io/groovyserv/

GroovyServ reduces startup time of the JVM for runnning Groovy significantly. It
depends on your environments, but in most cases, it’s 10 to 20 times faster than
regular Groovy.

                                                        $ sdk install groovyserv
--------------------------------------------------------------------------------
Infrastructor (0.2.2)                                   http://infrastructor.io/

Infrastructor is an open source server provisioning tool written in Groovy

                                                     $ sdk install infrastructor
--------------------------------------------------------------------------------
Java (11.0.5.hs-adpt)                                          https://zulu.org/

Java Platform, Standard Edition (or Java SE) is a widely used platform for
development and deployment of portable code for desktop and server environments.
Java SE uses the object-oriented Java programming language. It is part of the
Java software-platform family. Java SE defines a wide range of general-purpose
APIs – such as Java APIs for the Java Class Library – and also includes the Java
Language Specification and the Java Virtual Machine Specification.

                                                              $ sdk install java
--------------------------------------------------------------------------------
JBake (2.6.4)                                                  http://jbake.org/

JBake is a Java based, open source, static site/blog generator for developers
and designers.

                                                             $ sdk install jbake
--------------------------------------------------------------------------------
J'Bang (0.7.1)                              http://github.com/maxandersen/jbang/

J'Bang makes it easy to use Java for scripting. It lets you use a single file
for code and dependency management and allows you to run it directly.

                                                             $ sdk install jbang
--------------------------------------------------------------------------------
Kotlin (1.3.61)                                          https://kotlinlang.org/

Kotlin is a statically-typed programming language that runs on the Java Virtual
Machine and can also be compiled to JavaScript source code.

                                                            $ sdk install kotlin
--------------------------------------------------------------------------------
kscript (2.9.3)                          https://github.com/holgerbrandl/kscript

Enhanced scripting support for Kotlin on *nix-based systems. kscript provides an
easy-to-use, very flexible, and almost zero-overhead solution to write
self-contained mini-applications with Kotlin.

                                                           $ sdk install kscript
--------------------------------------------------------------------------------
Lazybones (0.8.3)                        https://github.com/pledbrook/lazybones/

Lazybones allows you to create a new project structure for any framework or
library for which the tool has a template.

                                                         $ sdk install lazybones
--------------------------------------------------------------------------------
Leiningen (2.9.0)                                          http://leiningen.org/

Leiningen is the easiest way to use Clojure. With a focus on project automation
and declarative configuration, it gets out of your way and lets you focus on
your code.

                                                         $ sdk install leiningen
--------------------------------------------------------------------------------
Maven (3.6.3)                                          https://maven.apache.org/

Apache Maven is a software project management and comprehension tool. Based on
the concept of a project object model (POM), Maven can manage a project's build,
reporting and documentation from a central piece of information.

                                                             $ sdk install maven
--------------------------------------------------------------------------------
Micronaut (1.2.9)                                           http://micronaut.io/

Micronaut is an open source microservice framework for the JVM

                                                         $ sdk install micronaut
--------------------------------------------------------------------------------
sbt (1.3.7)                                            http://www.scala-sbt.org/

SBT is an open source build tool for Scala and Java projects, similar to Java's
Maven or Ant. Its main features are: native support for compiling Scala code and
integrating with many Scala test frameworks; build descriptions written in Scala
using a DSL; dependency management using Ivy (which supports Maven-format
repositories); continuous compilation, testing, and deployment; integration with
the Scala interpreter for rapid iteration and debugging; support for mixed
Java/Scala projects

                                                               $ sdk install sbt
--------------------------------------------------------------------------------
Scala (2.13.1)                                        http://www.scala-lang.org/

Scala is a programming language for general software applications. Scala has
full support for functional programming and a very strong static type system.
This allows programs written in Scala to be very concise and thus smaller in
size than other general-purpose programming languages. Scala source code is
intended to be compiled to Java bytecode, so that the resulting executable code
runs on a Java virtual machine. Java libraries may be used directly in Scala
code and vice versa. Scala is object-oriented, and uses a curly-brace syntax.
Scala has many features of functional programming languages, including currying,
type inference, immutability, lazy evaluation, and pattern matching. It also has
an advanced type system supporting algebraic data types, covariance and
contravariance, higher-order types, and anonymous types. Other features of Scala
include operator overloading, optional parameters, named parameters, raw
strings, and no checked exceptions.

                                                             $ sdk install scala
--------------------------------------------------------------------------------
Spark (2.4.4)                                          https://spark.apache.org/

Apache Spark is an open-source cluster-computing framework. Spark provides an
interface for programming entire clusters with implicit data parallelism and
fault-tolerance.

                                                             $ sdk install spark
--------------------------------------------------------------------------------
Spring Boot (2.2.3.RELEASE)               http://projects.spring.io/spring-boot/

Spring Boot takes an opinionated view of building production-ready Spring
applications. It favors convention over configuration and is designed to get you
up and running as quickly as possible.

                                                        $ sdk install springboot
--------------------------------------------------------------------------------
Sshoogr (0.9.25)                             https://github.com/aestasit/sshoogr

Sshoogr is a Groovy based DSL and command line tool for working with remote
servers through SSH.

                                                           $ sdk install sshoogr
--------------------------------------------------------------------------------
Vert.x (3.8.4)                                                  http://vertx.io/

Vert.x is a tool-kit for building reactive applications on the JVM.

                                                             $ sdk install vertx
--------------------------------------------------------------------------------
VisualVM (1.4.4)                                     https://visualvm.github.io/

VisualVM is a tool that provides a visual interface for viewing detailed
information about Java applications while they are running on a Java Virtual
Machine.

                                                          $ sdk install visualvm
--------------------------------------------------------------------------------

```

# groovyコマンドいんすこ

```
$sdk install groovy

Downloading: groovy 2.5.9

In progress...

######################################################################## 100.0%

Installing: groovy 2.5.9
Done installing!


Setting groovy 2.5.9 as default.




$which groovy
~/.sdkman/candidates/groovy/current/bin/groovy
```

# groovyservコマンドいんすこ

```
$sdk install groovyserv

Downloading: groovyserv 1.2.0

In progress...

######################################################################## 100.0%

Installing: groovyserv 1.2.0
Done installing!


Setting groovyserv 1.2.0 as default.


$which groovyclient
~/.sdkman/candidates/groovyserv/current/bin/groovyclient
```


# 動作確認

```
$cat hoge.groovy 
println "hello"
$groovyclient hoge.groovy 
hello
```
