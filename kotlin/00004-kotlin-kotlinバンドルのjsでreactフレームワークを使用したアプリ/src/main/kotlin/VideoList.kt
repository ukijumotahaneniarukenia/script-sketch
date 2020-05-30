import kotlinx.html.js.onClickFunction
import react.*
import react.dom.p

//独自タグに対するイベント定義などを設定管理する

//VideoListの独自タグにプロパティ設定と状態管理を実現させるため、interfaceを定義し、クラスにそれらを継承させる。
//.ktではMain.kt以外のktファイルで参照する変数等を定義する。


//VideoListの独自タグにプロパティ設定と状態管理を単一のインターフェースで管理するように修正
external interface VideoListProps: RProps {
    var videos: List<Video>
    var selectedVideo: Video?
    var onSelectVideo: (Video) -> Unit //再生する際のビデオを単一に決定するためのファンクションを定義
}

//インターフェースの実装を定義
class VideoList: RComponent<VideoListProps,RState>() {
    override fun RBuilder.render() {
        for (video in props.videos) {
            p {
                key = video.id.toString()
                attrs {
                    onClickFunction = {//クリックイベントを定義
                        //クリックされたとき選択済みの状態にする
                        props.onSelectVideo(video)
                    }
                }
                if(video == props.selectedVideo) {
                    //選択済みのタグである場合、目印つける
                    +"▶ " //選択済みの目印
                }
                //各リストのレンダリング
                +"${video.speaker}: ${video.title}"
            }
        }
    }
}

//当該ファイル以外で参照できるようにメソッドとして公開 App.ktで参照している
//独自タグのexport的なのり
fun RBuilder.videoList(handler: VideoListProps.() -> Unit): ReactElement {
    return child(VideoList::class) {
        this.attrs(handler)
    }
}