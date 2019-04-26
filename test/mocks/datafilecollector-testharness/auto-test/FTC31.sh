#!/bin/bash

TC_ONELINE_DESCR="DFC file retention using DR.  Publish 1 file, retstart MR sim and dfc. No new publish."

. ../common/testcase_common.sh $1 $2

#### TEST BEGIN ####

clean_containers

export DR_TC="--tc normal"
export DR_REDIR_TC="--tc normal"
export MR_TC="--tc100"
export BC_TC=""
export NUM_FTPFILES="1"
export NUM_PNFS="1"
export FILE_SIZE="1MB"
export FTP_TYPE="SFTP"

log_sim_settings

start_simulators

mr_equal            ctr_requests                    0 60
dr_equal            ctr_published_files             0 60

mr_print            tc_info
dr_print            tc_info
drr_print           tc_info

start_dfc

dr_equal            ctr_published_files             1 60

sleep_wait          30

dr_equal            ctr_published_files             1


mr_equal            ctr_events                      1
mr_equal            ctr_unique_files                1
mr_equal            ctr_unique_PNFs                 1

dr_equal            ctr_publish_query               1
dr_equal            ctr_publish_query_published     0
dr_equal            ctr_publish_query_not_published 1
dr_equal            ctr_publish_req                 1
dr_equal            ctr_publish_req_redirect        1
dr_equal            ctr_publish_req_published       0
dr_equal            ctr_published_files             1
dr_equal            ctr_double_publish              0

drr_equal           ctr_publish_requests            1
drr_equal           ctr_publish_responses           1

drr_equal           dwl_volume                      1000000

check_dfc_log

store_logs          PART1

kill_mr
kill_dfc
start_simulators

mr_equal            ctr_events                      0 60
mr_equal            ctr_unique_files                0
mr_equal            ctr_unique_PNFs                 0

start_dfc

sleep_wait          30

mr_equal            ctr_events                      1 60
mr_equal            ctr_unique_files                1
mr_equal            ctr_unique_PNFs                 1

dr_equal            ctr_publish_query               2
dr_equal            ctr_publish_query_published     1
dr_equal            ctr_publish_query_not_published 1
dr_equal            ctr_publish_req                 1
dr_equal            ctr_publish_req_redirect        1
dr_equal            ctr_publish_req_published       0
dr_equal            ctr_published_files             1
dr_equal            ctr_double_publish              0

drr_equal           ctr_publish_requests            1
drr_equal           ctr_publish_responses           1

drr_equal           dwl_volume                      1000000

check_dfc_log

#### TEST COMPLETE ####

store_logs          END

print_result