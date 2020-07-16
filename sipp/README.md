SIPp cheatsheet

SIPp is a free test tool and traffic generator for the SIP protocol. It uses XML format files to define test scenarios.

General usage: sipp remote_host[:remote_port] [options]

Some important command-line options:


`-sf filename`  
Load test scenario from specified file.  
`-inf filename`  
Use CSV file to insert data substituted for [field0], [field1], etc into XML scenario. First line of file describes order of inserting field sets (SEQUENTIAL/RANDOM/USE).  
`-sn name`  
Use one of the embedded, predefined scenarios like "uac", "uas".  
`-r rate`  
Scenario execution rate, default value = 10 times per period, default period = 1000 ms.  
`-rp period`  
Scenario execution period [ms], combined with execution rate. Execution rate is combined of rate and period parameters, i.e. if period = 3500 and rate = 7 there   will be 7 calls in 3.5 s.  
`-t transport mode`  
Set the transport mode: "u1" - UDP, one socket (default), "un" - UDP, one socket per call, other modes (TCP and with compression) available.  
`-max_socket max`  
Set the limit for simultaneously used sockets (for one socket per call mode). If limit is reached, sockets are reused.  
`-m calls`  
Stop and exit after specified tests count.  
`-s service`  
Set user part of the request URI (default: 'service'). Replaces [service] tag in XML scenario file.  
`-ap pass`  
Set password used for auth challenges (default: 'password').  
`-l limit`  
Limit simultaneous calls (default: 3 * call_duration (s) * rate).  
`-recv_timeout`  
Global receive timeout (miliseconds). By default call is aborted, use ontimeout attribute to take other action.  
`-trace_msg`  
Log sent and received SIP messages (file: scenario_pid_messages.log).  
`-trace_err`  
Log error message to file (like "Discarding message which can't be mapped to a known SIPp call").  
`-sd`  
Dumps one of the default scenarios. Usage example: sipp -sd uas > uas.xml.

```
sipp freeswitch -sf 33_uac_p-asserted.xml -m 1 -s 1024
```