set startup-quietly on
set height 0
set pagination off
target extended-remote :12345
# load
b Reset_Handler
b main
monitor reset halt
# c
