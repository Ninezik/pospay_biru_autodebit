SELECT distinct 
transaction_amount,
dst_account_type,
dst_bank_code
FROM public.t_transaction_history_scheduler
where dst_account_owner_name='Pulsa Telkomsel'
and t_transaction_history_scheduler.end_execution_date is not NULL
