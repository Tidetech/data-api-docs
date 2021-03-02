# /v2/datasets/{group}/{dataset}/area/

**Summary:** Raster data from a dataset

**Description:** The /v2/datasets/{group}/{dataset}/area/ endpoint extracts data from a dataset over an entire area. The endpoint only accepts POST requests. POST requests must be in JSON format, with the appropriate Content-Type: application/json headers set.

**Endpoint** `/v2/datasets/{group}/{dataset}/area/`

**Method** `POST`

<aside class="notice">
The <a href="#v2-datasets-group-dataset-forecast">/v2/datasets/{group}/{dataset}/forecast/</a> endpoint is more efficient for downloading the most recent forecast for a dataset.
</aside>

<aside class="warning">
The <b><em>global_ocean_surface_temperature</em></b> dataset grid size is too large for GRIBv1 format, and is currently only available to download as a NetCDF file.
</aside>


``` shell
curl --location --request POST https://api.tidetech.org/v2/datasets/meteorology/global_meteorology/area/ \
--user "my_api_key:my_api_secret" \
--header "Content-Type: application/json" \
--data-raw '{
    "start_timestep": "2020-05-27T00:00:00Z",
    "end_timestep": "2020-05-27T12:00:00Z",
    "parameters": ["UGRD", "VGRD"],
    "polygon": {
        "type": "Polygon",
        "coordinates": [[
            [-1.2732, 50.8536],
            [-1.7080, 50.6650],
            [-1.2732, 50.5020],
            [-0.8165, 50.6691],
            [-1.2732, 50.8536]
        ]]
    }
}' \
--output global_met.nc
```

``` javascript
const fs = require("fs")
const axios = require("axios")

const apikey = "my_api_key"
const apisecret = "my_api_secret"
const url = "https://api.tidetech.org/v2/datasets/meteorology/global_meteorology/area/"
const payload = {
    "start_timestep": "2020-05-27T00:00:00Z",
    "end_timestep": "2020-05-27T12:00:00Z",
    "parameters": [
        "UGRD",
        "VGRD"
    ],
    "polygon": {
        "type": "Polygon",
        "coordinates": [
            [
                [-1.2732, 50.8536],
                [-1.708, 50.665],
                [-1.2732, 50.502],
                [-0.8165, 50.6691],
                [-1.2732, 50.8536]
            ]
        ]
    }
}

axios.post(url, payload, {
    responseType: "stream",
    auth: {
        username: apikey,
        password: apisecret,
    }
}).then((response) => {
    response.data.pipe(fs.createWriteStream("global_met.nc"))
}).catch((error) => {
    console.log(error)
})
```

``` python
import requests

apikey = "my_api_key"
apisecret = "my_api_secret"
url = "https://api.tidetech.org/v2/datasets/meteorology/global_meteorology/area/"
payload = {
    "start_timestep": "2020-05-27T00:00:00Z",
    "end_timestep": "2020-05-27T12:00:00Z",
    "parameters": [
        "UGRD",
        "VGRD"
    ],
    "polygon": {
        "type": "Polygon",
        "coordinates": [
            [
                [-1.2732,50.8536],
                [-1.708,50.665],
                [-1.2732,50.502],
                [-0.8165,50.6691],
                [-1.2732,50.8536]
            ]
        ]
    }
}

with requests.post(url, json=payload, auth=(apikey, apisecret), stream=True) as r:
    r.raise_for_status()
    with open("global_met.nc", "wb") as f:
        for chunk in r.iter_content(chunk_size=1024*1024):
            f.write(chunk)
```

``` csharp
string apikey = "my_api_key";
string apisecret = "my_api_secret";
string url = "https://api.tidetech.org/v2/datasets/meteorology/global_meteorology/area/";
string payload = "{" +
    "\"start_timestep\": \"2020-05-27T00:00:00Z\"," +
    "\"end_timestep\": \"2020-05-27T12:00:00Z\"," +
    "\"parameters\": [" +
        "\"UGRD\"," +
        "\"VGRD\"" +
    "]," +
    "\"polygon\": {" +
        "\"type\": \"Polygon\"," +
        "\"coordinates\": [" +
            "[" +
                "[-1.2732, 50.8536]," +
                "[-1.708, 50.665]," +
                "[-1.2732, 50.502]," +
                "[-0.8165, 50.6691]," +
                "[-1.2732, 50.8536]" +
            "]" +
        "]" +
    "}" +
"}";

var client = new RestClient(url);
client.Authenticator = new HttpBasicAuthenticator(apikey, apisecret);
client.Timeout = -1;

var request = new RestRequest(Method.POST);
request.AddHeader("Content-Type", "application/json");
request.AddJsonBody(payload);

var response = client.DownloadData(request);
File.WriteAllBytes("global_met.nc", response);
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
    url = "https://api.tidetech.org/v2/datasets/meteorology/global_meteorology/area/"
)

func main() {

    method := "POST"

    payload := strings.NewReader(`
    {
        "start_timestep": "2020-05-27T00:00:00Z",
        "end_timestep": "2020-05-27T12:00:00Z",
        "parameters": ["UGRD", "VGRD"],
        "polygon": {
            "type": "Polygon",
            "coordinates": [[
                [-1.2732, 50.8536],
                [-1.7080, 50.6650],
                [-1.2732, 50.5020],
                [-0.8165, 50.6691],
                [-1.2732, 50.8536]
            ]]
        }
    }
    `)

    client := &http.Client {}
    req, err := http.NewRequest(method, url, payload)

    if err != nil {
        fmt.Println(err)
    }
    req.SetBasicAuth(apikey, apisecret)
    req.Header.Add("Content-Type", "application/json")
    res, _ := client.Do(req)
    defer res.Body.Close()
    data, _ := ioutil.ReadAll(res.Body)

    ioutil.WriteFile("global_met.nc", data, 0777)
}
```

```r
library('httr')
library('jsonlite')

apikey <- "my_api_key"
apisecret <- "my_api_secret"
url <- "https://api.tidetech.org/v2/datasets/meteorology/global_meteorology/area/"
path <- "global_met.nc"

payload <- '{
    "start_timestep": "2020-05-27T00:00:00Z",
    "end_timestep": "2020-05-27T12:00:00Z",
    "parameters": ["UGRD", "VGRD"],
    "polygon": {
        "type": "Polygon",
        "coordinates": [[
            [-1.2732, 50.8536],
            [-1.7080, 50.6650],
            [-1.2732, 50.5020],
            [-0.8165, 50.6691],
            [-1.2732, 50.8536]
        ]]
    }
}'

req <- POST(
    url,
    authenticate(apikey, apisecret, type="basic"),
    encode="json",
    body=fromJSON(payload),
    write_disk(path, overwrite=TRUE),
    progress())

stop_for_status(req)
```

> Make sure to replace `my_api_key` and `my_api_secret` with your API Key and Secret.


**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| group | path | dataset group id | Yes | string |
| dataset | path | dataset id | Yes | string |
| polygon | body | area to be extracted | No | Polygon or MultiPolygon |
| start_timestep | body | start timestep | Yes | string ISO8601 |
| end_timestep | body | end timestep | Yes | string ISO8601 |
| parameters | body | dataset parameters | No | array of strings |
| lon_resolution | body | resampled longitudinal resolution | No | float |
| lat_resolution | body | resampled latitudinal resolution | No | float |
| compress | body | "gz" or "bz2" compression | No | string |
| format | body | "nc" or "grb" file format | No | string |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Returns raster data in GRIB or NetCDF format |

> The above command returns area data in GRIB or NetCDF format