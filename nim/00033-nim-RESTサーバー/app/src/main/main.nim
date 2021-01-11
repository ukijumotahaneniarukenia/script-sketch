import jester
import strformat

router unko_router:
  get "/say_unko":
    var name = request.params["name"]
    echo name
    resp fmt"うんこ,{name}"


var
  port = Port(5000)
  setting = newSettings(port=port)
  server = initJester(unko_router, setting)
server.serve()
