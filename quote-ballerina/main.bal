import ballerina.task;
import structs;
import quote;
import ballerina.log;

public function main (string[] args) {

    var taskId, schedulerError = task:scheduleTimer(onTriggerFunction,
                                                    onErrorFunction, {delay:500, interval:1000});
    if (schedulerError != null) {
        log:printInfo("Timer scheduling failed: " + schedulerError.msg);
    } else {
        log:printInfo("Task ID:" + taskId);
    }

}

function onTriggerFunction () (error e) {
    structs:Quote quote = quote:lookupQuote(quote:nextTicker());
    var jsonQuote, _ = <json>quote;
    log:printInfo(jsonQuote.toString());
    return;
}

function onErrorFunction (error e) {
    log:printInfo("Error occured while executing the scheduler");
}