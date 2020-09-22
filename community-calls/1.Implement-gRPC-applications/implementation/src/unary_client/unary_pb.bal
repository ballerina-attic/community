import ballerina/grpc;

public type CabServiceBlockingClient client object {

    *grpc:AbstractClientEndpoint;

    private grpc:Client grpcClient;

    public function init(string url, grpc:ClientConfiguration? config = ()) {
        // initialize client endpoint.
        self.grpcClient = new(url, config);
        checkpanic self.grpcClient.initStub(self, "blocking", ROOT_DESCRIPTOR, getDescriptorMap());
    }

    public remote function getStartLocation(CabDetails req, grpc:Headers? headers = ()) returns ([Location, grpc:Headers]|grpc:Error) {
        
        var payload = check self.grpcClient->blockingExecute("CabService/getStartLocation", req, headers);
        grpc:Headers resHeaders = new;
        anydata result = ();
        [result, resHeaders] = payload;
        
        return [<Location>result, resHeaders];
        
    }

};

public type CabServiceClient client object {

    *grpc:AbstractClientEndpoint;

    private grpc:Client grpcClient;

    public function init(string url, grpc:ClientConfiguration? config = ()) {
        // initialize client endpoint.
        self.grpcClient = new(url, config);
        checkpanic self.grpcClient.initStub(self, "non-blocking", ROOT_DESCRIPTOR, getDescriptorMap());
    }

    public remote function getStartLocation(CabDetails req, service msgListener, grpc:Headers? headers = ()) returns (grpc:Error?) {
        
        return self.grpcClient->nonBlockingExecute("CabService/getStartLocation", req, msgListener, headers);
    }

};

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
        "unary.proto":"0A0B756E6172792E70726F746F22580A084C6F636174696F6E12120A046E616D6518012001280952046E616D65121A0A086C6174697475646518022001280552086C61746974756465121C0A096C6F6E67697475646518032001280552096C6F6E676974756465222A0A0A43616244657461696C73121C0A096361624E756D62657218012001280952096361624E756D62657232380A0A43616253657276696365122A0A1067657453746172744C6F636174696F6E120B2E43616244657461696C731A092E4C6F636174696F6E620670726F746F33"
        
    };
}

