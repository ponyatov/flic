MEMORY
{
RAM    (xrw)     : ORIGIN = 0x20000000, LENGTH = 128K
CCMRAM (xrw)     : ORIGIN = 0x10000000, LENGTH = 64K
FLASH  (rx)      : ORIGIN = 0x08000000, LENGTH = 1024K
}

_stack_start = ORIGIN(CCMRAM) + LENGTH(CCMRAM);
_stack_size  = 8K;
_stack_end   = _stack_start - _stack_size;
