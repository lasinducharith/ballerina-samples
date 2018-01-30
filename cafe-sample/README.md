# Ballerina Cafe Sample
The Cafe Sample emulates the simple operation of a coffee shop that is modeled using Enterprise Integration Patterns (EIP). 
Following diagram depicts the basic flow of the 

```                                                                                          Barista
                                                                     hotDrinks       ____________________
                                                                    |==========| -->|                    |
                     orders                   drinks               /                | prepareHotDrink()  |
Place Order ->Cafe->|======|->OrderSplitter->|======|->DrinkRouter                  |                    |
                                                                   \ coldDrinks     | prepareColdDrink() |
                                                                    |==========| -->|                    |
                                                                                    |____________________|

                                                Legend: |====| - channels
```

An order contains multiple order items. Once the order is placed, the order items will be splitted and and routed to the corresponding barista.
There are two baristas, one will prepare hot drinks and other will prepare cold drinks. The prepared drinks will be then sent as a delivery to the waiter.

## How to run

Execute following command

```
$ballerina run application.bal
```

## Output of batch-processor sample
 ```
2018-01-30 10:11:36,280 INFO  [functions] - Placing order 1 
2018-01-30 10:11:36,290 INFO  [functions] - Preparing Cold Drink 
2018-01-30 10:11:36,292 INFO  [functions] - Preparing Hot Drink 
2018-01-30 10:11:38,294 INFO  [functions] - Preparing Hot Drink 
2018-01-30 10:11:40,301 INFO  [functions] - Preparing Delivery 
2018-01-30 10:11:40,304 INFO  [functions] - Order 1 delivered 
2018-01-30 10:11:40,305 INFO  [] - -------------------------- 
2018-01-30 10:11:40,307 INFO  [functions] - Placing order 2 
2018-01-30 10:11:40,309 INFO  [functions] - Preparing Cold Drink 
2018-01-30 10:11:40,309 INFO  [functions] - Preparing Hot Drink 
2018-01-30 10:11:42,313 INFO  [functions] - Preparing Hot Drink 
2018-01-30 10:11:44,317 INFO  [functions] - Preparing Delivery 
2018-01-30 10:11:44,320 INFO  [functions] - Order 2 delivered 
2018-01-30 10:11:44,323 INFO  [] - -------------------------- 
  ```