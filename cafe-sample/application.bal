import structs;
import functions;
import ballerina.log;

public function main (string[] args) {
    int count = 1;
    while (count <= 100) {
        structs:Order order = {};
        order.number = count;
        structs:OrderItem[] orderItems = [];
        orderItems[0] = {drinkType:structs:DrinkType.LATTE, shots:2, iced:true, orderNumber:count};
        orderItems[1] = {drinkType:structs:DrinkType.MOCHA, shots:3, iced:false, orderNumber:count};
        orderItems[2] = {drinkType:structs:DrinkType.CAPPUCCINO, shots:1, iced:false, orderNumber:count};
        order.orderItems = orderItems;
        structs:Drink[] drs = functions:placeOrder(order);
        _ = functions:prepareDelivery(count, drs);
        log:printInfo("--------------------------");
        count = count + 1;
    }
}
