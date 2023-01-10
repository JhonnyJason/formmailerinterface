############################################################
import * as h from "./authenticationhandlers"
import { performance } from "node:perf_hooks"

############################################################
import { argumentValidators as validate } from "./formmailerschemas.js"
import *  as authentication from "./formmailerauthentication.js"


############################################################
#region Client Functions

############################################################
export getAuthCode = (req, res) ->
    start = performance.now()

    try validate.getAuthCode(req.body)
    catch err then return res.status(400).send({error: "validation: #{err.message}"})

    try await authentication.getAuthCode(req)
    catch err then return res.status(401).send({error: "authentication: #{err.message}"})

    try response = await h.getAuthCode(req)
    catch err then return res.send({error: "execution: #{err.message}"})
    
    end = performance.now()
    diffMS = end - start
    console.log("/getAuthCode took #{diffMS}ms\n")

    return res.send(response)

############################################################
export sendForm = (req, res) ->
    start = performance.now()

    try validate.sendForm(req.body)
    catch err then return res.status(400).send({error: "validation: #{err.message}"})

    try await authentication.sendForm(req)
    catch err then return res.status(401).send({error: "authentication: #{err.message}"})

    # response = await h.sendForm(req.body.publicKey, req.body.timestamp, req.body.signature)
    try response = await h.sendForm(req)
    catch err then return res.send({error: "execution: #{err.message}"})
    
    end = performance.now()
    diffMS = end - start
    console.log("/sendForm took #{diffMS}ms\n")

    return res.send(response)

#endregion

############################################################
#region Master Functions

# export removeClientToServe = (req, res) ->
#     start = performance.now()
    
#     try validate.removeClientToServe(req.body)
#     catch err then return res.status(400).send({error: "validation: #{err.message}"})

#     try await authentication.removeClientToServe(req)
#     catch err then return res.status(401).send({error: "authentication: #{err.message}"})

#     # response = await h.removeClientToServe(req.body.clientPublicKey, req.body.timestamp, req.body.signature)
#     try response = await h.removeClientToServe(req)
#     catch err then return res.send({error: "execution: #{err.message}"})

#     end = performance.now()
#     diffMS = end - start
#     console.log("/removeClientToServe took #{diffMS}ms\n")
    
#     return res.send(response)

#endregion
