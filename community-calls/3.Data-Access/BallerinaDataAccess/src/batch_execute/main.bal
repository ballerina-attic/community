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

public function main() returns sql:Error? {

    jdbc:Client dbClient = check new ("jdbc:mysql://localhost:3306/DEMO", "test", "Test#123");

    var insertRecords = [{
        first_name: "Peter",
        last_name: "Stuart",
        dob: "1990-01-01"
    }, {
        first_name: "Stephanie",
        last_name: "Mike",
        dob: "1990-01-01"
    }, {
        first_name: "Bill",
        last_name: "John",
        dob: "1990-01-01"
    }];

    sql:ParameterizedQuery[] insertQueries = from var data in insertRecords
                                             select `INSERT INTO candidates(first_name, last_name, dob) VALUES (${data.
                                             first_name}, ${data.last_name}, ${data.dob})`;

    sql:ExecutionResult[]|sql:Error execResults = dbClient->batchExecute(insertQueries);

    int count = 1;
    if (execResults is sql:ExecutionResult[]) {
        execResults.forEach(function(sql:ExecutionResult exec) {
                                io:println("Insert result of insert record ", count, ": ", exec);
                                count = count + 1;
                            });
    } else if (execResults is sql:BatchExecuteError) {
        io:println("Batch execution error occurred! ", execResults.message());
        execResults.detail()?.executionResults.forEach(function(sql:ExecutionResult exec) {
                                                           io:println("Insert result of insert record ", count, ": ", 
                                                           exec);
                                                           count = count + 1;
                                                       });
    } else {
        io:println("Error occurred while batch inserting records.");
    }

    io:println("Finished executing the samples");
    check dbClient.close();
}
