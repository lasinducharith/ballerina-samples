package structs;

public struct Order {
    int number;
    OrderItem[] orderItems;
}

public struct OrderItem {
    DrinkType drinkType;
    int shots;
    boolean iced = false;
    int orderNumber;

}

public struct Delivery {
    int orderNumber;
    Drink[] deliveredDrinks;
}

public struct Drink {
    boolean iced;
    int shots;
    int orderNumber;
    DrinkType drinkType;
}

public enum DrinkType {
    ESPRESSO,
    LATTE,
    CAPPUCCINO,
    MOCHA
}