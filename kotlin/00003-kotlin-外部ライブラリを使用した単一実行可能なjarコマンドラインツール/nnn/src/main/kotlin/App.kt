import com.google.gson.Gson
import com.google.gson.JsonElement


fun main(args : Array<String>) {
    println("うんこ")

    val jsonStr = "{\"name\" : \"Abcd\", \"greeting\": \"Hello\"}"

    val gson = Gson()

    val element = gson.fromJson(jsonStr, JsonElement::class.java)

    val jsonObj = element.asJsonObject

    println(jsonObj)

    val name = jsonObj.get("name").asString

    println(name)

    val greeting = jsonObj.get("greeting").asString

    println(greeting)


}