package quote;

import ballerina.math;
import ballerina.log;

// Generate a random 3-digit string
public function nextTicker () (string ticker) {

    string[] alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R",
                         "S", "T", "U", "V", "W", "X", "Y", "Z"];
    string char1 = alphabet[math:randomInRange(0, 25)];
    string char2 = alphabet[math:randomInRange(0, 25)];
    string char3 = alphabet[math:randomInRange(0, 25)];
    ticker = char1 + char2 + char3;
    return ticker;
}

// Format a float value(between 0-99) to 2 decimal places
public function decimalFormat (float f) (float) {

    var decimalString = <string>f;
    string[] splittedString = decimalString.split("\\.");
    string formattedDecimal = splittedString[1].subString(0, 2);
    string formattedString = splittedString[0] + "." + formattedDecimal;
    var newFloat, e = <float>formattedString;
    if (e != null) {
        log:printError("Error converting a formatted string to float. " + e.msg);
    }
    return newFloat;
}