package functions;

import structs;

public function placeOrder (structs:Order order) (structs:Drink[] drinks) {

    structs:OrderItem[] orderItems = order.orderItems;
    structs:Drink[] preparedDrinks = [];
    int length = lengthof orderItems;
    if (length > 0) {
        fork {
            worker w1 {
                any[] icedDrinkArray = [];
                int i = 0;
                while (i < length) {
                    if (orderItems[i].iced) {
                        icedDrinkArray[i] = prepareColdDrink(orderItems[i]);

                    }
                    else {
                        icedDrinkArray[i] = null;
                    }
                    i = i + 1;
                }
                //TODO https://github.com/ballerinalang/ballerina/issues/4308
                //orderItems -> fork;

            }

            worker w2 {
                any[] hotDrinkArray = [];
                int i = 0;
                while (i < length) {
                    if (orderItems[i].iced == false) {
                        hotDrinkArray[i] = prepareHotDrink(orderItems[i]);
                    }
                    else {
                        hotDrinkArray[i] = null;
                    }
                    i = i + 1;
                }
                //TODO https://github.com/ballerinalang/ballerina/issues/4308
                //hotDrinkArray -> fork;
            }

        } join (all) (map results) {
            // Hard coded results due to above bug
            structs:Drink[] drinkCold = [{iced:true, shots:2, orderNumber:1, drinkType:structs:DrinkType.LATTE}];
            structs:Drink[] drinkHot = [{iced:false, shots:3, orderNumber:1, drinkType:structs:DrinkType.MOCHA}];
            results = {"w1":drinkCold, "w2":drinkHot};
            var resW1, e = (structs:Drink[])results["w1"];
            var resW2, e = (structs:Drink[])results["w2"];
            preparedDrinks[0] = resW1[0];
            preparedDrinks[1] = resW2[0];

        }

    }
    return preparedDrinks;

}