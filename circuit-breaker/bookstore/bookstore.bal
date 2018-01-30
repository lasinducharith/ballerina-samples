package bookstore;

import ballerina.net.http;

@http:configuration {basePath:"/books", port:8080}
service<http> bookService {

    resource popularBooks (http:Request request, http:Response response) {
        response.setJsonPayload(["Don Quixote", "A Tale of Two Cities", "The Lord of the Rings", "Harry Potter and the"
                                +" Philosopher's Stone", "The Hobbit", "Alice in Wonderland"]);
        _ = response.send();
    }
}
