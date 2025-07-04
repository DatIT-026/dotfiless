import java.util.Scanner;

interface IPolymorphism {
  int f1(String str);
  int f2(String str); 
}

class MyPolymorphism implements IPolymorphism {
 
 @Override
 public int f1(String str) {
   if (str == null || str.isEmpty()) return 0;

   int count = 0;
   for (char ch : str.toCharArray()) if (Character.isLetter(ch)) count++;      
   return count;
 }

 @Override 
 public int f2(String str) {
   if(str == null || str.isEmpty()) return 0;
   try {
      int num = Integer.parseInt(str.trim());
      return num * num;
   } catch (Exception e) {
     return str.length();
   }
  }
}

public class Main {
 public static void main(String[] args) {
  MyPolymorphism polyme = new MyPolymorphism();
  byte choice = 0;
   
  Scanner sc = new Scanner(System.in);

  while(true) {
    System.out.println("1. Test f1()");
    System.out.println("2. Test f2()");
    System.out.print("Enter TC (1 or 2): ");

    choice = sc.nextByte();
    sc.nextLine();   

    if(choice == 1 || choice == 2) break;
     else System.out.println("Invalid Input!\n");
    
    continue;
  }

    System.out.println("Enter a string:");
    String stringInput = sc.nextLine();

    if(choice == 1) {  
        int resultf1 = polyme.f1(stringInput);
        System.out.println("OUTPUT:");
        System.out.println(resultf1);
    } else if (choice == 2) {
        int resultf2 = polyme.f2(stringInput);
        System.out.println("OUTPUT:");
        System.out.println(resultf2);
    } 
  }
}
