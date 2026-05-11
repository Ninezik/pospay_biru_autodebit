--data churn global dengan cara exclude yang mati total 
--(mati_normal/(total-mati_total))*100
select
	t3.src_account_no,
	t3.is_actived,
	t3.start_execution_date,
	t3.kategori,
	case
		when kategori = UPPER('pakai next_execution_time') then coalesce(end_execution_date,
		next_execution_time)
		else t3.end_execution_date
	end as end_execution_date
from
	(
	select
		t2.*,
		UPPER(case when t2.is_actived = 1
then 
	( case when end_execution_date is not null then 'normal'
		else 'pakai next_execution_time' end
	)
else
	( case when end_execution_date is not null then 'mati normal'
	else 'mati total belum sempat di eksekusi' end
	)
end) as kategori
	from
		(
		select
			t1.src_account_no,
			MAX(t1.is_actived)is_actived,
			MIN(t1.start_execution_date)start_execution_date,
			MAX(t1.end_execution_date)end_execution_date,
			MAX(t1.next_execution_date)next_execution_time
		from
			(
			select
				src_account_no,
				case
					when is_actived is true then 1
					else 0
				end as is_actived,
				t_transaction_history_scheduler."period" ,
				transaction_datetime ,
				start_execution_date ,
				end_execution_date,
				next_execution_date
			from
				t_transaction_history_scheduler
)t1
		group by
			1
)t2
)t3
