import ballerina/grpc;
import ballerina/log;

listener grpc:Listener ep = new (9091);

service CabService on ep {

    resource function getCurrentLocation(grpc:Caller caller, CabDetails cabDetails) {
        log:printInfo("Invoke getCurrentLocation service for cab  " + cabDetails.cabNumber);

        var route = getCabRoute(cabDetails.cabNumber);
        if (route is Location[]) {
            foreach Location location in route {
                grpc:Error? err = caller->send(location);
                if (err is grpc:Error) {
                    log:printError("Error from Connector: " + err.message());
                } else {
                    log:printInfo("Sent location: " + location.name);
                }
            }

            grpc:Error? result = caller->complete();
            if (result is grpc:Error) {
                log:printError("Error in sending completed notification to caller", err = result);
            }
        } else {
            grpc:Error? result = caller->sendError(
                grpc:INVALID_ARGUMENT,
                "Incorrectly specified cab number: " + cabDetails.cabNumber
            );
            if (result is grpc:Error) {
                log:printError("Error in sending completed notification to caller", err = result);
            }
        }
    }
}

public type CabDetails record {|
    string cabNumber = "";

|};

public type Location record {|
    string name = "";
    int latitude = 0;
    int longitude = 0;

|};

function getCabRoute(string cabNumber) returns Location[]? {
    Location[] route1 = [
            {name: "Royal Courts", latitude: 81, longitude: 100},
            {name: "National Museum", latitude: 72, longitude: 82},
            {name: "National Park", latitude: 30, longitude: 62}
        ];
    Location[] route2 = [
            {name: "Palace Hotel", latitude: 82, longitude: 90},
            {name: "City College", latitude: 71, longitude: 82},
            {name: "VSA Market", latitude: 70, longitude: 62}
        ];
    Location[] route3 = [
            {name: "Liberty Plaza", latitude: 80, longitude: 100},
            {name: "Hotel AMI", latitude: 79, longitude: 82},
            {name: "All Saints Church", latitude: 78, longitude: 62}
        ];
    map<Location[]> cabLocations = {
        "AB001": route1,
        "AB002": route2,
        "AB003": route3
    };
    return cabLocations[cabNumber];
}



const string ROOT_DESCRIPTOR = "0A11735F73747265616D696E672E70726F746F22580A084C6F636174696F6E12120A046E616D6518012001280952046E616D65121A0A086C6174697475646518022001280552086C61746974756465121C0A096C6F6E67697475646518032001280552096C6F6E676974756465222A0A0A43616244657461696C73121C0A096361624E756D62657218012001280952096361624E756D626572323C0A0A43616253657276696365122E0A1267657443757272656E744C6F636174696F6E120B2E43616244657461696C731A092E4C6F636174696F6E3001620670726F746F33";
function getDescriptorMap() returns map<string> {
    return {
        "s_streaming.proto": "0A11735F73747265616D696E672E70726F746F22580A084C6F636174696F6E12120A046E616D6518012001280952046E616D65121A0A086C6174697475646518022001280552086C61746974756465121C0A096C6F6E67697475646518032001280552096C6F6E676974756465222A0A0A43616244657461696C73121C0A096361624E756D62657218012001280952096361624E756D626572323C0A0A43616253657276696365122E0A1267657443757272656E744C6F636174696F6E120B2E43616244657461696C731A092E4C6F636174696F6E3001620670726F746F33"

    };
}

