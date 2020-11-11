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

import ballerina/sql;
import ballerina/io;
import ballerina/java.jdbc;
import ballerina/time;

type Candidate record {
    int id;
    string first_name;
    string last_name;
    time:Time dob;
};

public function main(int limitCount) returns @tainted error? {

    jdbc:Client dbClient = check new ("jdbc:mysql://localhost:3306/DEMO", "test", "Test#123");

    sql:ParameterizedQuery query = `SELECT id, first_name, last_name, dob from candidates limit ${limitCount}`;

    stream<record{}, error> queryResults = dbClient->query(<@untainted> query, Candidate);
    stream<Candidate, error> candidateStream = <stream<Candidate, error>> queryResults;

    error? e = candidateStream.forEach(function(Candidate value) {
        io:println(value.first_name);
    });
    if (e is error) {
        io:println("Error accessing the stream");
    }

    check dbClient.close();
}
