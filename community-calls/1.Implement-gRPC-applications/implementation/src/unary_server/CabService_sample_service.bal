import ballerina/grpc;
import ballerina/log;

listener grpc:Listener ep = new (9090);

service CabService on ep {

    resource function getStartLocation(grpc:Caller caller, CabDetails cabDetails) {
        log:printInfo("Invoke getStartLocation service for cab  " + cabDetails.cabNumber);

        var startLocation = getStartLocationFromCabNumber(cabDetails.cabNumber);
        if (startLocation is Location) {
            grpc:Error? err = caller->send(startLocation);
            if (err is grpc:Error) {
                log:printError("Error from Connector: " + err.message());
            }

            grpc:Error? result = caller->complete();
            if (result is grpc:Error) {
                log:printError("Error in sending completed notification to the caller", err = result);
            }
        } else {
            grpc:Error? result = caller->sendError(
                grpc:INVALID_ARGUMENT,
                "Incorrectly specified cab number: " + cabDetails.cabNumber
            );
            if (result is grpc:Error) {
                log:printError("Error in sending error notification to the caller", err = result);
            }
        }
    }
}

function getStartLocationFromCabNumber(string cabNumber) returns Location? {
    map<Location> cabLocations = {
        "AB001": {
            name: "Royal Courts",
            latitude: 81,
            longitude: 100
        },
        "AB002": {
            name: "Palace Hotel",
            latitude: 82,
            longitude: 90
        },
        "AB003": {
            name: "Liberty Plaza",
            latitude: 80,
            longitude: 100
        }
    };
    return cabLocations[cabNumber];
}

public type CabDetails record {|
    string cabNumber = "";
|};

public type Location record {|
    string name = "";
    int latitude = 0;
    int longitude = 0;
|};



const string ROOT_DESCRIPTOR = "0A0B756E6172792E70726F746F22580A084C6F636174696F6E12120A046E616D6518012001280952046E616D65121A0A086C6174697475646518022001280552086C61746974756465121C0A096C6F6E67697475646518032001280552096C6F6E676974756465222A0A0A43616244657461696C73121C0A096361624E756D62657218012001280952096361624E756D62657232380A0A43616253657276696365122A0A1067657453746172744C6F636174696F6E120B2E43616244657461696C731A092E4C6F636174696F6E620670726F746F33";
function getDescriptorMap() returns map<string> {
    return {
        "unary.proto": "0A0B756E6172792E70726F746F22580A084C6F636174696F6E12120A046E616D6518012001280952046E616D65121A0A086C6174697475646518022001280552086C61746974756465121C0A096C6F6E67697475646518032001280552096C6F6E676974756465222A0A0A43616244657461696C73121C0A096361624E756D62657218012001280952096361624E756D62657232380A0A43616253657276696365122A0A1067657453746172744C6F636174696F6E120B2E43616244657461696C731A092E4C6F636174696F6E620670726F746F33"

    };
}

