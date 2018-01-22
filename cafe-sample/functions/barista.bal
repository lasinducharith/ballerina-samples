package functions;

import ballerina.runtime;
import structs;
import ballerina.log;

// Barista Preparing Cold Drinks
public function prepareColdDrink (structs:OrderItem orderItem) (structs:Drink drink) {
    log:printInfo("Preparing Cold Drink");
    runtime:sleepCurrentThread(1000);
    drink = {orderNumber:orderItem.orderNumber, shots:orderItem.shots, drinkType:orderItem.drinkType, iced:orderItem.iced};
    return drink;

}

// Barista Preparing Hot Drinks
public function prepareHotDrink (structs:OrderItem orderItem) (structs:Drink drink) {
    log:printInfo("Preparing Hot Drink");
    runtime:sleepCurrentThread(2000);
    drink = {orderNumber:orderItem.orderNumber, shots:orderItem.shots, drinkType:orderItem.drinkType, iced:orderItem.iced};
    return drink;

}
