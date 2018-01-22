package functions;

import structs;
import ballerina.log;

// Waiter preparing delivery
public function prepareDelivery (int orderNo, structs:Drink[] drinks) (structs:Delivery) {
    log:printInfo("Preparing Delivery");
    if (lengthof drinks > 0) {
        structs:Delivery delivery = {orderNumber:orderNo, deliveredDrinks:drinks};
        log:printInfo("Order " + orderNo + " delivered");
        return delivery;
    }
    return null;
}