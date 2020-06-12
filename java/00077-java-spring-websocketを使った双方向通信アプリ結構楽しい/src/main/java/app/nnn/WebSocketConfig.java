package app.nnn;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker //@EnableWebSocketMessageBroker は WebSocket メッセージ処理を有効にし、メッセージブローカーによって支援されます。
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

	@Override
	public void configureMessageBroker(MessageBrokerRegistry config) {
		config.enableSimpleBroker("/topic"); //WebSocketMessageBrokerConfigurer のデフォルトメソッドを実装して、メッセージブローカーを構成します。まず、enableSimpleBroker() を呼び出して、単純なメモリベースのメッセージブローカーが、/topic をプレフィックスとして持つ宛先でクライアントにグリーティングメッセージを戻すことができるようにします。
		config.setApplicationDestinationPrefixes("/app"); //MessageMapping アノテーションが付けられたメソッドにバインドされているメッセージの /app プレフィックスも指定します。このプレフィックスは、すべてのメッセージマッピングを定義するために使用されます。例： /app/hello は、GreetingController.greeting() メソッドが処理するためにマップされるエンドポイントです。
	}

	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		registry.addEndpoint("/gs-guide-websocket").withSockJS(); //registerStompEndpoints() メソッドは /gs-guide-websocket エンドポイントを登録し、WebSocket が使用できない場合に代替トランスポートを使用できるように SockJS フォールバックオプションを有効にします。SockJS クライアントは、/gs-guide-websocket への接続を試み、利用可能な最適なトランスポート（websocket、xhr-streaming、xhr-polling など）の使用を試みます。
	}

}