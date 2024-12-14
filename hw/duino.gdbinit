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
# b *0x8000400
# jump *0x8000400
b Reset
# b SystemInit
# b main

# layout src
layout asm
layout reg
# set substitute-path /home/dponyatov/flic/ ./
# set substitute-path /home/pere/src/newlib-salsa /home/dponyatov/stm32/ref/newlib-salsa
