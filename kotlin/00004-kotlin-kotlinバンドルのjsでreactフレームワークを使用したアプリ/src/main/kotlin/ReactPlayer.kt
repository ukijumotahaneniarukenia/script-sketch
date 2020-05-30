@file:JsModule("react-player")
@file:JsNonModule

import react.*

//nodejsでの以下の定義と同義
//require("react-player").default;

//jsとkotlinのマッピング定義（外部ライブラリ単位）
@JsName("default")
external val reactPlayer: RClass<ReactPlayerProps>

//プロパティなどをインターフェスで定義
external interface ReactPlayerProps : RProps {
    var url: String
}