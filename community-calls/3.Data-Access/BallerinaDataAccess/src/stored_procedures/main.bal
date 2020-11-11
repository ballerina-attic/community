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

type Candidate record {
    int id;
    string first_name;
    string last_name;
    string skill;
};

public function main() returns sql:Error? {

    jdbc:Client dbClient = check new ("jdbc:mysql://localhost:3306/DEMO", "test", "Test#123");

    sql:IntegerOutParameter skillCount = new;
    sql:ParameterizedCallQuery callQuery = `call get_candidate_skill(133, ${skillCount})`;

    sql:ProcedureCallResult callResults = check dbClient->call(callQuery, [Candidate]);

    io:println("Total skill count of candidate of id 100: ", check skillCount.get(string));

    stream<Candidate, sql:Error> candidateStream = <stream<Candidate, sql:Error>>callResults.queryResult;

    error? e = candidateStream.forEach(function(Candidate candidate) {
                                           io:println(candidate);
                                       });
    if (e is error) {
        io:println("Error occurred while processing stored procedure results ", e.message());
    }

    check callResults.close();
    check dbClient.close();
}
