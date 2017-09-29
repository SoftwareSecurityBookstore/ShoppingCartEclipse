package ShoppingCart;

import Objects.Book;
import Objects.ShoppingCart;

public class unitTest {
    public static void main(String[] args) {

        String isbn;
        String[] authors = new String[2];
        authors[0] = "James Earl"; 
        authors[1] = "Jimmy Hendrix";
        isbn = "978-0073376356";
        Book test1 = new Book();
        test1.setIsbnForCovers(isbn);
        test1.setBookName("Chemistry");
        test1.setAuthor(authors);
        test1.setSemester("Fall");
        test1.setCourse("SWE 3313");
        test1.setSection(61);
        test1.setProfessor("Lartigue");
        test1.setCrn(22456);
        test1.setNewQuantity(30);
        test1.setUsedQuantity(10);
        test1.setRentalQuantity(20);
        test1.setEbookQuantity(999999);
        test1.setNewPrice(123.12);
        test1.setUsedPrice(70.31);
        test1.setRentalPrice(55.31);
        test1.setEbookPrice(67.93);
        test1.setDescription("This is a textbook for Chemistry! Apparently also SWE 3313 lol");
        
        ShoppingCart cart = new ShoppingCart(test1, 12, 1);
        cart.addToCart(test1, 4, 2);
        cart.addToCart(test1, 1, 4);
        cart.addToCart(test1, 1, 3);
        System.out.println("Num Items In Cart: " + cart.getNumItemsInCart());
        System.out.println("Only Ebooks? " + cart.checkForOnlyEbooks());
        System.out.println("Subtotal : " + cart.getSubtotal());
        System.out.println("Total Price with Shipping: " + cart.getTotalPrice());
        
        cart.removeFromCart(isbn, 1);
        cart.removeFromCart(isbn, 2);
        cart.removeFromCart(isbn, 3);
        System.out.println("Only Ebooks? " + cart.checkForOnlyEbooks());
        System.out.println("Num Items In Cart: " + cart.getNumItemsInCart());
        System.out.println("Subtotal : " + cart.getSubtotal());
        System.out.println("Total Price with Shipping and Tax: " + cart.getTotalPrice());
        
        cart.addToCart(test1, 7, 2);
        System.out.println("Num Items In Cart: " + cart.getNumItemsInCart());
        System.out.println("Subtotal Price: " + cart.getSubtotal());
        cart.updateCart(isbn, 10, 2);
        System.out.println("Num Items In Cart: " + cart.getNumItemsInCart());
        System.out.println("Subtotal Price: " + cart.getSubtotal());
        
    }
}