import { postData } from "thingy-network-base"

############################################################
export getAuthCode = (sciURL, siteId) ->
    requestObject = { siteId }
    requestURL = sciURL+"/getAuthCode"
    return postData(requestURL, requestObject)

export sendForm = (sciURL, authCode, formData) ->
    requestObject = { authCode, formData }
    requestURL = sciURL+"/sendForm"
    return postData(requestURL, requestObject)
