module page307;

$q_initialize (q_id, q_type, max_length, status) ;
$q_add (q_id, job_id, inform_id, status) ;
$q_remove (q_id, job_id, inform_id, status) ;
$q_full (q_id, status) ;
$q_exam (q_id, q_stat_code, q_stat_value, status) ;

endmodule