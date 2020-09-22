import ballerina/grpc;
import ballerina/io;
import ballerina/log;

public function main(string... args) {

    CabServiceBlockingClient blockingEp = new ("http://localhost:9090");

    CabDetails cab = {
        cabNumber: "AB002"
    };
    var response = blockingEp->getStartLocation(cab);
    if (response is grpc:Error) {
        log:printError("Error from Connector: " + response.message());
    } else {
        io:println(response);
    }
}


