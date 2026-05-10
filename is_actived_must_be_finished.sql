-- aktivasi harus di matikan, karena next execution date usdah kedaluarsa
select
id,
user_profile_id,
src_account_no,
is_actived,
next_execution_date
from t_transaction_history_scheduler
where date(next_execution_date)<date(current_date)
and is_actived is true
