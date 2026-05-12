with source as (
    -- dbt va traduire ceci par raw.jaffle_shop.customers automatiquement
    select * from {{ source('jaffle_shop_raw', 'customers') }}
),

renamed as (
    select
        id as customer_id,
        first_name,
        last_name
    from source
)

select * from renamed


/*with source as (
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

select * from renamed*/
