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

import ballerina/io;
import ballerina/sql;
import ballerina/java.jdbc;

public function main() returns error? {

    jdbc:Client dbClient = checkpanic new ("jdbc:mysql://localhost:3306/DEMO", "test", "Test#123");

    // Insert a record into the candidates table and get the inserted ID back.
    // Insert a set of candidate ID and Skill ID into the candidate_skills table.
    // If all above operations are successfully, commit the transaction, otherwise roll it back.

    string firstName = "John";
    string lastName = "Doe";
    sql:DateValue dob = new ("1990-01-04");
    int skill = 10;

    transaction {

        sql:ParameterizedQuery candidateInsert = `INSERT INTO candidates (first_name,last_name, dob) VALUES (${firstName}, ${
        lastName}, ${dob})`;
        sql:ExecutionResult execResult = check dbClient->execute(candidateInsert);

        int candidateId = <int>execResult.lastInsertId;
        io:println("Newly inserted Candidate Id : ", candidateId);

        sql:ParameterizedQuery candidateSkillInsert = `INSERT INTO candidate_skills VALUES (${candidateId}, ${skill})`;
        sql:ExecutionResult|sql:Error skillUpdateResult = dbClient->execute(candidateSkillInsert);

        if (skillUpdateResult is sql:Error) {
            io:println("Rollback transaction");
            rollback;
        } else {
            var commitResult = commit;
            if commitResult is () {
                io:println("Transaction committed");
            } else {
                io:println("Transaction failed");
            }
        }
    }

    io:println("Finished executing the samples");
    check dbClient.close();
}
