package Objects;

import java.text.DecimalFormat;
import java.util.ArrayList;

public class ShoppingCart {

    //the shopping cart will be sent books with a specified quantity whenever they need to be added to the cart, then the class
    //will be sent an integer denoting the book type that was sent. The types and integers are as follows on the next line:
    //new = 1, used = 2, rental = 3, ebook = 4. Since only one type of book can be sent at a time, only one of these
    //integers needs to be sent at a time. They will be stored in an Array in the same position as the ArrayList that 
    //the book object is in.
    private int numItemsInCart; //displays total num of items in the cart
    private boolean onlyEbook; //used to determine if shipping needs to be applied (does not with only ebooks)
    private double subtotalPrice; //tracks price without tax and shipping added
    private double totalPrice; //tracks price with shipping and tax added
    private ArrayList<Book> cart = new ArrayList<>(); //used to store Book items in the shopping cart
    private ArrayList<Integer> bookType = new ArrayList<>(); //stores the type of book at the same index as it appears in cart
    private ArrayList<Integer> quantityInCart = new ArrayList<>(); //stores the quantity in the same index as it appears in cart
    private final double tax = .07; //this is the modifier for tax
    private final double shippingCost = 15.00; //this is the flat shipping cost to be applied to any order with physical books
    DecimalFormat df = new DecimalFormat("#.00"); //for formatting the totalPrice

    public ShoppingCart() { //basic empty constructor. Creates an empty cart and sets variables to 0
        numItemsInCart = 0;
        onlyEbook = false; //default set to false to prevent basic issues
        subtotalPrice = 0;
        totalPrice = 0;
    }

    public ShoppingCart(Book a, int quantity, int type) { //constructor that allows the immediate adding of a book to the cart
        //with this constructor, the only items in the cart are the total quantity
        double tempPrice;
        switch (type) { // adds the price of the books passed to the subtotal price
            case 1:
                tempPrice = a.getNewPrice();
                subtotalPrice = tempPrice * quantity;
                break;
            case 2:
                tempPrice = a.getUsedPrice();
                subtotalPrice = tempPrice * quantity;
                break;
            case 3:
                tempPrice = a.getRentalPrice();
                subtotalPrice = tempPrice * quantity;
                break;
            case 4:
                tempPrice = a.getEbookPrice();
                subtotalPrice = tempPrice * quantity;
                break;
            //TODO: Write Exception handling here
            default:
                break;
        }
        try {
            switch (type) { //then adds the quantity to the cart if the quantity added is less than or equal to the total
                //quantity that the book object has available. If they have 9 books and you try to add 10, it
                //will not allow it.
                case 1:
                    if (quantity <= a.getNewQuantity()) {
                        cart.add(a);
                        quantityInCart.add(quantity);
                        bookType.add(type);
                        numItemsInCart += quantity;
                    } else {
                        //TODO Error message
                    }
                    break;
                case 2:
                    if (quantity <= a.getUsedQuantity()) {
                        cart.add(a);
                        quantityInCart.add(quantity);
                        bookType.add(type);
                        numItemsInCart += quantity;
                    } else {
                        //TODO Error message
                    }
                    break;
                case 3:
                    if (quantity <= a.getRentalQuantity()) {
                        cart.add(a);
                        quantityInCart.add(quantity);
                        bookType.add(type);
                        numItemsInCart += quantity;
                    } else {
                        //TODO Error message
                    }
                    break;
                case 4:
                    if (quantity <= a.getEbookQuantity()) {
                        cart.add(a);
                        quantityInCart.add(quantity);
                        bookType.add(type);
                        numItemsInCart += quantity;
                    } else {
                        //TODO Error message
                    }
                    break;
                default:
                    break;
            }
        } catch (Exception e) {
            System.out.println("Error Adding to Cart: " + e.getMessage());
        }
    }

    private void addShipping() { //adds shipping to the totalPrice
        totalPrice += shippingCost;
    }

    public Book getBook(int index) {
        Book a = cart.get(index);
        return a;
    }

    public int getBookType(int index) {
        return bookType.get(index);
    }

    public int getBookQuantity(int index) {
        return quantityInCart.get(index);
    }

    public String getSubtotal() { //returns subtotal
        String returnSubtotalPrice = df.format(subtotalPrice);
        return returnSubtotalPrice;
    }
    
