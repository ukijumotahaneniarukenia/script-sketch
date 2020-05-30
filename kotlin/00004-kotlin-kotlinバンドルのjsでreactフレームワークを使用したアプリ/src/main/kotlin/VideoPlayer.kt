import kotlinx.css.*
import kotlinx.html.js.onClickFunction
import react.*
import react.dom.h3
import react.dom.img
import styled.css
import styled.styledButton
import styled.styledDiv

//VideoPlayerタグのインターフェースを定義
external interface VideoPlayerProps : RProps {
    var video: Video
    var onWatchedButtonPressed: (Video) -> Unit
    var unwatchedVideo: Boolean
}

//インターフェースの実装を実装
class VideoPlayer(props: VideoPlayerProps) : RComponent<VideoPlayerProps, RState>(props) {
    override fun RBuilder.render() {
        styledDiv {
            css {
                position = Position.absolute
                top = 10.px
                right = 10.px
            }
            h3 {
                +"${props.video.speaker}: ${props.video.title}"
            }
            styledButton {
                css {
                    display = Display.block
                    backgroundColor =
                        if (props.unwatchedVideo) {
                            //まだ見ていないビデオの場合、背景色をライトグリーン
                            Color.lightGreen
                        } else {
                            //みたビデオの場合、背景色を赤
                            Color.red
                        }
                }
                attrs {
                    onClickFunction = {
                        //クリックイベントがDOMにたいして起きたとき、対象DOMにたいしてボタン押下イベントをリンキング
                        props.onWatchedButtonPressed(props.video)
                    }
                }
                if (props.unwatchedVideo) {
                    //まだ見ていないビデオの場合、ボタン押されたら、見たマークつける
                    +"Mark as watched"
                } else {
                    //見たビデオの場合、ボタン押されたら、見ていないマークつける
                    +"Mark as unwatched"
                }
            }
            img {
                attrs {
                    src = "https://via.placeholder.com/640x360.png?text=Video+Player+Placeholder"
                }
            }
        }
    }
}

//当該ファイル以外で参照できるようにメソッドとして公開 App.ktで参照している
//独自タグのexport的なのり
fun RBuilder.videoPlayer(handler: VideoPlayerProps.() -> Unit): ReactElement {
    return child(VideoPlayer::class) {
        this.attrs(handler)
    }
}