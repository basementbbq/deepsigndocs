---
title: DeepSign API Reference

language_tabs: # must be one of https://github.com/rouge-ruby/rouge/wiki/List-of-supported-languages-and-lexers
  - shell
  - java
  - csharp
  - http

toc_footers:
  - <a href='https://github.com/slatedocs/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true

code_clipboard: true

meta:
  - name: description
    content: Documentation for the DeepSign API
---

# Introduction

Welcome to the DeepSign API ! The DeepSign API endpoints is relatively easy to use. 

Before you can access the DeepSign API endpoints, you have to be registered with DeepSign as a partner. During this 
process you receive a partner identification which can be used to create a DeepSign Service User on a customers DeepBox account.  There are
various way of configuring this stage, which depend on the solution being implemented.  For example, if the integration is a web based 
solution then web hooks can be used to retrieve service user credential, otherwise there are manual ways to integrate service user for 
non-web based solutions.

Please contact DeepSign development personnel to determine the best way to integrate the partner access for an integration.    

# Authentication

Authentication uses standard OAuth technologies to access the DeepSign API's.  The method may vary slightly depending on the DeepSign registration
method.  For example, the authentication may or may not use a JSON Web Key Set (JWKS).  The authentication via the DeepSign platform
retrieves the access token.  The access token is then used in the "Authorization" HTTP header to validate the access to the customer's DeepSign.

> The "access_token" retrieved from the OAuth authentication is used to validate the requests for DeepSign. The access_token is used in the Authorization HTTP Header as shown below.

```java
// No example available

```

```csharp
// No java example available

```

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here" \
  -H "Authorization: Bearer eyJhbGciOiJSUzI1NiIsI...[abbreviated for display]...PsdqNfifKC9r5JKVoQ"
```

All DeepSign API calls require the "Authorization" header to be included in requests as shown below:

`Authorization: Bearer eyJhbGciOiJSUzI1NiIsI...[abbreviated for display]...PsdqNfifKC9r5JKVoQ`

<aside class="notice">
Make sure to replace <code>eyJhbGciOiJSUzI1NiIsI...[abbreviated for display]...PsdqNfifKC9r5JKVoQ</code> with the DeepSign API access token.
</aside>

# Upload Document

## Upload PDF file to DeepSign

```java
// No java example available

```

```csharp
// No java example available

```

```http
POST /api/v1/documents/file HTTP/1.1
Accept-Charset: UTF-8
Accept: application/json
Content-Type: multipart/form-data; boundary=---------9B82F53A7B2247AB8B5B9707CBB0DFD2
Authorization: Bearer eyJhbGciOiJSUzI1NiIsI...[abbreviated for display]...PsdqNfifKC9r5JKVoQ
Content-Length: 27896

-----------9B82F53A7B2247AB8B5B9707CBB0DFD2
Content-Disposition: form-data; name="data"
Content-Type: application/json; charset=UTF-8
Content-Transfer-Encoding: 8bit

{
  "companyId": "09795a43-baaf-48ae-91a6-a533168f803a",
  "initiatorAliasName":"Mr. Tester",
  "comment":"PDF file for testing",
  "signatureMode":"timestamp"
}
-----------9B82F53A7B2247AB8B5B9707CBB0DFD2
Content-Disposition: form-data; name="file"; filename="example.pdf"
Content-Type: application/pdf
Content-Transfer-Encoding: binary

%PDF-1.4
%äüöß
2 0 obj
&lt;&lt;/Length 3 0 R/Filter/FlateDecode&gt;&gt;
stream
   ...[abbreviated for display]...
trailer
&lt;&lt;/Size 14/Root 12 0 R
/Info 13 0 R
/ID [ &lt;853D3233C8F28B5C661255FC0C316B56&gt;
&lt;853D3233C8F28B5C661255FC0C316B56&gt; ]
/DocChecksum /0F3E7CFA8C22C3D6D3FF7F1AD91C10B8
&gt;&gt;
startxref
26698
%%EOF

-----------E2E5A3B22A5B4756AD25BD8403C2D731--
```

```shell
curl -X POST --location "https://api.sign.deepbox.swiss/api/v1/documents/file" \
                -H "Authorization: Bearer ..." -H "Content-Type: multipart/form-data" \ 
                -F "file=@/path/to/example.pdf;type=application/pdf" \
                -F "data={\"companyId\": \"09795a43-baaf-48ae-91a6-a533168f803a\"};type=application/json" 
