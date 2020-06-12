package app.nnn;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.util.HtmlUtils;

@Controller
public class AppController {
	@MessageMapping("/hello") // メッセージが /hello 宛先に送信された場合、greeting() メソッドが呼び出されることを保証します。
	@SendTo("/topic/greetings") //レスポンス先
	public Telegram greeting(Who message) throws Exception { // メッセージのペイロードは HelloMessage オブジェクトにバインドされ、greeting()
																// に渡されます。
		Thread.sleep(1000); // simulated delay
							// //クライアントがメッセージを送信した後、サーバーが非同期にメッセージを処理する必要がある限り、処理できることを示すためです。

		// 入力メッセージからの名前はサニタイズされることに注意してください。この場合、クライアント側のブラウザ DOM
		// でエコーバックされて再レンダリングされるためです。
		return new Telegram("Hello, " + HtmlUtils.htmlEscape(message.getName()) + "!"); // 戻り値は、@SendTo(Javadoc)
																						// アノテーションで指定されている
																						// /topic/greetings
																						// のすべてのサブスクライバーにブロードキャストされます
	}
}
