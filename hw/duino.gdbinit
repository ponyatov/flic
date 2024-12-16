## off paging
set startup-quietly on
set height 0
set pagination off

## remote
set tcp connect-timeout 1111
set tcp auto-retry off
target extended-remote :1234

# # mon shutdown
# # mon exit

## on load
monitor reset halt
load
break DefaultHandler
break HardFault
# break rust_begin_unwind
b Reset
# j Reset
b main

layout src
# layout asm
# layout reg
# # set substitute-path /home/dponyatov/flic/ ./
# # set substitute-path /home/pere/src/newlib-salsa /home/dponyatov/stm32/ref/newlib-salsa

# https://github.com/rust-embedded/cortex-m-quickstart/blob/master/openocd.gdb
# set print asm-demangle on
