package app.nnn;

public class Who {
	private String name;

	//引数なしのコンストラクタが必要
	public Who() {
	}

	//フィールドを設定するコンストラクタが必要
	public Who(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
