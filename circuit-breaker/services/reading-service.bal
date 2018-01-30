package services;

import ballerina.net.http;
import ballerina.net.http.resiliency;
import ballerina.log;

service<http> readingService {

    endpoint<resiliency:CircuitBreaker> circuitBreakerEP {
        create resiliency:CircuitBreaker(create http:HttpClient("http://localhost:8080", {endpointTimeout:2000}), 0.3, 20000);
    }

    resource toRead (http:Request request, http:Response response) {
        http:Response backendRes;
        http:HttpConnectorError err;
        backendRes, err = circuitBreakerEP.get("/books/popularBooks", request);
        if (err != null) {
            println(err);
            println(backendRes);
            if (backendRes == null) {
                backendRes = {};
                backendRes.setStatusCode(err.statusCode);
                backendRes.setJsonPayload({"Msg":"Error connecting to the backend"});
                log:printError(err.msg);
            }
        }

        _ = response.forward(backendRes);
    }

}