    public String getCalcTax() {
        double taxPrice = subtotalPrice * tax;
        String returnTaxPrice = df.format(taxPrice);
        return returnTaxPrice;
    }

    public int getNumItemsInCart() { //returns the number of items in the shopping cart
        return numItemsInCart;
    }

    public String getTotalPrice() { //returns the total price of the items in the cart (shipping and tax included)
        calculateTotalPrice();
        String returnTotalPrice = df.format(totalPrice);
        return returnTotalPrice;
    }

    public void calculateTotalPrice() { //sets the total price based on the subtotal and then if there are only ebooks,
        //it skips adding shipping, if there are physical books it adds shipping.
        if (checkForOnlyEbooks()) {
            totalPrice = subtotalPrice + (subtotalPrice * tax);
        } else {
            totalPrice = subtotalPrice + ((subtotalPrice) * tax + shippingCost);
        }
    }

    public double getShipping() {
        double returnShipping;
        if(checkForOnlyEbooks() != true) {
            returnShipping = shippingCost;
            return returnShipping;
        } else {
            returnShipping = 0;
            return returnShipping;
        }
    }

    public boolean checkForOnlyEbooks() {
        //This method scans the bookTypes array, looking for any instances of ebooks values (4),
        //and if it finds any books that are not ebooks, it will return false, if all books in the cart are ebooks,
        //the method will return true.
        int checkingForEbooks;
        for (int i = 0; i < cart.size(); i++) {
            checkingForEbooks = bookType.get(i);
            if (checkingForEbooks != 4) {
                return false;
            }
        }
        return true;
    }

    public void addToCart(Book newBook, int quantity, int type) {
        //adds the book passed to the method to the end of the array list. Will by default add one book,
        //but can add as many books as specified. This will also check to see if the book is an ebook,
        // and will adjust the shipping if needed.
        double tempPrice;
        try {
            switch (type) {
                case 1:
                    if (quantity <= newBook.getNewQuantity()) {
                        cart.add(newBook);
                        quantityInCart.add(quantity);
                        bookType.add(type);
                        numItemsInCart += quantity;
                        tempPrice = newBook.getNewPrice();
                        subtotalPrice += tempPrice * quantity;
                    } else {
                        //TODO Error message
                    }
                    break;
                case 2:
                    if (quantity <= newBook.getUsedQuantity()) {
                        cart.add(newBook);
                        quantityInCart.add(quantity);
                        bookType.add(type);
                        numItemsInCart += quantity;
                        tempPrice = newBook.getUsedPrice();
                        subtotalPrice += tempPrice * quantity;
                    } else {
                        //TODO Error message
                    }
                    break;
                case 3:
                    if (quantity <= newBook.getRentalQuantity()) {
                        cart.add(newBook);
                        quantityInCart.add(quantity);
                        bookType.add(type);
                        numItemsInCart += quantity;
                        tempPrice = newBook.getRentalPrice();
                        subtotalPrice += tempPrice * quantity;
                    } else {
                        //TODO Error message
                    }
                    break;
                case 4:
                    if (quantity <= newBook.getEbookQuantity()) {
                        cart.add(newBook);
                        quantityInCart.add(quantity);
                        bookType.add(type);
                        numItemsInCart += quantity;
                        tempPrice = newBook.getEbookPrice();
                        subtotalPrice += tempPrice * quantity;
                    } else {
                        //TODO Error message
                    }
                    break;
                default:
                    break;
            }
        } catch (Exception e) {
            System.out.println("Error Adding to Cart: " + e.getMessage());
        }
    }

