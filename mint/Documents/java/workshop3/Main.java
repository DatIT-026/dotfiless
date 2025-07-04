package workshop3;

import java.util.Scanner;

public class Main {
   public static void main(String[] args) {
       Scanner input = new Scanner(System.in);
       Item o = new Item();
       
       System.out.print("Enter name: ");
       String name = input.nextLine();
       o.setName(name);
       
       System.out.print("Enter quantity: ");
       while (!input.hasNextInt()) {
          System.out.print("Please enter a valid integer for quantity.");
          input.next();
       }
       int quantity = input.nextInt();
       o.setQuantity(quantity);
       
       System.out.println("1. Test getName()");
       System.out.println("2. Test setQuantity()");

       System.out.print("Enter TC (1 or 2): ");
       while (!input.hasNextByte()) {
          System.out.print("Please enter '1' or '2': ");
          input.next();
       }
       
       byte choice = input.nextByte();
       
       if (choice == 1) {
             System.out.println("OUTPUT:");
             System.out.println(o.getName());
          }
          else if (choice == 2) {
             System.out.print("Enter new quantity: ");
             while (!input.hasNextInt()) {
                System.out.print("Please enter a valid integer: ");
                input.next();
             }
             
             int newQuantity = input.nextInt();
             o.setQuantity(newQuantity);

             System.out.println("OUTPUT:");
             System.out.println(o.getQuantity());
          } else System.out.println("Invalid Input!");

          input.close();
   }
}
