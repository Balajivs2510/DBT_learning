def add_profit(x,y):
    return x-y

def model(dbt, session):
    dbt.config(materialized = "table",schema ='TRANSFORMING')
    prod_df = dbt.ref("Products")
    df= prod_df.withColumn("PROFIT",add_profit(prod_df["UnitPrice"],prod_df["UnitCost"]))
    return df