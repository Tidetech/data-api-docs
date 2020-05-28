# /v2/datasets/

**Summary:** List available dataset groups

**Description:** The /v2/datasets/ endpoint lists all the dataset groups available
to you and their URLS.

**Endpoint** `/v2/datasets/`

**Method** `GET`


```shell
curl --location --request GET https://api.tidetech.org/v2/datasets/ \
--user "my_api_key:my_api_secret"
```

```javascript
const axios = require("axios")

const apikey = "my_api_key";
const apisecret = "my_api_secret"
const url = "https://api.tidetech.org/v2/datasets/"

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
url = "https://api.tidetech.org/v2/datasets/"

response = request("GET", url, auth=(apikey, apisecret))

print(response.json())
```

```csharp
string apikey = "my_api_key";
string apisecret = "my_api_secret";
string url = "https://api.tidetech.org/v2/datasets/";

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
  url = "https://api.tidetech.org/v2/datasets/"
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

> Make sure to replace `my_api_key` and `my_api_secret` with your API Key and Secret.

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | JSON object containing list of group objects |


> The above command returns json structured like this (shortened for brevity):

```json
{
    "data": [
        {
            "type": "group",
            "id": "currents",
            "name": "Currents",
            "description": "Currents",
            "datasets": 10,
            "links": {
                "datasets": "https://api.tidetech.org/v2/datasets/currents/"
            }
        },
        {
            "type": "group",
            "id": "meteorology",
            "name": "Meteorology",
            "description": "Meteorology",
            "datasets": 2,
            "links": {
                "datasets": "https://api.tidetech.org/v2/datasets/meteorology/"
            }
        },
        ...other dataset groups
    ]
}
```
