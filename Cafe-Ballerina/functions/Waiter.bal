package functions;

import structs;

public function prepareDelivery (structs:Drink[] drinks) (structs:Delivery delivery) {

    println("Preparing Delivery");
    if (lengthof drinks > 0) {
        structs:Delivery d = {orderNumber:drinks[0].orderNumber, deliveredDrinks:drinks};
        return d;
    }
    return null;
}