    public void removeFromCart(String ISBN, int type) {
        //ISBN sent must be type String, and type is 1 = new, 2 = used, 3 = rental, 4 = ebook
        //deletes the book from the cart if the book in the cart is of the same type (ebook, rental, etc.)
        Book a;
        String bookISBN;
        int tempType;
        double tempPrice;
        try {
            for (int i = 0; i < cart.size(); i++) { //iterates through cart
                a = cart.get(i);
                bookISBN = a.getIsbnForCovers();
                if (bookISBN.equals(ISBN)) { //checks to see if the book in the cart is the one it's looking for
                    if (bookType.get(i) == type) { //checks to see if the found book is also the same type as the one it's looking for
                        switch (type) { //this is all for the price tracking with the different types.
                            case 1:
                                tempPrice = a.getNewPrice();
                                subtotalPrice -= tempPrice * quantityInCart.get(i);
                                break;
                            case 2:
                                tempPrice = a.getUsedPrice();
                                subtotalPrice -= tempPrice * quantityInCart.get(i);
                                break;
                            case 3:
                                tempPrice = a.getRentalPrice();
                                subtotalPrice -= tempPrice * quantityInCart.get(i);
                                break;
                            case 4:
                                tempPrice = a.getEbookPrice();
                                subtotalPrice -= tempPrice * quantityInCart.get(i);
                                break;
                            //TODO: Write Exception handling here
                            default:
                                break;
                        }
                        cart.remove(i); //remove book from cart
                        bookType.remove(i); //remove the type from the same index
                        numItemsInCart -= quantityInCart.get(i);
                        quantityInCart.remove(i); //remove the quantity of that book from the same index
                    }
                }
            }
        } catch (Exception e) {
            System.out.println("Error Removing from Cart: " + e.getMessage());
        }
    }

    public void updateCart(String isbn, int newQuantity, int type) { //updates the quantity of a book in the cart

        int changeInQuantity;
        Book a;
        String tempIsbn;
        double tempPrice;

        try {
            for (int i = 0; i < cart.size(); i++) { //iterates through the cart

                a = cart.get(i);
                tempIsbn = a.getIsbnForCovers();

                if (isbn.equals(tempIsbn)) { //looks for the specific book in the array
                    if (bookType.get(i) == type) { //then makes sure the book in the cart is the same type as the book it's looking for (ebook, rental, etc.)
                        switch (type) { //switch for all the different book types
                            case 1: //new
                                if (a.getNewQuantity() >= newQuantity && newQuantity > 0) {
                                    changeInQuantity = newQuantity - quantityInCart.get(i);
                                    quantityInCart.set(i, newQuantity);
                                    numItemsInCart += changeInQuantity;
                                    tempPrice = a.getNewPrice();
                                    subtotalPrice += changeInQuantity * tempPrice;
                                } else {
                                    System.out.println("Unable to add book to cart, new quantity is invalid. Please select a number at or below " + a.getNewQuantity());
                                }
                                break;
                            case 2: //used
                                if (a.getUsedQuantity() >= newQuantity && newQuantity > 0) {
                                    changeInQuantity = newQuantity - quantityInCart.get(i);
                                    quantityInCart.set(i, newQuantity);
                                    numItemsInCart += changeInQuantity;
                                    tempPrice = a.getUsedPrice();
                                    subtotalPrice += changeInQuantity * tempPrice;
                                } else {
                                    System.out.println("Unable to add book to cart, new quantity is invalid. Please select a number at or below " + a.getUsedQuantity());
                                }
                                break;
                            case 3: //rental
                                if (a.getRentalQuantity() >= newQuantity && newQuantity > 0) {
                                    changeInQuantity = newQuantity - quantityInCart.get(i);
                                    quantityInCart.set(i, newQuantity);
                                    numItemsInCart += changeInQuantity;
                                    tempPrice = a.getRentalPrice();
                                    subtotalPrice += changeInQuantity * tempPrice;
                                } else {
                                    System.out.println("Unable to add book to cart, new quantity is invalid. Please select a number at or below " + a.getRentalQuantity());
                                }
                                break;
                            case 4: //ebook
                                if (a.getEbookQuantity() >= newQuantity && newQuantity > 0) {
                                    changeInQuantity = newQuantity - quantityInCart.get(i);
                                    quantityInCart.set(i, newQuantity);
                                    numItemsInCart += changeInQuantity;
                                    tempPrice = a.getEbookPrice();
                                    subtotalPrice += changeInQuantity * tempPrice;
                                } else {
                                    System.out.println("Unable to add book to cart, new quantity is invalid. Please select a number at or below " + a.getEbookQuantity());
                                }
                                break;
                            default: //do nothing
                                break;
                        }
                    }
                }
            }
        } catch (Exception e) {
            System.out.println("Error Updating Cart: " + e.getMessage());
        }
    }

    public int size() { //returns size of cart array, numItemsInCart DOES NOT work for this
        return cart.size();
    }
}

//Programmed by: Adam Hayes
//Originally Created: April 2nd, 2017
//First Revision: April 6th, 2017
//Second Revision: April 8th, 2017
//Third Revision: April 15th, 2017
//Fourth Revision: April 22nd, 2017
