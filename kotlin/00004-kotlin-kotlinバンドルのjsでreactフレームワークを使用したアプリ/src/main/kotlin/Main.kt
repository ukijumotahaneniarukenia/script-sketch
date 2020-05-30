import react.dom.render
import kotlin.browser.document

//データ構造体を定義
data class Video(val id: Int, val title: String, val speaker: String, val videoUrl: String)

//エントリポイントを定義
fun main() {
    //index.htmlのrootタグに対して各種レンダラ定義を実行していく
    render(document.getElementById("root")) {
        child(App::class) {}
    }
}