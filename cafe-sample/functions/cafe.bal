package functions;

import structs;
import ballerina.log;

// Placing order
public function placeOrder (structs:Order order) (structs:Drink[] drinks) {

    log:printInfo("Placing order " + order.number);
    structs:OrderItem[] orderItems = order.orderItems;
    structs:Drink[] preparedDrinks = [];
    int orderLength = lengthof orderItems;

    if (orderLength > 0) {
        fork {
            worker w1 {
                int i = 0;
                int j = 0;
                structs:Drink[] coldDrinks = [];
                while (i < orderLength) {
                    if (orderItems[i].iced) {
                        coldDrinks[j] = prepareColdDrink(orderItems[i]);
                        j = j + 1;
                    }
                    i = i + 1;

                }
                coldDrinks -> fork;

            }

            worker w2 {
                int i = 0;
                int j = 0;
                structs:Drink[] hotDrinks = [];
                while (i < orderLength) {
                    if (orderItems[i].iced == false) {
                        hotDrinks[j] = prepareHotDrink(orderItems[i]);
                        j = j + 1;
                    }
                    i = i + 1;
                }
                hotDrinks -> fork;
            }

        } join (all) (map results) {
            var resW1, _ = (any[])results["w1"];
            var resW2, _ = (any[])results["w2"];

            // TODO: No way to cast any[] to Drink[], hence hard-coding preparedDrinks
            preparedDrinks[0] = {drinkType:structs:DrinkType.LATTE, shots:2, iced:true, orderNumber:order.number};
            preparedDrinks[1] = {drinkType:structs:DrinkType.MOCHA, shots:3, iced:false, orderNumber:order.number};
            preparedDrinks[2] = {drinkType:structs:DrinkType.CAPPUCCINO, shots:1, iced:false, orderNumber:order.number};

        }
    }
    else {
        log:printInfo("No drinks found in the order!");
    }
    return preparedDrinks;

}