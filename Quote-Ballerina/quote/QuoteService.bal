package quote;

import ballerina.math;
import structs;

public function lookupQuote(string ticker)(structs:Quote quote){
    quote = {price: math:random()*100, ticker:ticker};
    return quote;
}
