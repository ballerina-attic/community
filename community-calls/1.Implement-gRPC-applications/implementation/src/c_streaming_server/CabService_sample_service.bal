import ballerina/grpc;
import ballerina/log;

listener grpc:Listener ep = new (9092);

service CabService on ep {

    resource function sendCurrentLocation(grpc:Caller caller, stream<Location,error> clientStream) {
        log:printInfo("Start receiving client location...");

        error? e = clientStream.forEach(function(Location location) {
            log:printInfo("Traced location: " + location.name);
        });

        if (e is grpc:EOS) {
            TripState state = {
                state: STATE_COMPLETED
            };
            grpc:Error? err = caller->send(state);
            if (err is grpc:Error) {
                log:printError("Error from Connector: " + err.message());
            }

            grpc:Error? result = caller->complete();
            if (result is grpc:Error) {
                log:printError("Error in sending completed notification to caller", err = result);
            } else {
                log:printInfo("Receiving completed");
            }

        } else if (e is error) {
            log:printError("Error from Connector: " + e.message());
        }
    }
}

public type TripState record {|
    State? state = ();
    
|};

public type State "COMPLETED"|"IN_PROGRESS";
public const State STATE_COMPLETED = "COMPLETED";
public const State STATE_IN_PROGRESS = "IN_PROGRESS";

public type Location record {|
    string name = "";
    int latitude = 0;
    int longitude = 0;
    
|};



const string ROOT_DESCRIPTOR = "0A11635F73747265616D696E672E70726F746F22580A084C6F636174696F6E12120A046E616D6518012001280952046E616D65121A0A086C6174697475646518022001280552086C61746974756465121C0A096C6F6E67697475646518032001280552096C6F6E676974756465225C0A0954726970537461746512260A05737461746518012001280E32102E5472697053746174652E53746174655205737461746522270A055374617465120D0A09434F4D504C455445441000120F0A0B494E5F50524F47524553531001323C0A0A43616253657276696365122E0A1373656E6443757272656E744C6F636174696F6E12092E4C6F636174696F6E1A0A2E5472697053746174652801620670726F746F33";
function getDescriptorMap() returns map<string> {
    return {
        "c_streaming.proto":"0A11635F73747265616D696E672E70726F746F22580A084C6F636174696F6E12120A046E616D6518012001280952046E616D65121A0A086C6174697475646518022001280552086C61746974756465121C0A096C6F6E67697475646518032001280552096C6F6E676974756465225C0A0954726970537461746512260A05737461746518012001280E32102E5472697053746174652E53746174655205737461746522270A055374617465120D0A09434F4D504C455445441000120F0A0B494E5F50524F47524553531001323C0A0A43616253657276696365122E0A1373656E6443757272656E744C6F636174696F6E12092E4C6F636174696F6E1A0A2E5472697053746174652801620670726F746F33"
        
    };
}

