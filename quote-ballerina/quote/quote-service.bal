package quote;

import ballerina.math;
import structs;

public function lookupQuote(string ticker)(structs:Quote quote){
    float randomFormattedNumber = decimalFormat(math:random() * 100);
    quote = {price: randomFormattedNumber, ticker:ticker};
    return quote;
}
