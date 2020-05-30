import react.dom.*
import kotlin.browser.document

fun main() {
//    document.bgColor = "blue"
    render(document.getElementById("root")){
        h1 {
            + "へろーワールド。React + Kotlin JS!💩"
        }
        h2 {
            + "へろーワールド。React + Kotlin JS!\uD83D\uDCA9\uD83D\uDCA9"
        }
        h3 {
            + "へろーワールド。React + Kotlin JS!\uD83D\uDCA9\uD83D\uDCA9"
        }
        h4 {
            + "へろーワールド。React + Kotlin JS!\uD83D\uDCA9"
            + "へろーワールド。React + Kotlin JS!\uD83D\uDCA9"
            + "へろーワールド。React + Kotlin JS!\uD83D\uDCA9"
            + "へろーワールド。React + Kotlin JS!\uD83D\uDCA9"
        }
        h5 {
            + "へろーワールド。React + Kotlin JS!💩"
        }
    }

}