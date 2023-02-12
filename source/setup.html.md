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

