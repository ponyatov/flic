## off paging
set startup-quietly on
set height 0
set pagination off

## remote
set tcp connect-timeout 1
# set tcp auto-retry off
target extended-remote :3333

## load
# b Reset_Handler
# b SystemInit
b main
monitor reset halt
