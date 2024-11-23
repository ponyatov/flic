## off paging
set startup-quietly on
set height 0
set pagination off

## remote
set remotetimeout 1
# target extended-remote :12345 # set via -ex "${GDBPORT}"

## load
b Reset_Handler
b main
# monitor reset halt
# c
