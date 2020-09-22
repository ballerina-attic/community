import ballerina/grpc;
import ballerina/log;

public function main (string... args) {

    CabServiceClient endpoint = new("http://localhost:9092");

    grpc:StreamingClient streamingClient;
    var res = endpoint->sendCurrentLocation(CabServiceMessageListener);

    if (res is grpc:Error) {
        log:printError("Error from Connector: " + res.message());
        return;
    } else {
        log:printInfo("Initialized connection sucessfully.");
        streamingClient = res;
    }
    
    Location[] route = [
            {name: "Palace Hotel", latitude: 82, longitude: 90},
            {name: "City College", latitude: 71, longitude: 82},
            {name: "VSA Market", latitude: 70, longitude: 62}
        ];
    foreach Location location in route {
        grpc:Error? connErr = streamingClient->send(location);
        if (connErr is grpc:Error) {
            log:printError("Error from Connector: " + connErr.message());
        } else {
            log:printInfo("Sent location: " + location.name);
        }
    }

    grpc:Error? result = streamingClient->complete();
    if (result is grpc:Error) {
        log:printError("Error in sending complete message", result);
    }

}

service CabServiceMessageListener = service {

    resource function onMessage(Location location) {
        log:printInfo("Response received from server: " + location.name);
    }

    resource function onError(error err) {
        log:printError("Error reported from server: " + err.message());
    }

    resource function onComplete() {
        log:printInfo("Server completed sending responses.");
    }
};

