# -e: exec-file   bin/F4DISCO_2v22.elf
# -s: symbol-file bin/F4DISCO_2v22.elf
set substitute-path /home/pere/src/newlib-salsa /usr/src/newlib/newlib-salsa

## off paging
set startup-quietly on
set height 0
set pagination off

## remote
set tcp connect-timeout 1
set tcp auto-retry off
target extended-remote :3333

monitor reset halt
load

b Reset_Handler
b SystemInit
b __libc_init_array
# b SystemClock_Config
# # b MX_GPIO_Init
b main
c

# layout src
# si
