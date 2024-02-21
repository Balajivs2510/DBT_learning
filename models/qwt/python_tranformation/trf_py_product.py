def add_profit(x, y):
    return x - y




def productavailability(a,b):
    if a-b > 0:
        return "True"
    else:
        return "False"

        
def model(dbt, session):
    dbt.config(materialized="table", schema="TRANSFORMING")
    prod_df = dbt.ref("Products")
    df = prod_df.withColumn("PROFIT", add_profit(prod_df["UnitPrice"], prod_df["UnitCost"]))
    df = prod_df.withColumn("availability", productavailability(prod_df["UNITSINSTOCK"], prod_df["UNITSONORDER"]))
    
    return df
