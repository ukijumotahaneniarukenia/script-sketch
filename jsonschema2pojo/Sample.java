import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
    "store",
    "expensive"
})
public class Sample {

    @JsonProperty("store")
    private Store store;
    @JsonProperty("expensive")
    private Integer expensive;

    @JsonProperty("store")
    public Store getStore() {
        return store;
    }

    @JsonProperty("store")
    public void setStore(Store store) {
        this.store = store;
    }

    @JsonProperty("expensive")
    public Integer getExpensive() {
        return expensive;
    }

    @JsonProperty("expensive")
    public void setExpensive(Integer expensive) {
        this.expensive = expensive;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(Sample.class.getName()).append('@').append(Integer.toHexString(System.identityHashCode(this))).append('[');
        sb.append("store");
        sb.append('=');
        sb.append(((this.store == null)?"<null>":this.store));
        sb.append(',');
        sb.append("expensive");
        sb.append('=');
        sb.append(((this.expensive == null)?"<null>":this.expensive));
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
        result = ((result* 31)+((this.store == null)? 0 :this.store.hashCode()));
        result = ((result* 31)+((this.expensive == null)? 0 :this.expensive.hashCode()));
        return result;
    }

    @Override
    public boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if ((other instanceof Sample) == false) {
            return false;
        }
        Sample rhs = ((Sample) other);
        return (((this.store == rhs.store)||((this.store!= null)&&this.store.equals(rhs.store)))&&((this.expensive == rhs.expensive)||((this.expensive!= null)&&this.expensive.equals(rhs.expensive))));
    }

}
