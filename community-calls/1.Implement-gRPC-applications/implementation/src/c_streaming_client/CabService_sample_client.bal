// Copyright (c) 2020 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

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

