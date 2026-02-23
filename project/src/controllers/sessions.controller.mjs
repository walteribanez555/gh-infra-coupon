import { getSession, postSession } from "../models/sessions.controller.mjs";


export function getSessions({ id }) { 
    return getSession({id});
}

export function postSessions({ data, sourceIp }){
    return postSession({data,sourceIp });
}