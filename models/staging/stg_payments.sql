CREATE OR REPLACE  VIEW marketing_db.staging.stg_payments as
with source as (
    select * from raw.jaffle_shop.payments
),

renamed as (
    select
        id as payment_id,
        orderid as order_id,
        paymentmethod as payment_method,
        -- On convertit souvent les centimes en montant réel (exemple / 100)
        -- si tes données sont déjà en euros, garde juste : amount
        status,
        amount
    from source
)

select * from renamed