```


> The above request returns JSON structured like this:

```json
{
  "documentId":"bb602c43-caae-4656-a447-233b2317b14a",
  "documentName":"example.pdf",
  "documentMimeType":"application/pdf",
  "documentUrl":"https://bb.storage.deepbox.swiss/deepsign/data/bb/60/2c/43-caae...[abbreviated for display]...a2d873ba6e0c2583dd8a",
  "thumbnailUrl":null,
  "companyId":"09795a43-baaf-48ae-91a6-a533168f803a",
  "creationTime":"2022-12-13T12:10:16.650+00:00",
  "startTime":null,
  "completionTime":null,
  "documentStatus":"draft",
  "signatureMode":"timestamp",
  "jurisdiction":"zertes",
  "authorityService":"ras",
  "comment":"PDF file for testing",
  "initiatorCompanyDisplayName":"Abacus Software AG",
  "initiatorCompanyIsVerified":true,
  "initiatorCompanyVerificationType":"strong",
  "initiatorDisplayName":"Mr. Tester",
  "initiatorDisplayEmail":null,
  "initiatorSignKey":null,
  "signees":[],
  "signeesOrdered":[],
  "attachmentsAllowed":false
}
```

This endpoint upload a PDF document to DeepSign.

### HTTP Request

`POST https://api.sign.deepbox.swiss/api/v1/documents/file`

### Swagger Reference

<a class="swagger_link" style="text-decoration: none; color: #000000;" href="https://api.sign.deepbox.swiss/swagger-ui/index.html?configUrl=/api-docs/swagger-config#/document-rest-controller/addDocumentFile" target="abacusswaggerapi" ><span class="swagger_post_button">POST</span><span class="swagger_post_link">/api/v1/documents/file</span></a>

### Message Structure
The document upload is a 2 part, multipart mime POST request. The first part contains the JSON information for the document being uploaded and a the second part contains the binary encoded document (i.e. pdf file).
The following headers should be present in the Request when uploading document files :


Accept: application/json<br/>
Content-Type: multipart/form-data

<strong>Note:</strong> Each multipart mime part must also contain the &quot;Content-Disposition&quot; header specifiying the &quot;name&quot; for each section.
<br/>
For example :

Part | Required Header
--------- | -----------
data | Content-Disposition: form-data; name="data"
file | Content-Disposition: form-data; name="file"; filename="example.pdf"

as shown in the HTTP example.

<aside class="success">
After uploading a document to DeepSign the &quot;documentStatus&quot; will be set to &quot;draft&quot;.
</aside>

# Get Document Overview

```java
// No example available

```

```csharp
// No example available

```

```shell
curl -H "Authorization: Bearer eyJhbGciOiJSUzI1NiIsI...[abbreviated for display]...PsdqNfifKC9r5JKVoQ" \ 
       "https://api.sign.deepbox.swiss/api/v1/overview?offset=0&limit=50"
```

```http
GET /api/v1/overview?offset=0&limit=50 HTTP/1.1
Accept-Charset: UTF-8
Accept: application/json
Authorization: Bearer eyJhbGciOiJSUzI1NiIsI...[abbreviated for display]...PsdqNfifKC9r5JKVoQ

```

> The above request returns JSON structured like this:

```json
{
  "documentId":"bb602c43-caae-4656-a447-233b2317b14a",
  "documentName":"example.pdf",
  "documentMimeType":"application/pdf",
  "documentUrl":"https://bb.storage.deepbox.swiss/deepsign/data/bb/60/2c/43-caae...[abbreviated for display]...a2d873ba6e0c2583dd8a",
  "thumbnailUrl":null,
  "companyId":"09795a43-baaf-48ae-91a6-a533168f803a",
  "creationTime":"2022-12-13T12:10:16.650+00:00",
  "startTime":null,
  "completionTime":null,
  "documentStatus":"draft",
  "signatureMode":"timestamp",
  "jurisdiction":"zertes",
  "authorityService":"ras",
  "comment":"PDF file for testing",
  "initiatorCompanyDisplayName":"Abacus Software AG",
  "initiatorCompanyIsVerified":true,
  "initiatorCompanyVerificationType":"strong",
  "initiatorDisplayName":"Mr. Tester",
  "initiatorDisplayEmail":null,
  "initiatorSignKey":null,
  "signees":[],
  "signeesOrdered":[],
  "attachmentsAllowed":false
}
```

This endpoint retrieves the overview of all available documents on the DeepSign server

