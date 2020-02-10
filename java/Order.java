public class Order {
    private Integer order_id;
    private String item;
    private Integer qty;

    public Order(Integer order_id, String item, Integer qty) {
        this.order_id = order_id;
        this.item = item;
        this.qty = qty;
    }

    public Integer getOrder_id() {
        return order_id;
    }

    public void setOrder_id(Integer order_id) {
        this.order_id = order_id;
    }

    public String getItem() {
        return item;
    }

    public void setItem(String item) {
        this.item = item;
    }

    public Integer getQty() {
        return qty;
    }

    public void setQty(Integer qty) {
        this.qty = qty;
    }
}
