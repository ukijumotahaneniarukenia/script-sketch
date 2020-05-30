@file:JsModule("react-share")
@file:JsNonModule

import react.RClass
import react.RProps

//jsとkotlinのマッピング定義（外部ライブラリ単位）
@JsName("EmailIcon")
external val emailIcon: RClass<IconProps>

@JsName("EmailShareButton")
external val emailShareButton: RClass<ShareButtonProps>

@JsName("TelegramIcon")
external val telegramIcon: RClass<IconProps>

@JsName("TelegramShareButton")
external val telegramShareButton: RClass<ShareButtonProps>


//プロパティなどをインターフェスで定義
external interface ShareButtonProps : RProps {
    var url: String
}

//プロパティなどをインターフェスで定義
external interface IconProps : RProps {
    var size: Int
    var round: Boolean
}