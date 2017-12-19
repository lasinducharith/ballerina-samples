import ballerina.task;
import structs;
import quote;

public function main (string[] args) {

    var taskId, schedulerError = task:scheduleTimer(onTriggerFunction,
                                                    onErrorFunction, {delay:500, interval:1000});

    if (schedulerError != null) {
        println("Timer scheduling failed: " + schedulerError.msg);
    } else {
        println("Task ID:" + taskId);
    }
}

function onTriggerFunction () (error e) {
    structs:Quote q = quote:lookupQuote(quote:nextTicker());
    println(q);
    return;
}

function onErrorFunction (error e) {
    println("Error occured while executing the scheduler");
}