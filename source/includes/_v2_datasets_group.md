# /v2/datasets/{group}/

**Summary:** List available datasets within a group

**Description:** The /v2/datasets/{group}/ endpoint lists all the datasets with
current data, with a small amount of metadata, and URLs for the
endpoints that extract data.

**Endpoint** `/v2/datasets/{group}/`

**Method** `GET`


```shell
curl --location --request GET https://api.tidetech.org/v2/datasets/currents/ \
--user "my_api_key:my_api_secret"
```

```javascript
const axios = require("axios")

const apikey = "my_api_key";
const apisecret = "my_api_secret"
const url = "https://api.tidetech.org/v2/datasets/currents/"

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
url = "https://api.tidetech.org/v2/datasets/currents/"

with requests.get(url, auth=(apikey, apisecret)) as r:
  r.raise_for_status()
  print(r.json())
```

```csharp
string apikey = "my_api_key";
string apisecret = "my_api_secret";
string url = "https://api.tidetech.org/v2/datasets/currents/";

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
  url = "https://api.tidetech.org/v2/datasets/currents/"
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
url <- "https://api.tidetech.org/v2/datasets/currents/"

req <- GET(url, authenticate(apikey, apisecret, type="basic"))
output <- prettify(content(req, "text"))

print(output)
```

> Make sure to replace `my_api_key` and `my_api_secret` with your API Key and Secret.


**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| group | path | dataset group id | Yes | string |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | JSON object containing list of group datasets |


> The above command returns json structured like this (shortened for brevity):

```json
{
    "data": [
        {
            "type": "dataset",
            "id": "baltic_sea_currents",
            "name": "Baltic Sea Currents",
            "group": "Currents",
            "description": "Baltic Sea ocean currents model",
            "resolution_x": 0.028,
            "resolution_y": -0.0167,
            "timestep_duration": "PT3600.0S",
            "links": {
                "self": "https://api.tidetech.org/v2/datasets/currents/baltic_sea_currents/",
                "points": "https://api.tidetech.org/v2/datasets/currents/baltic_sea_currents/points/",
                "area": "https://api.tidetech.org/v2/datasets/currents/baltic_sea_currents/area/",
                "forecast": "https://api.tidetech.org/v2/datasets/currents/baltic_sea_currents/forecast/"
            }
        },
        ...other datasets within the group
    ]
}
```