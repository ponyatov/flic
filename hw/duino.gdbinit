## off paging
set startup-quietly on
set height 0
set pagination off

## remote
set tcp connect-timeout 1111
set tcp auto-retry off
target extended-remote :1234

# mon shutdown
# mon exit

## on load
# monitor reset halt
# b Reset_Handler
b *0x8000000
# b SystemInit
# b main
