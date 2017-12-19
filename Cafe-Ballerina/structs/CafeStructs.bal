package structs;

public struct Order {
    int number;
    OrderItem[] orderItems;
}

public struct OrderItem {
    boolean iced;
    int shots;
    int orderNumber;
    DrinkType drinkType;
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