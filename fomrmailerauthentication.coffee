############################################################
import { masterAuthentication, clientAuthentication } from "./authenticationfunctions.js"

############################################################
## Client Functions
############################################################
export getAuthCode = (req) -> await clientAuthentication(req.path, req.body)
############################################################
export sendForm = (req) -> await clientAuthentication(req.path, req.body)

############################################################
## Master Functions
############################################################
export setSiteId = (req) -> await masterAuthentication(req.path, req.body)
############################################################
export setCredentials = (req) -> await masterAuthentication(req.path, req.body)
############################################################
export removeOrigin = (req) -> await masterAuthentication(req.path, req.body)
############################################################
export getOrigins = (req) -> await masterAuthentication(req.path, req.body)
############################################################
export getBlockedIps = (req) -> await masterAuthentication(req.path, req.body)
############################################################
export resetBlockedIps = (req) -> await masterAuthentication(req.path, req.body)
