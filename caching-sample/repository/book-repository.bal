package repository;

import structs;
import ballerina.caching;

caching:Cache cache = caching:createCache("BooksCache", 5000, 10, 0.1);


public function getBookByIsbn (string isbn) (string) {
    structs:Book bookToReturn;
    simulateSlowService();
    bookToReturn = {isbn:isbn, title:"Some Title"};
    var bookInJson, _ = <json>bookToReturn;
    return bookInJson.toString();
}


public function getBookByIsbnWithCache (string isbn) (string) {
    structs:Book bookToReturn;
    any cachedBook = cache.get(isbn);
    if (cachedBook != null) {
        // Book is in cache
        var bookFromCache, _ = (structs:Book)cachedBook;
        bookToReturn = bookFromCache;
    }
    else {
        // Book is not in cache
        simulateSlowService();
        bookToReturn = {isbn:isbn, title:"Some Title"};
        cache.put(isbn, bookToReturn);

    }
    // Convert Book Struct to JSON String
    var bookInJson, _ = <json>bookToReturn;
    return bookInJson.toString();
}

// Simulate service/network delay
function simulateSlowService () {
    int time = 3000;
    sleep(time);
}