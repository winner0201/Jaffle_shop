with source as (
    -- On utilise les données de démo Databricks pour tester le pipeline
    select * from samples.tpch.customer
),

renamed as (
    select
        c_custkey as customer_id,
        c_name as customer_name,
        c_address as address
    from source
)

select * from renamed