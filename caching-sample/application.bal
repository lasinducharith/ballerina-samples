import repository;
import ballerina.log;

public function main (string[] args) {

    log:printInfo("Fetching Books from Repository without cache");
    log:printInfo("isbn-1234 --> " + repository:getBookByIsbn("isbn-1234"));
    log:printInfo("isbn-4567 --> " + repository:getBookByIsbn("isbn-4567"));
    log:printInfo("isbn-1234 --> " + repository:getBookByIsbn("isbn-1234"));
    log:printInfo("isbn-4567 --> " + repository:getBookByIsbn("isbn-4567"));
    log:printInfo("isbn-1234 --> " + repository:getBookByIsbn("isbn-1234"));
    log:printInfo("isbn-1234 --> " + repository:getBookByIsbn("isbn-1234"));
    println("\n");

    log:printInfo("Fetching Books from Repository with cache");
    log:printInfo("isbn-1234 --> " + repository:getBookByIsbnWithCache("isbn-1234"));
    log:printInfo("isbn-4567 --> " + repository:getBookByIsbnWithCache("isbn-4567"));
    log:printInfo("isbn-1234 --> " + repository:getBookByIsbnWithCache("isbn-1234"));
    log:printInfo("isbn-4567 --> " + repository:getBookByIsbnWithCache("isbn-4567"));
    log:printInfo("isbn-1234 --> " + repository:getBookByIsbnWithCache("isbn-1234"));
    log:printInfo("isbn-1234 --> " + repository:getBookByIsbnWithCache("isbn-1234"));
}
