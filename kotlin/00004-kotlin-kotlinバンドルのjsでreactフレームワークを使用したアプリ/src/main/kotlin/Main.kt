import react.dom.*
import kotlin.browser.document

import kotlinx.css.*
import styled.*

//データ構造Bean定義
data class Video(val id: Int, val title: String, val speaker: String, val videoUrl: String)

//メモリ上にリスト定義
val unwatchedVideos = listOf(
    Video(1, "Building and breaking things", "ロバートデニーロ", "https://youtu.be/PsaFVLr8t4E"),
    Video(2, "The development process", "レオナルド・ディカプリオ", "https://youtu.be/PsaFVLr8t4E"),
    Video(3, "The Web 7.0", "森鴎外", "https://youtu.be/PsaFVLr8t4E")
)

//メモリ上にリスト定義
val watchedVideos = listOf(
    Video(4, "Mouseless development", "ベン・ジョンソン", "https://youtu.be/PsaFVLr8t4E")
)


fun main() {
//    document.bgColor = "blue"
    render(document.getElementById("root")){

        styledDiv {
            //指定した書式で配置するタグをstyledDivブロックで囲んでブラウザにレンダラさせる
            css {
                position = Position.absolute
                top = 10.px
                right = 10.px
            }
            h3 {
                +"John Doe: Building and breaking things"
            }
            img {
                attrs {
                    src = "https://via.placeholder.com/640x360.png?text=Video+Player+Placeholder"
                }
            }
        }

        h1 {
            +"KotlinConf Explorer"
        }
        div {
            h3 {
                +"Videos to watch"
            }
            p {
                +"John Doe: Building and breaking things"
            }
            p {
                +"Jane Smith: The development process"
            }
            p {
                +"Matt Miller: The Web 7.0"
            }

            h3 {
                +"Videos watched"
            }
            p {
                +"Tom Jerry: Mouseless development"
            }
        }

        div{
            + "まだ見ていいない動画リスト"
        }
        //動的にタグ定義
        for(video in unwatchedVideos) {
            p {
                +"${video.speaker}: ${video.title}"
            }
        }
        div{
            + "見た動画リスト"
        }
        //動的にタグ定義
        for(video in watchedVideos) {
            p {
                +"${video.speaker}: ${video.title}"
            }
        }
//        div {
//            h3 {
//                +"John Doe: Building and breaking things"
//            }
//            img {
//                attrs {
//                    src = "https://via.placeholder.com/640x360.png?text=Video+Player+Placeholder"
//                }
//            }
//        }
    }
}