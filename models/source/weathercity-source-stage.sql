version: 2

sources:
  - name: weathercity_stage         # The logical name for the source
    database: gainsight_dev             # Optional: Physical database name
    schema: gainsight_dev_schema            # Optional: Physical schema name
    tables:
      - name: tblcitybikes_stg
      - name: tblweather_stg
