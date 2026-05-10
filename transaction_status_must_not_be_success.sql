-- status transaksi harus diubah tidak boleh sukses karena akun nonaktif
select
id,
user_profile_id,
src_account_no,
t_transaction_history_scheduler.transaction_status ,
is_actived
--,next_execution_date
from t_transaction_history_scheduler
where t_transaction_history_scheduler.is_actived is false
and t_transaction_history_scheduler.transaction_status not in ('CANCELED','NON_ACTIVE')
