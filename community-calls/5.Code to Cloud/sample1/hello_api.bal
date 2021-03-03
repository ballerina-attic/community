import ballerina/http;

service /helloWorld on new http:Listener(9090) {
    resource function get sayHello() returns string {
        return "Hello, World from Ballerina ! \n";
    }
}
