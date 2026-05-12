with source as (
    select * from {{ source('jaffle_shop_raw', 'payments') }}
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