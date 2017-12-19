import ballerina.net.http;
import ballerina.math;

@http:configuration {basePath:"/quotes"}
service<http> QuoteService {

    @http:resourceConfig {
        methods:["POST"],
        path:"/tickers"
    }
    resource lookupQuote (http:Request request, http:Response response) {
        json j = request.getJsonPayload();
        println(j);
        string ticker;
        ticker, _ = (string)j["ticker"];
        Quote quote = {price: math:random()*100, ticker:ticker};
        var jsonQuote, _ = <json> quote;
        response.setStringPayload(jsonQuote.toString());
        _ = response.send();
    }
}


