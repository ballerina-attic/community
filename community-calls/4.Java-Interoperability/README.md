# Community Call #4 - Java Interoperability in Ballerina

- YouTube: https://www.youtube.com/watch?v=4EINEJAtAg4
- Date: December 8, 2020
- Invite: https://wso2.zoom.us/j/97351774553?pwd=eGtaNjB3M3QvN1JXL0RXa3FwMVZZZz09

## Agenda

- Update on Ballerina Swan Lake releases
- Java Interoperability in Ballerina
  - Calling Java code from Ballerina
  - Generating bindings using the Bindgen Tool
  - Packaging Java libraries with Ballerina programs
- Open discussion

## Slide Deck

https://www.slideshare.net/BallerinaLang/ballerina-community-call-java-interoperability

## Running the Samples

>**Note:** The sample is based on Ballerina 1.2.x branch.

- Execute the following command from the project root directory to generate the Ballerina bindings.
```
$ ballerina bindgen -mvn org.yaml:snakeyaml:1.25 -o ./src/load_yaml org.yaml.snakeyaml.Yaml java.io.File java.io.FileInputStream java.io.FileNotFoundException java.io.InputStream java.util.Map java.lang.String java.lang.Object
```
- Then, execute the following to run the sample.
```
$ ballerina run load_yaml
```

## References

- https://ballerina.io/learn/calling-java-code-from-ballerina/
- https://ballerina.io/learn/by-example/invoke-java-methods.html
- https://ballerina.io/learn/api-docs/ballerina/java/
- https://docs.oracle.com/javase/8/docs/api/
- https://bitbucket.org/asomov/snakeyaml/wiki/Documentation
