def model(dbt, session):
    dbt.config(materialized = "table",schema ='TRANSFORMING')
    df = dbt.ref("stg_offices")

    return df