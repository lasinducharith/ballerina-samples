import ballerina.task;

public function main (string[] args) {

    function () returns (error) onTriggerFunction = reportCurrentTime;
    function (error e) onErrorFunction = logError;

    // Trigger the timer every 5s
    var taskId, schedulerError = task:scheduleTimer(onTriggerFunction,
                                                    onErrorFunction, {delay:0, interval:5000});
}

// Print current time
function reportCurrentTime () returns (error e) {
    Time time = currentTime();
    string customTimeString = time.format("HH:mm:ss");
    println("The time is now " + customTimeString);
    return;
}

function logError (error e) {
    println("Error scheduling the task. " + e.msg);
}