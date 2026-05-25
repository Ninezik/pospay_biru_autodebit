-- SELECT distinct 
-- t_transaction_history_scheduler.payee_code,
-- master_biller_product.autodebet_allowed 
-- FROM t_transaction_history_scheduler
-- JOIN
-- (select distinct payee_code,autodebet_allowed 
-- from master_biller_product)master_biller_product
-- on t_transaction_history_scheduler.payee_code =master_biller_product.payee_code


select distinct autodebet_allowed
from master_biller_product
