# Metadata

| key | value |
|-----|-------|
| **`id`** | The dataset ID. This ID is unique across the API. |
| **`name`** | A human-friendly name for this dataset. |
| **`description`** | A long form text description of this dataset and its contents. |
| **`group`** | The dataset group this dataset belongs to. |
| **`resolution_x`** | The x resolution of the dataset in decimal degrees. |
| **`resolution_y`** | The y resolution of the dataset in decimal degrees. |
| **`timestep_duration`** | The time between dataset timesteps, expressed as an ISO8601 duration. |
| **`start_timestep`** | The earliest timestep in this dataset. Earlier timesteps represent historical data. |
| **`end_timestep`** | The latest timestep in this dataset. Later timesteps represent forecast data. |
| **`forecast_timestep`** | Data for timesteps later than this datetime are forecasts, and the data may change as new models are run.
| **`links`** | Links to other endpoints relating to this dataset. |
| **`dataset_bounds`** | The minimum and maximum latitude and longitude bounding box of this dataset. |
| **`parameters`** | A list of parameters this dataset contains. Each parameter is an object with the following fields: |
| **`parameters.id`** | The ID of this parameter. Use this to refer to a parameter when requesting a subset of parameters through the API. |
| **`parameters.long_name`** | A human-friendly name for this parameter. |
| **`parameters.description`** | A long form text description of this parameter. |
| **`parameters.unit_long`** | The units (metres, metres per second, time, etc) for this parameter. |
| **`parameters.units`** | Abbreviated form of the units for this parameter. |
| **`parameters.grib_code`** | The World Meteorological Organisation (WMO) GRIB reference code. |
| **`parameters.var_code`** | Deprecated. This is the same value as grib_code. It will be removed in a future release. |
| **`parameters.fill_value`** | The value used to indicate no data in output netcdf files. |
