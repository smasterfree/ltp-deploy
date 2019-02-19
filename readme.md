
# ltp 部署脚本

ltp 命令选项 

```
root@hzx-machine1:/opt/ltp# ./runltp --help
Illegal option --

    usage: runltp [ -a EMAIL_TO ] [ -c NUM_PROCS ] [ -C FAILCMDFILE ] [ -T TCONFCMDFILE ]
    [ -d TMPDIR ] [ -D NUM_PROCS,NUM_FILES,NUM_BYTES,CLEAN_FLAG ] -e [ -f CMDFILES(,...) ]
    [ -g HTMLFILE] [ -i NUM_PROCS ] [ -l LOGFILE ] [ -m NUM_PROCS,CHUNKS,BYTES,HANGUP_FLAG ]
    -N -n [ -o OUTPUTFILE ] -p -q -Q [ -r LTPROOT ] [ -s PATTERN ] [ -t DURATION ]
    -v [ -w CMDFILEADDR ] [ -x INSTANCES ] [ -b DEVICE ] [-B LTP_DEV_FS_TYPE]
[ -F LOOPS,PERCENTAGE ] [ -z BIG_DEVICE ] [-Z  LTP_BIG_DEV_FS_TYPE]

    -a EMAIL_TO     EMAIL all your Reports to this E-mail Address
    -c NUM_PROCS    Run LTP under additional background CPU load
                    [NUM_PROCS = no. of processes creating the CPU Load by spinning over sqrt()
                                 (Defaults to 1 when value)]
    -C FAILCMDFILE  Command file with all failed test cases.
    -T TCONFCMDFILE Command file with all test cases that are not fully tested.
    -d TMPDIR       Directory where temporary files will be created.
    -D NUM_PROCS,NUM_FILES,NUM_BYTES,CLEAN_FLAG
                    Run LTP under additional background Load on Secondary Storage (Seperate by comma)
                    [NUM_PROCS   = no. of processes creating Storage Load by spinning over write()]
                    [NUM_FILES   = Write() to these many files (Defaults to 1 when value 0 or undefined)]
                    [NUM_BYTES   = write these many bytes (defaults to 1GB, when value 0 or undefined)]
                    [CLEAN_FLAG  = unlink file to which random data written, when value 1]
    -e              Prints the date of the current LTP release
    -f CMDFILES     Execute user defined list of testcases (separate with ',')
-F LOOPS,PERCENTAGE Induce PERCENTAGE Fault in the Kernel Subsystems, and, run each test for LOOPS loop
    -g HTMLFILE     Create an additional HTML output format
    -h              Help. Prints all available options.
    -i NUM_PROCS    Run LTP under additional background Load on IO Bus
                    [NUM_PROCS   = no. of processes creating IO Bus Load by spinning over sync()]
    -K DMESG_LOG_DIR
Log Kernel messages generated for each test cases inside this directory
    -l LOGFILE      Log results of test in a logfile.
    -m NUM_PROCS,CHUNKS,BYTES,HANGUP_FLAG
                    Run LTP under additional background Load on Main memory (Seperate by comma)
                    [NUM_PROCS   = no. of processes creating main Memory Load by spinning over malloc()]
                    [CHUNKS      = malloc these many chunks (default is 1 when value 0 or undefined)]
                    [BYTES       = malloc CHUNKS of BYTES bytes (default is 256MB when value 0 or undefined) ]
                    [HANGUP_FLAG = hang in a sleep loop after memory allocated, when value 1]
-M CHECK_TYPE
[CHECK_TYPE=1 => Full Memory Leak Check tracing children as well]
[CHECK_TYPE=2 => Thread Concurrency Check tracing children as well]
[CHECK_TYPE=3 => Full Memory Leak & Thread Concurrency Check tracing children as well]
    -N              Run all the networking tests.
    -n              Run LTP with network traffic in background.
    -o OUTPUTFILE   Redirect test output to a file.
    -p              Human readable format logfiles.
    -q              Print less verbose output to screen. This implies
                    not logging start of the test in kernel log.
    -Q              Don't log start of test in kernel log.
    -r LTPROOT      Fully qualified path where testsuite is installed.
    -R              Randomize test order.
    -s PATTERN      Only run test cases which match PATTERN.
    -S SKIPFILE     Skip tests specified in SKIPFILE
    -t DURATION     Execute the testsuite for given duration. Examples:
                      -t 60s = 60 seconds
                      -t 45m = 45 minutes
                      -t 24h = 24 hours
                      -t 2d  = 2 days
    -I ITERATIONS   Execute the testsuite ITERATIONS times.
    -w CMDFILEADDR  Uses wget to get the user's list of testcases.
    -x INSTANCES    Run multiple instances of this testsuite.
    -b DEVICE       Some tests require an unmounted block device
                    to run correctly.
    -B LTP_DEV_FS_TYPE The file system of test block devices.
    -z BIG_DEVICE   Some tests require a big unmounted block device
                    to run correctly.
    -Z  LTP_BIG_DEV_FS_TYPE The file system of the big device



    example: ./opt/ltp/runltp -c 4 -i 2 -m 2,4,10240,1 -D 2,10,10240,1 -p -q  -l /tmp/result-log.27351 -o /tmp/result-output.27351 -C /tmp/result-failed.27351 -d /tmp   -t 30d
```


To run all the test suites

```
$ cd /opt/ltp
$ ./runltp
```

Note that many test cases have to be executed as root.


To run a particular test suite

```
$ ./runltp -f syscalls
```

To run all tests with madvise in the name

```
$ ./runltp -f syscalls -s madvise
```



