package functions;

import ballerina.runtime;
import structs;

public function prepareColdDrink (structs:OrderItem orderItem) (structs:Drink drink) {

    println("Preparing Cold Drink");
    runtime:sleepCurrentThread(1500);
    drink = {orderNumber:orderItem.orderNumber, shots:orderItem.shots, drinkType:orderItem.drinkType, iced:orderItem.iced};
    return drink;

}

public function prepareHotDrink (structs:OrderItem orderItem) (structs:Drink drink) {

    println("Preparing Hot Drink");
    runtime:sleepCurrentThread(1000);
    drink = {orderNumber:orderItem.orderNumber, shots:orderItem.shots, drinkType:orderItem.drinkType, iced:orderItem.iced};
    return drink;

}
