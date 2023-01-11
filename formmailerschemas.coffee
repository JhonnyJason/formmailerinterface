import {
    NUMBER, STRING, STRINGHEX, STRINGHEX32, STRINGHEX64, STRINGHEX128, BOOLEAN, ARRAY, NUMBERORNULL, OBJECT, validate
} from "thingy-schema-validate"


############################################################
#region Arguments

############################################################
## Client Functions

getAuthCodeArguments = {
    formId: STRINGHEX64
}

############################################################
sendFormArguments = {
    authCode: STRINGHEX64
    formData: OBJECT
}

############################################################
## Master Functions

#endregion


############################################################
#region Responses

############################################################
## Client Functions

getAuthCodeResponse = {
    authCode: STRINGHEX64
}

############################################################
## Master Functions

#endregion


############################################################
export responseValidators = {
    ## Client Functions
    getAuthCode: (response) -> validate(response, getAuthCodeResponse)
    sendForm: -> true
    
    ## Master Functions

}

export argumentValidators = {
    ## Client Functions
    getAuthCode: (args) -> validate(args, getAuthCodeArguments)
    sendForm: (args) -> validate(args, sendFormArguments)
    
    ## Master Functions
}