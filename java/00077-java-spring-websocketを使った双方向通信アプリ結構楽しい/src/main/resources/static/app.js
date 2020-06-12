var stompClient = null;

function setConnected(connected) {
	$("#connect").prop("disabled", connected); // 接続されたら無効化
	$("#disconnect").prop("disabled", !connected); // 接続解除されたら無効化
	if (connected) {
		$("#conversation").show(); // 接続されたらメッセージ表示
	} else {
		$("#conversation").hide(); // 接続されたらメッセージ非表示
	}
	$("#greetings").html("");// 接続時直前までのメッセージはすべて初期化してクリア
}

/**
 * connect() 関数は、SockJS (GitHub) と stomp.js (英語) を使用して、SockJS サーバーが接続を待機する
 * /gs-guide-websocket への接続を開きます。 接続が成功すると、クライアントは /topic/greetings
 * 宛先にサブスクライブし、サーバーはグリーティングメッセージを発行します。 その宛先でグリーティングが受信されると、DOM
 * に段落要素が追加され、グリーティングメッセージが表示されます。
 */

function connect() {
	var socket = new SockJS('/gs-guide-websocket');
	stompClient = Stomp.over(socket); // stompクライアントを作成
	stompClient.connect({}, function(frame) {
		setConnected(true);
		console.log('Connected: ' + frame);
		stompClient.subscribe('/topic/greetings', function(greeting) { //待受状態で、レスポンス来たら、反応してHTTPのコンテンツを文字列からjson形式に変換してDOM化し、ブラウザにレンダラdelegate（処理依頼）
			showGreeting(JSON.parse(greeting.body).content);
		});
	});
}

function disconnect() {
	if (stompClient !== null) {
		stompClient.disconnect();
	}
	setConnected(false);
	console.log("Disconnected");
}

/**
 * 
 * sendName() 関数は、ユーザーが入力した名前を取得し、STOMP クライアントを使用して /app/hello
 * 宛先（GreetingController.greeting() が受信する）に送信します。
 */

function sendName() {
	
	//リクエストの発行
	
	stompClient.send("/app/hello", {}, JSON.stringify({
		'name' : $("#name").val()
	}));
}

function showGreeting(message) {
	$("#greetings").append("<tr><td>" + message + "</td></tr>");
}

// ページロード時のイベント定義
$(function() {
	$("form").on('submit', function(e) {
		e.preventDefault();
	});
	$("#connect").click(function() {
		connect();
	});
	$("#disconnect").click(function() {
		disconnect();
	});
	$("#send").click(function() {
		sendName();
	});
});