### HTTP Request

`GET https://api.sign.deepbox.swiss/api/v1/overview?offset=0&limit=50`

### URL Parameters

Parameter | Description
--------- | -----------
offset | The offset of the starting document to retrieve
limit | The maximum number of documents that should be retrieved for the request

The URL Parameters are optional

### Swagger Reference

<a class="swagger_link" style="text-decoration: none; color: #000000;" href="https://api.sign.deepbox.swiss/swagger-ui/index.html?configUrl=/api-docs/swagger-config#/overview-rest-controller/getOverview" target="abacusswaggerapi" ><span class="swagger_get_button">GET</span><span class="swagger_get_link">/api/v1/overview</span></a>



The Document Overview returns the general information and status about each document.  More detailed information about a document can be 
retrieved with the GET Request using the Document ID 

# Add a Signee

```java
// No java example available

```

```csharp
// No csharp example available

```

```shell
curl -X POST --location "https://api.sign.deepbox.swiss/api/v1/documents/bb602c43-caae-4656-a447-233b2317b14a/signees" \
  -H "Authorization: Bearer eyJhbGciOiJSUzI1NiIsI...[abbreviated for display]...PsdqNfifKC9r5JKVoQ" \
  -H "Content-Type: application/json" \
  -d '{"email":"test.person@abacus.ch","comment":"Please sign the PDF file","signOrder":0}'
```

```http
POST /api/v1/documents/bb602c43-caae-4656-a447-233b2317b14a/signees HTTP/1.1
Accept-Charset: UTF-8
Accept: application/json
Content-Type: application/json
Authorization: Bearer eyJhbGciOiJSUzI1NiIsI...[abbreviated for display]...PsdqNfifKC9r5JKVoQ
Content-Length: 68

{
  "email": "test.person@abacus.ch",
  "comment": "Please sign the PDF file",
  "signOrder": 0
}
```

> The above request returns JSON structured like this:

```json
{
  "signeeId":"56f16b80-0058-44d8-bf33-2847612b24b1",
  "email":"test.person@abacus.ch",
  "signUrl":null,
  "documentId":"bb602c43-caae-4656-a447-233b2317b14a",
  "viewedTime":null,
  "signedTime":null,
  "completionTime":null,
  "signStatus":"on-hold",
  "initiatorComment":"PDF file for testing",
  "signeeComment":null,
  "language":null,
  "autographPosition":null,
  "signOrder":0,
  "policy":
  {
    "canModifyAutographPosition":true
  }
}
```

This endpoint adds specific signee to a DeepSign document

### HTTP Request

`POST /api/v1/documents/{documentId}/signees`

### URL Parameters

Parameter | Description
--------- | -----------
documentId | The ID of the document where the signee is added

### Swagger Reference

<a class="swagger_link" style="text-decoration: none; color: #000000;" href="https://api.sign.deepbox.swiss/swagger-ui/index.html?configUrl=/api-docs/swagger-config#/signee-rest-controller/addSignee" target="abacusswaggerapi" ><span class="swagger_post_button">POST</span><span class="swagger_post_link">/api/v1/documents/{documentId}/signees</span></a>


<aside class="notice">
Make sure the HTTP Header "Content-Type: application/json" is used, otherwise an error may occur.
</aside>

# Add an Observer

```java
// No java example available

```

```csharp
// No csharp example available

```

```shell
curl -X POST --location "https://api.sign.deepbox.swiss/api/v1/documents/bb602c43-caae-4656-a447-233b2317b14a/observers" \
  -H "Authorization: Bearer eyJhbGciOiJSUzI1NiIsI...[abbreviated for display]...PsdqNfifKC9r5JKVoQ" \
  -H "Content-Type: application/json" \
  -d '{"email":"test.person@abacus.ch","comment":"Observer for PDF file","isAdmin":false}'
```

```http
POST /api/v1/documents/bb602c43-caae-4656-a447-233b2317b14a/observers HTTP/1.1
Accept-Charset: UTF-8
Accept: application/json
Content-Type: application/json
Authorization: Bearer eyJhbGciOiJSUzI1NiIsI...[abbreviated for display]...PsdqNfifKC9r5JKVoQ
Content-Length: 68

{
  "email": "test.person@abacus.ch",
  "comment": "Observer for PDF file",
  "isAdmin": false
}
```

> The above request returns JSON structured like this:

