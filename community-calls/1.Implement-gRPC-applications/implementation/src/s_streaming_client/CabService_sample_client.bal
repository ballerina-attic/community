import ballerina/grpc;
import ballerina/log;

public function main(string... args) {

    CabServiceClient ep = new ("http://localhost:9091");

    CabDetails cab = {
        cabNumber: "AB002"
    };
    grpc:Error? result = ep->getCurrentLocation(cab, CabServiceMessageListener);
    if (result is grpc:Error) {
        log:printError("Error from Connector: " + result.message());
    } else {
        log:printInfo("Connected successfully");
    }

}

service CabServiceMessageListener = service {

    resource function onMessage(Location location) {
        log:printInfo("Response received from server: " + location.name);
    }

    resource function onError(error err) {
        log:printError("Error from Connector: " + err.message());
    }

    resource function onComplete() {
        log:printInfo("Server Complete Sending Responses.");
    }
};

