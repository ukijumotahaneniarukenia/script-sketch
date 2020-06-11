package app.nnn;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class NnnApplication {

	public static void main(String[] args) {
		SpringApplication.run(NnnApplication.class, args);
	}

	private static final String getFormHtml() {
		return "<p>リクエストを送信する</p>\n" + 
				"    <form action=\"receive\" method=\"post\">\n" + 
				"        User: <input type=\"text\" name=\"user\" size=\"20\"><br />\n" + 
				"        Password: <input type=\"text\" name=\"password\" size=\"20\"><br />\n" + 
				"        <input type=\"submit\" value=\"Login\">\n" + 
				"    </form>";
	}
	
	private static final String showIndexPage() {
		return "<p>ログインしました</p>"+
				"<a href=\"./index.html\">インデックスページへ移動する</a>";
	}
	
	@PostMapping("/receive")
	public String receive(@RequestBody String body) {
		System.out.println(body); //user=aine&password=aine%E3%81%AE%E3%83%91%E3%82%B9%E3%83%AF%E3%83%BC%E3%83%89
		
		//疑似セッションIDを生成
		
		System.out.println(RandomStringUtils.randomAscii(32)); //echo "b?30A,ql!&dM"V@a?Eu;Mz2b0uL@9!(S" | awk '{print length($0)}'
		
		//ユーザー情報とセッションIDを渡してインデックスページを表示
		return showIndexPage();
		
	}
	
	@GetMapping("/login")
	public String login() {
		return getFormHtml();
	}
	
}