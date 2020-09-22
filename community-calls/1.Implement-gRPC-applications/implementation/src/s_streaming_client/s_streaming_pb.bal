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

import ballerina/grpc;

public type CabServiceClient client object {

    *grpc:AbstractClientEndpoint;

    private grpc:Client grpcClient;

    public function init(string url, grpc:ClientConfiguration? config = ()) {
        // initialize client endpoint.
        self.grpcClient = new(url, config);
        checkpanic self.grpcClient.initStub(self, "non-blocking", ROOT_DESCRIPTOR, getDescriptorMap());
    }

    public remote function getCurrentLocation(CabDetails req, service msgListener, grpc:Headers? headers = ()) returns (grpc:Error?) {
        
        return self.grpcClient->nonBlockingExecute("CabService/getCurrentLocation", req, msgListener, headers);
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



const string ROOT_DESCRIPTOR = "0A11735F73747265616D696E672E70726F746F22580A084C6F636174696F6E12120A046E616D6518012001280952046E616D65121A0A086C6174697475646518022001280552086C61746974756465121C0A096C6F6E67697475646518032001280552096C6F6E676974756465222A0A0A43616244657461696C73121C0A096361624E756D62657218012001280952096361624E756D626572323C0A0A43616253657276696365122E0A1267657443757272656E744C6F636174696F6E120B2E43616244657461696C731A092E4C6F636174696F6E3001620670726F746F33";
function getDescriptorMap() returns map<string> {
    return {
        "s_streaming.proto":"0A11735F73747265616D696E672E70726F746F22580A084C6F636174696F6E12120A046E616D6518012001280952046E616D65121A0A086C6174697475646518022001280552086C61746974756465121C0A096C6F6E67697475646518032001280552096C6F6E676974756465222A0A0A43616244657461696C73121C0A096361624E756D62657218012001280952096361624E756D626572323C0A0A43616253657276696365122E0A1267657443757272656E744C6F636174696F6E120B2E43616244657461696C731A092E4C6F636174696F6E3001620670726F746F33"
        
    };
}

