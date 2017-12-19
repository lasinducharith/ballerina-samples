import structs;
import functions;

public function main (string[] args) {

    int i = 1;
    while (i <= 100) {
        structs:Order order = {};
        order.number = i;
        structs:OrderItem[] orderItems2 = [];
        orderItems2[0] = {iced:true, shots:2, orderNumber:i, drinkType:structs:DrinkType.LATTE};
        orderItems2[1] = {iced:false, shots:3, orderNumber:i, drinkType:structs:DrinkType.MOCHA};
        order.orderItems = orderItems2;
        structs:Drink[] drs = functions:placeOrder(order);
        structs:Delivery dl = functions:prepareDelivery(drs);
        println("Order " + i + " Delivered");
        println("--------------------------");
        i = i + 1;
    }

}