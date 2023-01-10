############################################################
import *  as service from "./servicefunctions.js"
import { responseValidators as validate} from "./formmailerschemas.js"

############################################################
ok = true

############################################################
#region Client Functions

############################################################
export getAuthCode = (req) ->
    response = await service.getAuthCode(req)

    try validate.getAuthCode(response)
    catch err then throw new Error("Error: service.getAuthCode - response format: #{err.message}")

    return response


############################################################
export sendForm = (req) -> 
    await service.sendForm(req)
    return {ok}

#endregion

############################################################
#region Master Functions

# ############################################################
# export addClientToServe = (req) ->
#     await service.addClientToServe(req)
#     return {ok:true}


#endregion

