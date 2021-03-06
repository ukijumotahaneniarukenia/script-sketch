plugins {
    id("org.jetbrains.kotlin.js") version "1.3.70-eap-184"
}

group = "org.example"
version = "1.0-SNAPSHOT"

repositories {
    maven { setUrl("https://dl.bintray.com/kotlin/kotlin-eap") }
    maven("https://kotlin.bintray.com/kotlin-js-wrappers/")
    mavenCentral()
    jcenter()
}

dependencies {
    implementation(kotlin("stdlib-js"))

    //React, React DOM + Wrappers (chapter 3)
    //reactライクなdom操作ライブラリを使用
    implementation("org.jetbrains:kotlin-react:16.13.0-pre.94-kotlin-1.3.70")
    implementation("org.jetbrains:kotlin-react-dom:16.13.0-pre.94-kotlin-1.3.70")
    implementation(npm("react", "16.13.1"))
    implementation(npm("react-dom", "16.13.1"))

    //Kotlin Styled (chapter 3)
    //cssのスタイリングで必要
    implementation("org.jetbrains:kotlin-styled:1.0.0-pre.94-kotlin-1.3.70")
    implementation(npm("styled-components"))
    implementation(npm("inline-style-prefixer"))

    //Video Player (chapter 7)
    // ﾋﾞﾃﾞｵﾌﾟﾚｲﾔなどnpmパッケージ管理ツールでインストール
    implementation(npm("react-player"))

    //Share Buttons (chapter 7)
    //ソーシャルシェアボタンなどをnpm経由でインストール
    implementation(npm("react-share"))

    //Coroutines (chapter 8)
    //コールバックよりKotlinのコルーチンを使ってみる
    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-core-common:1.3.5")
}

// Heroku Deployment (chapter 9)
tasks.register("stage") {
    dependsOn("build")
}


kotlin.target.browser { }