```json
{
  "observerId":"3fa85f64-5717-4562-b3fc-2c963f66afa6",
  "email":"test.person@abacus.ch",
  "signUrl":"string",
  "documentId":"bb602c43-caae-4656-a447-233b2317b14a",
  "viewedTime":null,
  "initiatorComment":"Observer for PDF file",
  "language":"de",
  "isAdmin":false
}
```

This endpoint adds specific observer to a DeepSign document

<aside class="success">
Observers can view the PDF document and check the current status. If the observer is set as Administrator, they can view the
PDF Document in their DeepSign cockpit, and have full administrator access to the sign process.
</aside>

### HTTP Request

`POST /api/v1/documents/{documentId}/observers`

### URL Parameters

Parameter | Description
--------- | -----------
documentId | The ID of the document where the observer is added

### Swagger Reference

<a class="swagger_link" style="text-decoration: none; color: #000000;" href="https://api.sign.deepbox.swiss/swagger-ui/index.html?configUrl=/api-docs/swagger-config#/observer-rest-controller/addObserver" target="abacusswaggerapi" ><span class="swagger_post_button">POST</span><span class="swagger_post_link">/api/v1/documents/{documentId}/observers</span></a>


<aside class="notice">
Make sure the HTTP Header "Content-Type: application/json" is used, otherwise an error may occur.
</aside>


# Start Sign Process

```java
// No java example available

```

```csharp
// No csharp example available

```

```shell
curl -X PUT --location "https://api.sign.deepbox.swiss/api/v1/documents/bb602c43-caae-4656-a447-233b2317b14a/start" \
  -H "Authorization: Bearer eyJhbGciOiJSUzI1NiIsI...[abbreviated for display]...PsdqNfifKC9r5JKVoQ" \
  -H "Content-Type: application/json"
```

```http
PUT /api/v1/documents/bb602c43-caae-4656-a447-233b2317b14a/start HTTP/1.1
Accept-Charset: UTF-8
Accept: application/json
Authorization: Bearer eyJhbGciOiJSUzI1NiIsI...[abbreviated for display]...PsdqNfifKC9r5JKVoQ
```

> The above request returns and empty response with HTTP 204 No Content
> <br/>HTTP/1.1 204 No Content

After all the signees have been added to a DeepSign document, the sign process can be started.

<aside class="notice">
Once the sign process has been started, additional changes to most document properties, signees, observers, etc. are no longer possible.
</aside>

### HTTP Request

`POST /api/v1/documents/{documentId}/start`

### Swagger Reference

<a class="swagger_link" style="text-decoration: none; color: #000000;" href="https://api.sign.deepbox.swiss/swagger-ui/index.html?configUrl=/api-docs/swagger-config#/document-rest-controller/startDocument" target="abacusswaggerapi" ><span class="swagger_put_button">PUT</span><span class="swagger_put_link">/api/v1/documents/{documentId}/start</span></a>



# Withraw Document

```java
// No java example available

```

```csharp
// No csharp example available

```

```shell
curl -X PUT --location "https://api.sign.deepbox.swiss/api/v1/documents/bb602c43-caae-4656-a447-233b2317b14a/withdraw" \
  -H "Authorization: Bearer eyJhbGciOiJSUzI1NiIsI...[abbreviated for display]...PsdqNfifKC9r5JKVoQ" \
  -H "Content-Type: application/json"
```

```http
PUT /api/v1/documents/bb602c43-caae-4656-a447-233b2317b14a/withdraw HTTP/1.1
Accept-Charset: UTF-8
Accept: application/json
Authorization: Bearer eyJhbGciOiJSUzI1NiIsI...[abbreviated for display]...PsdqNfifKC9r5JKVoQ
```

> The above request returns and empty response with HTTP 204 No Content
> <br/>HTTP/1.1 204 No Content

Withdraws a Document from signing process. after the signing process has been started.

<aside class="notice">
Once the document has been withdrawn the signing process cannot be restarted.  The document must be uploaded to DeepSign again, as a new document.
</aside>

### HTTP Request

`POST /api/v1/documents/{documentId}/withdraw`

### Swagger Reference

<a class="swagger_link" style="text-decoration: none; color: #000000;" href="https://api.sign.deepbox.swiss/swagger-ui/index.html?configUrl=/api-docs/swagger-config#/document-rest-controller/withdrawDocument" target="abacusswaggerapi" ><span class="swagger_put_button">PUT</span><span class="swagger_put_link">/api/v1/documents/{documentId}/withdraw</span></a>


