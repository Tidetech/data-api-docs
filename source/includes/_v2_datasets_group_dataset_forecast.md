# /v2/datasets/{group}/{dataset}/forecast/

**Summary:** download a dataset's most recent forecast

**Description:** The /v2/datasets/{group}/{dataset}/forecast/ endpoint will download the most recent forecast as a NetCDF or (if available) GRIB dataset.

The dataset contains all the parameters listed in `/v2/datasets/{group}/{dataset}/`, and all timesteps between forecast_timestep and end_timestep.

The API will return a 302 Redirect response to an Amazon S3 URL. This URL will only remain valid for a short period of time. You should make a new request to this endpoint, and get a new one-time S3 download URL, every time you need to download the forecast.

**Endpoint** `/v2/datasets/{group}/{dataset}/forecast/`

This endpoint does not allow you to select a spatial or temporal subset of the forecast, select a subset of the dataset bands, or resample the dataset resolution.

**Method** `GET`

<aside class="warning">
The <b><em>global_ocean_surface_temperature</em></b> dataset grid size is too large for GRIBv1 format, and is currently only available to download as a NetCDF file.
</aside>


``` shell
curl --location --request GET https://api.tidetech.org/v2/datasets/currents/solent_currents/forecast/ \
--user "my_api_key:my_api_secret" \
--output solent_forecast.nc
```

``` javascript
const fs = require("fs")
const axios = require("axios")
const apikey = "my_api_key"
const apisecret = "my_api_secret"

axios.get("https://api.tidetech.org/v2/datasets/currents/solent_currents/forecast/", data, {
    responseType: "stream",
    auth: {
        username: apikey,
        password: apisecret,
    }
}).then((response) => {
    response.data.pipe(fs.createWriteStream("solent_forecast.nc"))
}).catch((error) => {
    console.log(error);
})
```

``` python
import requests

apikey = "my_api_key"
apisecret = "my_api_secret"
url = "https://api.tidetech.org/v2/datasets/currents/solent_currents/forecast/"

with requests.get(url, auth=(apikey, apisecret), stream=True) as r:
    r.raise_for_status()
    with open("solent_forecast.nc", "wb") as f:
        for chunk in r.iter_content(chunk_size=1024*1024):
            f.write(chunk)
```

``` csharp
var apikey = "my_api_key";
var apisecret = "my_api_secret";

var client = new RestClient("https://api.tidetech.org/v2/datasets/currents/solent_currents/forecast/");
client.Authenticator = new HttpBasicAuthenticator(apikey, apisecret);
client.Timeout = -1;

var request = new RestRequest(Method.GET);

var response = client.DownloadData(request);
File.WriteAllBytes("solent_forecast.nc", response);
```

``` go
package main

import (
    "fmt"
    "net/http"
    "io/ioutil"
)

const (
    apikey = "my_api_key"
    apisecret = "my_api_secret"
)

func main() {

    url := "https://api.tidetech.org/v2/datasets/currents/solent_currents/forecast/"
    method := "GET"

    client := &http.Client {}
    req, err := http.NewRequest(method, url, nil)

    if err != nil {
        fmt.Println(err)
    }
    req.SetBasicAuth(apikey, apisecret)
    res, err := client.Do(req)
    defer res.Body.Close()
    data, _ := ioutil.ReadAll(res.Body)

    ioutil.WriteFile("solent_forecast.nc", data, 0777)
}
```

```r
library('httr')

apikey <- "my_api_key"
apisecret <- "my_api_secret"
url <- "https://api.tidetech.org/v2/datasets/currents/solent_currents/forecast/"
path <- "solent_forecast.nc"

req <- GET(
    url,
    authenticate(apikey, apisecret, type="basic"),
    config(http_content_decoding=0, followlocation=0),
    write_disk(path, overwrite=TRUE))
if (status_code(req) == 302) {
    req2 <- GET(
        req$headers$location,
        add_headers(prefer = "respond-async"),
        config(http_content_decoding=0, followlocation=0),
        write_disk(path, overwrite=TRUE),
        progress())

    stop_for_status(req2)
} else {
    stop_for_status(req)
}
```

> Make sure to replace `my_api_key` and `my_api_secret` with your API Key and Secret.


**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| group | path | dataset group id | Yes | string |
| dataset | path | dataset id | Yes | string |
| compress | query | file compression type | No | string |
| format | query | file format | No | string |

<aside class="notice">
The <em><b>/v2/datasets/{group}/{dataset}/forecast/</b></em> endpoint only supports the following combinations of <em><b>format</b></em> and <em><b>compress</b></em>:
<ul>
    <li><em><b>nc</b></em> with no compression,
    <li><em><b>grb</b></em> with no compression, or
    <li><em><b>grb</b></em> with <em><b>bz2</b></em> compression.
</aside>

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | Returns raster data in GRIB or NetCDF format |

> The above command returns area data in GRIB or NetCDF format
