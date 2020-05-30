import kotlinx.css.*
import react.*
import react.dom.*
import styled.css
import styled.styledDiv

//現状まだ見ていないリストと見たリストの両方から１つずつ選択できるので、
//それらを選択された要素として単一管理するために型定義
//メモリ領域を複数ではなく、単一に変更
//Rstateを継承させておく

external interface AppState: RState {
    var currentVideo: Video?
}

//定義したインターフェースを継承するように修正
class App : RComponent<RProps, AppState>() {
    override fun RBuilder.render() {
        h1 {
            +"KotlinConf Explorer"
        }
        div {
            h3 {
                +"Videos to watch"
            }
            videoList {
                videos = unwatchedVideos
                selectedVideo = state.currentVideo
                onSelectVideo = { video ->
                    setState {
                        currentVideo = video
                    }
                }
            }

            h3 {
                +"Videos watched"
            }
            videoList {
                videos = watchedVideos
                selectedVideo = state.currentVideo
                onSelectVideo = { video ->
                    setState {
                        currentVideo = video
                    }
                }
            }
        }
        styledDiv {
            //タグの位置を定義したい場合はstyledDivブロックで定義スタイルを定義したいタグを囲む
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
    }
}