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


