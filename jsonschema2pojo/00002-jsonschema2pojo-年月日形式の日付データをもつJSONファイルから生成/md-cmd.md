- IN

```
$ seq 10 | xargs -I@ date "+%Y-%m-%d" -d "@ days" | jq -R -s './"\n"|map(select(""!=.))|{"dtm":.}'  >01.json

$ cat 01.json
{
  "dtm": [
    "2020-08-15",
    "2020-08-16",
    "2020-08-17",
    "2020-08-18",
    "2020-08-19",
    "2020-08-20",
    "2020-08-21",
    "2020-08-22",
    "2020-08-23",
    "2020-08-24"
  ]
}
```


- CMD

```
$ jsonschema2pojo -s 01.json -t . -T JSON
```



- OUT

  - 文字列としてハンドリングされている

  - 設定ファイルを引数に与えてコマンドラインから指定して生成したい人生だった

  - java IDE立ち上げる必要あるぽいが日付文字列のパタンとJavaのパタンがわかればsedなどで置換し、import文追加すればいけそう

  - 今ぱっとおもいつかん

```
$ ls
01.json  _01.java  md-cmd.md


$ cat _01.java 
import java.util.ArrayList;
import java.util.List;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
    "dtm"
})
public class _01 {

    @JsonProperty("dtm")
    private List<String> dtm = new ArrayList<String>();

    @JsonProperty("dtm")
    public List<String> getDtm() {
        return dtm;
    }

    @JsonProperty("dtm")
    public void setDtm(List<String> dtm) {
        this.dtm = dtm;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(_01 .class.getName()).append('@').append(Integer.toHexString(System.identityHashCode(this))).append('[');
        sb.append("dtm");
        sb.append('=');
        sb.append(((this.dtm == null)?"<null>":this.dtm));
        sb.append(',');
        if (sb.charAt((sb.length()- 1)) == ',') {
            sb.setCharAt((sb.length()- 1), ']');
        } else {
            sb.append(']');
        }
        return sb.toString();
    }

    @Override
    public int hashCode() {
        int result = 1;
        result = ((result* 31)+((this.dtm == null)? 0 :this.dtm.hashCode()));
        return result;
    }

    @Override
    public boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if ((other instanceof _01) == false) {
            return false;
        }
        _01 rhs = ((_01) other);
        return ((this.dtm == rhs.dtm)||((this.dtm!= null)&&this.dtm.equals(rhs.dtm)));
    }

}
```
