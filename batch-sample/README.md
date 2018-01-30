# Ballerina Batch Processing Sample

This sample demonstrates the capabilities of ballerina language to process a batch of data.
We'll build an application that reads data from a CSV file, transform it with a custom code and store the final results in a MySQL database, as batches.

## How to run

- Install MySQL in your local machine
- Create a new MySQL database **personsdb** 
- Update MySQL username, password in ballerina.conf file
- Download mysql jdbc driver(mysql-connector-java-x.x.x-bin) from https://dev.mysql.com/downloads/connector/j/
- Copy the driver to <BALLERINA_TOOLS_DISTRIBUTION>/bre/lib
- Execute following command

```
$ballerina run batch-processor.bal
```

## Output of batch-processor sample
 ```
 2018-01-29 18:26:04,087 INFO  [] - Converted Person <firstName: JILL, lastName: DOE> 
 2018-01-29 18:26:04,089 INFO  [] - Converted Person <firstName: JOE, lastName: DOE> 
 2018-01-29 18:26:04,090 INFO  [] - Converted Person <firstName: JUSTIN, lastName: DOE> 
 2018-01-29 18:26:04,090 INFO  [] - Converted Person <firstName: JANE, lastName: DOE> 
 2018-01-29 18:26:04,091 INFO  [] - Converted Person <firstName: JOHN, lastName: DOE> 
 2018-01-29 18:26:04,411 INFO  [] - Number of inserts in personsdb: 5
  ```