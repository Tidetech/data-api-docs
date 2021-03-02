# /v2/auth/

**Summary:** Check authentication status

**Description:** Check that you have successfully authenticated using the `/v2/auth/` endpoint. See the <a href='#authentication'>Authentication</a> section for more details.

**Endpoint** `/v2/auth/`

**Method** `GET`


```shell
curl --location --request GET https://api.tidetech.org/v2/auth/ \
--user 'my_api_key:my_api_secret'
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
import requests

apikey = "my_api_key"
apisecret = "my_api_secret"
url = "https://api.tidetech.org/v2/auth/"

with requests.get(url, auth=(apikey, apisecret)) as r:
  r.raise_for_status()
  print(r.json())
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

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | JSON object containing authenticated entity |
| 401 | Unauthorized |


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
