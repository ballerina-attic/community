import ballerina/io;
import ballerina/java;

public function main() returns error? {
    Yaml yaml = newYaml1();
    File file = newFile2("./text.yml");
    InputStream|FileNotFoundException inputStream = newFileInputStream1(file);
    if (inputStream is FileNotFoundException) {
        io:println("The yaml file could not be loaded: ", inputStream.reason());
    } else {
        Map mapObj = <Map> check java:cast(yaml.load(inputStream), typedesc<Map>);
        io:println(mapObj, "\n");
        io:println(mapObj.get(newString13("invoice")));
    }
}
