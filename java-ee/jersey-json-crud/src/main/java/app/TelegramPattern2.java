package main.java.app;

import javax.json.bind.annotation.JsonbCreator;
import javax.json.bind.annotation.JsonbProperty;
import java.util.List;

public class TelegramPattern2 {
    private Integer grp;
    private List<Integer> id;

    @JsonbCreator
    public TelegramPattern2(@JsonbProperty("grp") Integer grp, @JsonbProperty("id") List<Integer> id) {
        this.setGrp(grp);
        this.setId(id);
    }

    public Integer getGrp() {
        return grp;
    }

    public void setGrp(Integer grp) {
        this.grp = grp;
    }

    public List<Integer> getId() {
        return id;
    }

    public void setId(List<Integer> id) {
        this.id = id;
    }
}
