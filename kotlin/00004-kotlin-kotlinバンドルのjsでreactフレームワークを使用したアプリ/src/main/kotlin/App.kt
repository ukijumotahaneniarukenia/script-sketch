import react.*
import react.dom.div
import react.dom.h1
import react.dom.h3

//RStateを継承しておくと、変数の一元管理ができる
external interface AppState : RState {
    var currentVideo: Video? //0件 ないし 1件という意味ではてなマーク。未選択状態と単一選択状態を表現している
    var unwatchedVideos: List<Video>
    var watchedVideos: List<Video>
}

//定義したインターフェースを継承するように修正
class App : RComponent<RProps, AppState>() {

    //初期表示イベント
    //データなどを設定
    override fun AppState.init() {
        unwatchedVideos = listOf(
            Video(1, "Building and breaking things", "John Doe", "https://youtu.be/PsaFVLr8t4E"),
            Video(2, "The development process", "Jane Smith", "https://youtu.be/PsaFVLr8t4E"),
            Video(3, "The Web 7.0", "Matt Miller", "https://youtu.be/PsaFVLr8t4E")
        )
        watchedVideos = listOf(
            Video(4, "Mouseless development", "Tom Jerry", "https://youtu.be/PsaFVLr8t4E")
        )
    }

    override fun RBuilder.render() {
        h1 {
            +"KotlinConf Explorer"
        }
        div {
            h3 {
                +"Videos to watch" //まだ見ていないリスト
            }
            videoList {
                videos = state.unwatchedVideos
                selectedVideo = state.currentVideo
                onSelectVideo = { video -> //独自タグクラスで設定したイベント定義をsetState関数経由で設定 -->イベント定義はsetState関数経由で設定
                    setState {
                        currentVideo = video
                    }
                }
            }

            h3 {
                +"Videos watched" //見たリスト
            }
            videoList {
                videos = state.watchedVideos
                selectedVideo = state.currentVideo
                onSelectVideo = { video -> //独自タグクラスで設定したイベント定義をsetState関数経由で設定 -->イベント定義はsetState関数経由で設定
                    //ラムダ式でかけるところがメリット
                    setState {
                        currentVideo = video
                    }
                }
            }
        }

        //letで呼ばれるのはcurrentVideo変数に値が設定されていたら、その意味ではてなまーくがついている
        state.currentVideo?.let { currentVideo ->
            //ラムダ式でかけるところがメリット
            videoPlayer {
                video = currentVideo //仮引数を管理変数へ再定義
                unwatchedVideo = currentVideo in state.unwatchedVideos
                onWatchedButtonPressed = {
                    if (video in state.unwatchedVideos) {
                        //クリック対象のビデオがまだ見ていないビデオリストに含まれていた場合
                        setState {
                            unwatchedVideos -= video //まだ見ていないリストから対象のビデオを削除し、
                            watchedVideos += video //見たリストに対象のビデオを追加する
                        }
                    } else {
                        //クリック対象のビデオが見たリストに含まれている場合
                        setState {
                            watchedVideos -= video //見たリストから対象ビデオを削除し、
                            unwatchedVideos += video //まだ見ていないリストに対象ビデオを追加する
                        }
                    }
                }
            }
        }
    }
}