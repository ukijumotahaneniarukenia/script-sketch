import java.util.ArrayList;
import java.util.List;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
    "book",
    "bicycle"
})
public class Store {

    @JsonProperty("book")
    private List<Book> book = new ArrayList<Book>();
    @JsonProperty("bicycle")
    private Bicycle bicycle;

    @JsonProperty("book")
    public List<Book> getBook() {
        return book;
    }

    @JsonProperty("book")
    public void setBook(List<Book> book) {
        this.book = book;
    }

    @JsonProperty("bicycle")
    public Bicycle getBicycle() {
        return bicycle;
    }

    @JsonProperty("bicycle")
    public void setBicycle(Bicycle bicycle) {
        this.bicycle = bicycle;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(Store.class.getName()).append('@').append(Integer.toHexString(System.identityHashCode(this))).append('[');
        sb.append("book");
        sb.append('=');
        sb.append(((this.book == null)?"<null>":this.book));
        sb.append(',');
        sb.append("bicycle");
        sb.append('=');
        sb.append(((this.bicycle == null)?"<null>":this.bicycle));
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
        result = ((result* 31)+((this.bicycle == null)? 0 :this.bicycle.hashCode()));
        result = ((result* 31)+((this.book == null)? 0 :this.book.hashCode()));
        return result;
    }

    @Override
    public boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if ((other instanceof Store) == false) {
            return false;
        }
        Store rhs = ((Store) other);
        return (((this.bicycle == rhs.bicycle)||((this.bicycle!= null)&&this.bicycle.equals(rhs.bicycle)))&&((this.book == rhs.book)||((this.book!= null)&&this.book.equals(rhs.book))));
    }

}
