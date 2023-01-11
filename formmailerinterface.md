###### tags: `documentation` `sci`

# [formmailerinterface](https://github.com/JhonnyJason/formmailerinterface) v0.1
The SCI for the [Form Mailer Service](https://github.com/JhonnyJason/form-mailer-service)

## Client Functions
These are the function for the client. The client is most likely a website which has been set up to send it's formData via our the [Form Mailer Service](https://github.com/JhonnyJason/form-mailer-service). 

### /getAuthCode
Before any request to `/sendForm` we need an `authCode`. 
Our spam protection works on multiple levels an important key is a separate `authCode`.

The `formId` must match the assigned `formId` for the origin.

*Hint: At best send the request to /getAuthCode right when the page with the Form is being loaded.*

#### request
```json
{
    "formId": "..."
}
```

In the response we get the `authCode` which we may use to send the `formData`.

*Note: This authCode is unique only valid once (OVANCE). Also it has a particular time-pattern for which it is valid.*

#### response
```json
{
    "authCode": "..."
}
```

### /sendForm
Call this on submit of the form. 

#### request
```json
{
    "authCode": "...",
    "formData": {...}
}
```

#### response
```json
{
    "ok": true
}

```


## Master Functions
These are the functions for the administrator.

TODO

> ### /addClientToServe
>
> This will add the`clientPublicKey` to the `toServeList` of the corresponding service.
> In a second step the service starts to accept secrets from this client.
>
> #### request
> ```json
>  {
>     "clientPublicKey": "...",
>     "timestamp": "...",
>     "nonce": "...",
>     "signature": "..."
> }
> ```
>
> #### response
> ```json
> {
>    "ok": true
> }
> ```

---

# License
[Unlicense JhonnyJason style](https://hackmd.io/nCpLO3gxRlSmKVG3Zxy2hA?view)
