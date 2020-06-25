# /v2/datasets/{group}/{dataset}/

**Summary:** Dataset metadata

**Description:** The /v2/datasets/{group}/{dataset}/ endpoint returns all the
available metadata for that dataset.

**Endpoint** `/v2/datasets/{group}/{dataset}/`

**Method** `GET`

<aside class="notice">
See the <a href='#metadata'>Metadata</a> section for more details.
</aside>

```shell
curl --location --request GET https://api.tidetech.org/v2/datasets/currents/baltic_sea_currents/ \
--user "my_api_key:my_api_secret"
```

```javascript
const axios = require("axios")

const apikey = "my_api_key";
const apisecret = "my_api_secret"
const url = "https://api.tidetech.org/v2/datasets/currents/baltic_sea_currents/"

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
url = "https://api.tidetech.org/v2/datasets/currents/baltic_sea_currents/"

response = request("GET", url, auth=(apikey, apisecret))

print(response.json())
```

```csharp
string apikey = "my_api_key";
string apisecret = "my_api_secret";
string url = "https://api.tidetech.org/v2/datasets/currents/baltic_sea_currents/";

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
  url = "https://api.tidetech.org/v2/datasets/currents/baltic_sea_currents/"
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
url <- "https://api.tidetech.org/v2/datasets/currents/baltic_sea_currents/"

req <- GET(url, authenticate(apikey, apisecret, type="basic"))
output <- prettify(content(req, "text"))

print(output)
```

> Make sure to replace `my_api_key` and `my_api_secret` with your API Key and Secret.


**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| group | path | dataset group id | Yes | string |
| dataset | path | dataset id | Yes | string |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | JSON object containing dataset metadata |


> The above command returns json structured like this:


```json
{
    "data": {
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
        },
        "parameters": [
            {
                "id": "UOGRD",
                "long_name": null,
                "description": "u-component of current",
                "grib_code": 49,
                "var_code": 49,
                "units": "m/s",
                "unit_long": "Metres per second",
                "fill_value": -9999
            },
            {
                "id": "VOGRD",
                "long_name": null,
                "description": "v-component of current",
                "grib_code": 50,
                "var_code": 50,
                "units": "m/s",
                "unit_long": "Metres per second",
                "fill_value": -9999
            }
        ],
        "start_timestep": "2019-05-26T12:00:00+00:00",
        "end_timestep": "2020-05-30T23:00:00+00:00",
        "forecast_timestep": "2020-05-26T00:00:00+00:00",
        "dataset_bounds": {
            "lon_min": 9.023,
            "lon_max": 30.499,
            "lat_min": 52.9909,
            "lat_max": 65.9
        }
    }
}
```
