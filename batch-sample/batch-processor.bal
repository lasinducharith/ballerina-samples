import ballerina.file;
import ballerina.io;
import ballerina.data.sql;
import ballerina.log;
import structs;
import constants;

public function main (string[] args) {

    io:CharacterChannel characterChannel = getFileCharacterChannel(constants:DATA_FILE_URL, "r", "UTF-8");
    io:TextRecordChannel textRecordChannel = characterChannel.toTextRecordChannel("\\r?\\n", ",");
    // CSV Records as a string array of arrays
    string[][] stringRecords = readRecords(textRecordChannel, constants:BATCH_SIZE);
    // Generate a Persons' struct array
    structs:Person[] persons = personItemProcessor(stringRecords);
    // Insert persons data to mysql database
    insertDataToDatabase(persons);
}

// Read CSV file and get character stream
function getFileCharacterChannel (string filePath, string permission, string encoding) (io:CharacterChannel) {
    file:File src = {path:filePath};
    io:ByteChannel channel = src.openChannel(permission);
    io:CharacterChannel characterChannel = channel.toCharacterChannel(encoding);
    return characterChannel;
}


// Convert the text stream to a Records array
function readRecords (io:TextRecordChannel textRecordChannel, int noOfRecords) (string[][]) {
    string[][] lines = [];
    int count = 0;
    while (true) {
        lines[count] = textRecordChannel.readTextRecord();
        count = count + 1;
        if (count == noOfRecords) {
            return lines;
        }
    }
    return lines;
}

// Transform firstName, lastName and create a Person array
function personItemProcessor (string[][] stringRecords) (structs:Person[]) {
    structs:Person[] persons = [];
    int count = 0;
    try {
        while (count < constants:BATCH_SIZE) {
            string[] s = stringRecords[count];
            structs:Person person = {};
            person.firstName = s[0].toUpperCase();
            person.lastName = s[1].toUpperCase();
            persons[count] = person;
            log:printInfo("Converted Person <firstName: " + person.firstName + ", lastName: " + person.lastName + ">");
            count = count + 1;
        }
    } catch (error e) {
        log:printInfo("Error converting persons: " + e.msg);
    }
    return persons;
}

// Insert Person array entries to mysql database
function insertDataToDatabase (structs:Person[] persons) {

    endpoint<sql:ClientConnector> personsDB {
        create sql:ClientConnector(sql:DB.MYSQL, constants:DATABASE_HOST, constants:DATABASE_PORT, constants:DATABASE_NAME,
                                   constants:DATABASE_USERNAME, constants:DATABASE_PASSWORD, {maximumPoolSize:5});
    }

    try {
        _ = personsDB.update("DROP TABLE if EXISTS persons;", null);
        _ = personsDB.update("CREATE TABLE persons(id BIGINT NOT NULL AUTO_INCREMENT,
                                        firstName VARCHAR(20), lastName VARCHAR(20), PRIMARY KEY (id));", null);

        sql:Parameter[][] batchParameters = [];
        int count = 0;
        while (count < constants:BATCH_SIZE) {
            sql:Parameter parameter1 = {sqlType:sql:Type.VARCHAR, value:persons[count].firstName};
            sql:Parameter parameter2 = {sqlType:sql:Type.VARCHAR, value:persons[count].lastName};
            batchParameters[count] = [parameter1, parameter2];
            count = count + 1;
        }

        int[] updatedRowCount = personsDB.batchUpdate("INSERT INTO persons (firstName,lastName) values (?,?)", batchParameters);
        log:printInfo("Number of inserts in personsdb: " + <string>getRowCount(updatedRowCount));

    } catch (error e) {
        log:printInfo("Error updating the database: " + e.msg);
    } finally {
        personsDB.close();
    }
}

// Count the number of updated rows in database
function getRowCount (int[] rowUpdateCounts) (int) {

    int rowCount = 0;
    int i = 0;
    while (i < lengthof rowUpdateCounts) {
        rowCount = rowCount + rowUpdateCounts[i];
        i = i + 1;
    }
    return rowCount;

}