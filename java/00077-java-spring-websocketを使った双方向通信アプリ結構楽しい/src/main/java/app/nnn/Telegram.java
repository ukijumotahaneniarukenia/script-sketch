package app.nnn;

public class Telegram {

	private String content;

	// 引数なしのコンストラクタが必要
	public Telegram() {
	}

	public Telegram(String content) {
		this.content = content;
	}

	public String getContent() {
		return content;
	}

}
