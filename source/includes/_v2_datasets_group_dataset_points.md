# /v2/datasets/{group}/{dataset}/points/

**Summary:** Point data from dataset

**Description:** The /v2/datasets/{group}/{dataset}/points/ endpoint extracts
data from a dataset at one or more points, for one or more
parameters. The endpoint only accepts POST requests. POST
requests must be in JSON format, with the appropriate
Content-Type: application/json headers set.

**Endpoint** `/v2/datasets/{group}/{dataset}/points/`

**Method** `POST`


``` shell
curl --location --request POST https://api.tidetech.org/v2/datasets/waves/global_waves/points/ \
--user "my_api_key:my_api_secret" \
--header "Content-Type: application/json" \
--data-raw '{
    "points": [
        {
            "id": "multipoint",
            "point": {
                "coordinates": [
                	[-8.695, 50.079],
                	[-1.472, 50.1438]
                ],
                "type": "MultiPoint"
            },
            "timestep": "2020-05-27T06:00:00Z",
            "parameters": [
            	"HTSGW",
            	"DIRPW"
            ]
        }
    ]
}'
```

``` javascript
const axios = require("axios")
const apikey = "my_api_key"
const apisecret = "my_api_secret"
const url = "https://api.tidetech.org/v2/datasets/waves/global_waves/points/"
const payload = {
    "points": [
        {
            "id": "multipoint",
            "point": {
                "coordinates": [
                    [-8.695, 50.079],
                    [-1.472, 50.1438]
                ],
                "type": "MultiPoint"
            },
            "timestep": "2020-05-27T06:00:00Z",
            "parameters": [
                "HTSGW",
                "DIRPW"
            ]
        }
    ]
}

axios.post(url, payload, {
    auth: {
        username: apikey,
        password: apisecret,
    }
}).then((response) => {
    console.log(JSON.stringify(response.data))
}).catch((error) => {
    console.log(error);
})
```

``` python
import requests

apikey = "my_api_key"
apisecret = "my_api_secret"
url = "https://api.tidetech.org/v2/datasets/waves/global_waves/points/"
payload = {
    "points": [
        {
            "id": "multipoint",
            "point": {
                "coordinates": [
                    [-8.695, 50.079],
                    [-1.472, 50.1438]
                ],
                "type": "MultiPoint"
            },
            "timestep": "2020-05-27T06:00:00Z",
            "parameters": [
                "HTSGW",
                "DIRPW"
            ]
        }
    ]
}

with requests.post(url, json=payload, auth=(apikey, apisecret)) as r:
    r.raise_for_status()
    print(r.json())
```

``` csharp
string apikey = "my_api_key";
string apisecret = "my_api_secret";
string url = "https://api.tidetech.org/v2/datasets/waves/global_waves/points/";
var payload = "{" +
    "\"points\": [" +
        "{" +
            "\"id\": \"multipoint\"," +
            "\"point\": {" +
                "\"coordinates\": [" +
                    "[-8.695, 50.079]," +
                    "[-1.472,50.1438]" +
                "]," +
                "\"type\": \"MultiPoint\"" +
            "}," +
            "\"timestep\": \"2020-05-27T06:00:00Z\"," +
            "\"parameters\": [" +
                "\"HTSGW\"," +
                "\"DIRPW\"" +
            "]" +
        "}" +
    "]" +
"}";

var client = new RestClient(url);
client.Authenticator = new HttpBasicAuthenticator(apikey, apisecret);
client.Timeout = -1;

var request = new RestRequest(Method.POST);
request.AddHeader("Content-Type", "application/json");
request.AddJsonBody(payload);

IRestResponse response = client.Execute(request);
Console.WriteLine(response.Content);
```

``` go
package main

import (
    "fmt"
    "strings"
    "net/http"
    "io/ioutil"
)

const (
    apikey = "my_api_key"
    apisecret = "my_api_secret"
    url = "https://api.tidetech.org/v2/datasets/waves/global_waves/points/"
)

func main() {

    method := "POST"

    payload := strings.NewReader(`
    {
        "points": [
            {
                "id": "multipoint",
                "point": {
                    "coordinates": [
                        [-8.695, 50.079],
                        [-1.472, 50.1438]
                    ],
                    "type": "MultiPoint"
                },
                "timestep": "2020-05-27T06:00:00Z",
                "parameters": [
                    "HTSGW",
                    "DIRPW"
                ]
            }
        ]
    }
    `)

    client := &http.Client {}
    req, err := http.NewRequest(method, url, payload)

    if err != nil {
        fmt.Println(err)
    }
    req.SetBasicAuth(apikey, apisecret)
    req.Header.Add("Content-Type", "application/json")
    res, err := client.Do(req)
    defer res.Body.Close()
    body, err := ioutil.ReadAll(res.Body)

    fmt.Println(string(body))
}
```

```r
library('httr')
library('jsonlite')

apikey <- "my_api_key"
apisecret <- "my_api_secret"
url <- "https://api.tidetech.org/v2/datasets/waves/global_waves/points/"

payload <- '{
    "points": [
        {
            "id": "multipoint",
            "point": {
                "coordinates": [
                    [-8.695, 50.079],
                    [-1.472, 50.1438]
                ],
                "type": "MultiPoint"
            },
            "timestep": "2020-05-27T06:00:00Z",
            "parameters": [
                "HTSGW",
                "DIRPW"
            ]
        }
    ]
}'

req <- POST(
    url,
    authenticate(apikey, apisecret, type="basic"),
    encode="json",
    body=fromJSON(payload))

output <- prettify(content(req, "text"))

print(output)
```

> Make sure to replace `my_api_key` and `my_api_secret` with your API Key and Secret.


**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| group | path | dataset group id | Yes | string |
| dataset | path | dataset id | Yes | string |
| point | body | coordinates to extract | Yes | Point or MultiPoint |
| timestep | body | timestep to extract data for | Yes | string |
| id | body | user assigned identifier | No | string |
| parameters | body | dataset parameters | No | array of strings |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | JSON object containing a GeoJSON FeatureCollection |

The returned data is a GeoJSON FeatureCollection, with one Feature per Point or MultiPoint sent in. The data for each point will be returned in the `properties` field of the Feature.

<aside class="notice">
If multiple points from a single timestep are required, a request with a single MultiPoint is more efficient than a single request with many Points.
</aside>

<aside class="warning">
Each request sent is only allowed to contain up to a maximum of 500 points. If you need more than this number of points, split the points over multiple requests.
</aside>

> The above command returns json containing GeoJSON point data:

``` json
{
    "data": {
        "type": "FeatureCollection",
        "features": [
            {
                "type": "Feature",
                "id": "multipoint",
                "geometry": {
                    "type": "MultiPoint",
                    "coordinates": [
                        [
                            -8.695,
                            50.079
                        ],
                        [
                            -1.472,
                            50.1438
                        ]
                    ]
                },
                "properties": {
                    "dataset": "global_waves",
                    "timestep": "2020-05-27T06:00:00+00:00",
                    "values": [
                        {
                            "HTSGW": 2.0299999713897705,
                            "DIRPW": 277.5
                        },
                        {
                            "HTSGW": 0.7599999904632568,
                            "DIRPW": 262.5
                        }
                    ]
                }
            }
        ]
    }
}
```
