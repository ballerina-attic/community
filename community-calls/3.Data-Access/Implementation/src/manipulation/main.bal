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
import ballerina/time;
import ballerina/java.jdbc;

type Candidate record {
    int id;
    string first_name;
    string last_name;
    time:Time dob;
};

public function main() returns sql:Error? {

    jdbc:Client dbClient = check new ("jdbc:mysql://localhost:3306/DEMO", "test", "Test#123");

    sql:DateValue dob = new ("1990-01-01");
    sql:ParameterizedQuery insertQuery = `INSERT INTO candidates(first_name, last_name, dob) VALUES('Harry', 'Potter', ${dob})`;

    sql:ExecutionResult execResult = check dbClient->execute(insertQuery);
    io:println(execResult);

    int lastInsertId = <int> execResult.lastInsertId;

    check queryResult(dbClient, lastInsertId);

    io:println("Finished executing the samples");
    check dbClient.close();
}

function queryResult(jdbc:Client dbClient, int id) returns sql:Error? {
    sql:ParameterizedQuery retrieveQuery = `SELECT id, first_name, last_name, dob FROM candidates WHERE id = ${id};`;

    stream<record{}?, error> selectResult = dbClient->query(<@untainted> retrieveQuery, Candidate);
    stream<Candidate, sql:Error> candidates = <stream<Candidate, sql:Error>> selectResult;

    error? e = candidates.forEach(function(Candidate candidate) {
        io:println(candidate);
    });
    if (e is error) {
        io:println("Error occurred while querying ", e.message());
    } 
}
