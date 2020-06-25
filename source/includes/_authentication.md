# Authentication

There are only limited sample datasets available without authentication. To access all datasets enabled in your subscription, you must supply valid authentication details with your request.


## Authenticated access


### API Key and Secret

You can generate as many API keys as you require, and use them across your applications as you desire via the <a href='https://portal.tidetech.org'>Tidetech Portal</a>. Individual API keys can be revoked without removing access for other applications using different API keys. You do not need to expose your password in every deployment of your application. Additionally, API keys are tied to an organisation instead of a user, so if a user is removed from an organisation, any applications they have set up will continue to function using the API key.


### Email address and password

You can also use your email address and password to authenticate your application with the API, although we don't recommend this method because it requires exposing your password everywhere you would like to use the API. Changing your password requires changing it everywhere you have used it, and if your password is exposed once, you can not disable just that one location.

Using an API Key and Secret solves these issues.


### HTTP Basic authentication

```shell
curl --location --request GET https://api.tidetech.org/v2/auth/ \
--user "my_api_key:my_api_secret"
```

```javascript
const axios = require("axios")

const apikey = "my_api_key";
const apisecret = "my_api_secret"
const url = "https://api.tidetech.org/v2/auth/"

axios.get(url, {
  auth: {
    username: apikey,
    password: apisecret,
  }
}).then((response) => {
  console.log(response.data)
}).catch((error) => {
  console.log(error)
})
```

```python
from requests import request

apikey = "my_api_key"
apisecret = "my_api_secret"
url = "https://api.tidetech.org/v2/auth/"

response = request("GET", url, auth=(apikey, apisecret))

print(response.json())
```

```csharp
string apikey = "my_api_key";
string apisecret = "my_api_secret";
string url = "https://api.tidetech.org/v2/auth/";

var client = new RestClient(url);
client.Authenticator = new HttpBasicAuthenticator(apikey, apisecret);
client.Timeout = -1;

var request = new RestRequest(Method.GET);

var response = client.Execute(request);
Console.WriteLine(response.Content);
```

```go
package main

import (
  "fmt"
  "net/http"
  "io/ioutil"
)

const (
  apikey = "my_api_key"
  apisecret = "my_api_secret"
  url = "https://api.tidetech.org/v2/auth/"
)

func main() {

  method := "GET"

  client := &http.Client {}
  req, err := http.NewRequest(method, url, nil)

  if err != nil {
    fmt.Println(err)
  }
  req.SetBasicAuth(apikey, apisecret)
  res, _ := client.Do(req)
  defer res.Body.Close()
  body, _ := ioutil.ReadAll(res.Body)

  fmt.Println(string(body))
}
```

```r
library('httr')
library('jsonlite')

apikey <- "my_api_key"
apisecret <- "my_api_secret"
url <- "https://api.tidetech.org/v2/auth/"

req <- GET(url, authenticate(apikey, apisecret, type="basic"))
output <- prettify(content(req, "text"))

print(output)
```

> Make sure to replace `my_api_key` and `my_api_secret` with your API Key and Secret.

> The above command returns json structured like this:

```json
{
  "authenticated_as": {
    "type": "api-key",
    "id": "my_api_key",
    "organisation": "Test organisation"
  }
}
```

Using HTTP Basic authentication is the simplest authentication method, and is widely supported. You can use an API Key and Secret, which  attached to your organisation authenticate using your email address and password, or you can use an API key and secret attached to your organisation.


## Anonymous access

```shell
curl --location --request GET https://api.tidetech.org/v2/auth/
```

```python
from requests import request

url = "https://api.tidetech.org/v2/auth/"

response = request("GET", url)

print(response.json())
```

```javascript
const axios = require("axios")

const url = "https://api.tidetech.org/v2/auth/"

axios.get(url)
  .then((response) => {
    console.log(response.data)
  }).catch((error) => {
    console.log(error)
  })
```

```csharp
string url = "https://api.tidetech.org/v2/auth/";

var client = new RestClient(url);
client.Timeout = -1;

var request = new RestRequest(Method.GET);

var response = client.Execute(request);
Console.WriteLine(response.Content);
```

```go
package main

import (
  "fmt"
  "net/http"
  "io/ioutil"
)

const url = "https://api.tidetech.org/v2/auth/"

func main() {

  method := "GET"

  client := &http.Client {}
  req, err := http.NewRequest(method, url, nil)

  if err != nil {
    fmt.Println(err)
  }
  res, _ := client.Do(req)
  defer res.Body.Close()
  body, _ := ioutil.ReadAll(res.Body)

  fmt.Println(string(body))
}
```

```r
library('httr')
library('jsonlite')

url <- "https://api.tidetech.org/v2/auth/"

req <- GET(url)
output <- prettify(content(req, as="text"))

print(output)
```

> The above command returns json structured like this:

```json
{
    "authenticated_as": null
}
```

If you access the API without any authentication details, you will only be able to access the public datasets.


## Browser authentication

To view all of your datasets through the browser you must first authenticate your browser session. You can do this by navigating to <a href='https://api.tidetech.org/v2/?login=true'>https://api.tidetech.org/v2/?login=true</a>, which will provide a login form.
