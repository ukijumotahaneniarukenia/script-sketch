var stompClient = null;

function setConnected(connected) {
	$("#connect").prop("disabled", connected);
	$("#disconnect").prop("disabled", !connected);
	if (connected) {
		$("#conversation").show();
	} else {
		$("#conversation").hide();
	}
	$("#greetings").html("");
}

/**
connect() 関数は、SockJS (GitHub)  と stomp.js (英語)  を使用して、SockJS サーバーが接続を待機する /gs-guide-websocket への接続を開きます。
接続が成功すると、クライアントは /topic/greetings 宛先にサブスクライブし、サーバーはグリーティングメッセージを発行します。
その宛先でグリーティングが受信されると、DOM に段落要素が追加され、グリーティングメッセージが表示されます。
**/

function connect() {
	var socket = new SockJS('/gs-guide-websocket');
	stompClient = Stomp.over(socket);
	stompClient.connect({}, function(frame) {
		setConnected(true);
		console.log('Connected: ' + frame);
		stompClient.subscribe('/topic/greetings', function(greeting) {
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
sendName() 関数は、ユーザーが入力した名前を取得し、STOMP クライアントを使用して /app/hello 宛先（GreetingController.greeting() が受信する）に送信します。
 */

function sendName() {
	stompClient.send("/app/hello", {}, JSON.stringify({
		'name' : $("#name").val()
	}));
}

function showGreeting(message) {
	$("#greetings").append("<tr><td>" + message + "</td></tr>");
}

//ページロード時のイベント定義
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