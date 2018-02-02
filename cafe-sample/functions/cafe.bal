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
                    if (!orderItems[i].iced) {
                        hotDrinks[j] = prepareHotDrink(orderItems[i]);
                        j = j + 1;
                    }
                    i = i + 1;
                }
                hotDrinks -> fork;
            }

        } join (all) (map results) {
            var resultW1, _ = (any[])results["w1"];
            var resultW2, _ = (any[])results["w2"];

            var coldDrinks, _ = (structs:Drink[])resultW1[0];
            var hotDrinks, _ = (structs:Drink[])resultW2[0];
            any[] concatenatedDrinksArray = concatArrays(coldDrinks, hotDrinks);

            // TODO: Replacing array casting with a while loop
            //preparedDrinks, _ = (structs:Drink[])concatenatedDrinksArray;
            int count = 0;
            while (count < lengthof concatenatedDrinksArray) {
                preparedDrinks[count], _ = (structs:Drink)concatenatedDrinksArray[count];
                count = count + 1;
            }


        }
    }
    else {
        log:printInfo("No drinks found in the order!");
    }
    return preparedDrinks;

}