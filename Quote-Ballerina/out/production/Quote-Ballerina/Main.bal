import ballerina.net.http;

public function main (string[] args) {

    endpoint<http:HttpClient> httpEndpoint {
    create http:HttpClient("http://localhost:9090/quotes", {});
}
    http:Request req = {};
    http:Response resp = {};
    Ticker tickerReq = {"ticker": "IBM"};

    json requestToJson;
    requestToJson, _ = <json> tickerReq;
    req.setJsonPayload(requestToJson);
    println(req.getJsonPayload());
    println("REQ");
    println(req);
    resp, _ = httpEndpoint.post("/tickers", req);
    var responseJson = resp.getJsonPayload();
    println(responseJson);
}


public function nextTicker() {

//char[] chars = new char[3];
//for (int i = 0; i < 3; i++) {
//chars[i] = (char) (new Random().nextInt(25) + 65);
//                                }
//                                return new String(chars);
}


struct Ticker{
    string ticker;
}