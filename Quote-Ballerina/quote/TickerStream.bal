package quote;

import ballerina.math;

public function nextTicker () (string ticker) {

    string[] alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R",
                         "S", "T", "U", "V", "W", "X", "Y", "Z"];
    string char1 = alphabet[math:randomInRange(0, 25)];
    string char2 = alphabet[math:randomInRange(0, 25)];
    string char3 = alphabet[math:randomInRange(0, 25)];
    ticker = char1+char2+char3;
    return ticker;
}