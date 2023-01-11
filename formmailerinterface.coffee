import { postData } from "thingy-network-base"

############################################################
export getAuthCode = (sciURL, formId) ->
    requestObject = { formId }
    requestURL = sciURL+"/getAuthCode"
    return postData(requestURL, requestObject)

export sendForm = (sciURL, authCode, formData) ->
    requestObject = { authCode, formData }
    requestURL = sciURL+"/sendForm"
    return postData(requestURL, requestObject)
