import kotlinx.html.js.onClickFunction
import react.*
import react.dom.p

//VideoListの独自タグにプロパティ設定と状態管理を実現させるため、interfaceを定義し、クラスにそれらを継承させる。
//.ktではMain.kt以外のktファイルで参照する変数等を定義する。

//タグに対するイベント定義などを設定管理する

external interface VideoListProps: RProps {
    var videos: List<Video>
}

external interface VideoListState: RState {
    var selectedVideo: Video?
}

class VideoList: RComponent<VideoListProps, VideoListState>() {
    override fun RBuilder.render() {
        for (video in props.videos) {
            p {
                key = video.id.toString()
                attrs {
                    onClickFunction = {
                        setState {
                            selectedVideo = video
                        }
                    }
                }
                if(video == state.selectedVideo) {
                    +"▶ "
                }
                +"${video.speaker}: ${video.title}"
            }
        }
    }
}

//当該ファイル以外で参照できるようにメソッドとして公開 App.ktで参照している
fun RBuilder.videoList(handler: VideoListProps.() -> Unit): ReactElement {
    return child(VideoList::class) {
        this.attrs(handler)
    }
}