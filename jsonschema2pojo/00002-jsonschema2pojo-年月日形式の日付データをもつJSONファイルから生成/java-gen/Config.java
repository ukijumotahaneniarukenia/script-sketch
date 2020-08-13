import java.util.Date;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;


/**
 * Document
 * 
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
    "dtm"
})
public class Config {

    @JsonProperty("dtm")
    private Date dtm;

    @JsonProperty("dtm")
    public Date getDtm() {
        return dtm;
    }

    @JsonProperty("dtm")
    public void setDtm(Date dtm) {
        this.dtm = dtm;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(Config.class.getName()).append('@').append(Integer.toHexString(System.identityHashCode(this))).append('[');
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
        if ((other instanceof Config) == false) {
            return false;
        }
        Config rhs = ((Config) other);
        return ((this.dtm == rhs.dtm)||((this.dtm!= null)&&this.dtm.equals(rhs.dtm)));
    }

}
