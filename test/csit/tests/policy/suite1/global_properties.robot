*** Settings ***
Documentation        store all properties that can change or are used in multiple places here
...                    format is all caps with underscores between words and prepended with GLOBAL
...                   make sure you prepend them with GLOBAL so that other files can easily see it is from this file.


*** Variables ***
${GLOBAL_APPLICATION_ID}          robot-ete
${GLOBAL_MSO_STATUS_PATH}    /ecomp/mso/infra/orchestrationRequests/v2/
${GLOBAL_SELENIUM_BROWSER}        chrome
${GLOBAL_SELENIUM_BROWSER_CAPABILITIES}        Create Dictionary
${GLOBAL_SELENIUM_DELAY}          0
${GLOBAL_SELENIUM_BROWSER_IMPLICIT_WAIT}        5
${GLOBAL_SELENIUM_BROWSER_WAIT_TIMEOUT}        15
${GLOBAL_OPENSTACK_HEAT_SERVICE_TYPE}    orchestration
${GLOBAL_OPENSTACK_CINDER_SERVICE_TYPE}    volume
${GLOBAL_OPENSTACK_NOVA_SERVICE_TYPE}    compute
${GLOBAL_OPENSTACK_NEUTRON_SERVICE_TYPE}    network
${GLOBAL_OPENSTACK_GLANCE_SERVICE_TYPE}    image
${GLOBAL_OPENSTACK_KEYSTONE_SERVICE_TYPE}    identity
${GLOBAL_AAI_CLOUD_OWNER}    Rackspace
${GLOBAL_BUILD_NUMBER}    31
${GLOBAL_VM_PRIVATE_KEY}   ${EXECDIR}/robot/assets/keys/robot_ssh_private_key.pvt
# policy info - everything is from the private oam network (also called ecomp private network)
${GLOBAL_POLICY_SERVER_URL}	https://%{PDP_IP}:8081
${GLOBAL_POLICY_AUTH}	dGVzdHBkcDphbHBoYTEyMw==
${GLOBAL_POLICY_CLIENTAUTH}	 cHl0aG9uOnRlc3Q=
${GLOBAL_POLICY_HEALTHCHECK_URL}	https://%{POLICY_IP}:6969
${GLOBAL_POLICY_USERNAME}	healthcheck
${GLOBAL_POLICY_PASSWORD}	zb!XztG34
