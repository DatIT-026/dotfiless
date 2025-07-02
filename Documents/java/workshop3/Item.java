package workshop3;

public class Item {
   private String name;
   private int quantity;

   public Item() {
      this.name = "";
      this.quantity = 0;
   }
   
   public Item(String name, int quantity) {
      this.name = name;
      this.quantity = quantity;
   }

   public String getName() {
      return name.toUpperCase();
   }

   public void setName(String name) {
      this.name = name;
   }

   public int getQuantity() {
      return quantity;
   }

   public void setQuantity(int quantity) {
      this.quantity = quantity;
   }
}
