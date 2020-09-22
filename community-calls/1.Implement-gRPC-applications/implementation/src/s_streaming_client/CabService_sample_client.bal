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

