#pragma none

/// @defgroup lib lib
/// @{
/// @defgroup libc libc
/// @brief standard C/C++ headers
/// @{
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
/// @}
/// @}

/// @defgroup main main
/// @brief program entry point
/// @{

/// @brief program entry point (POSIX)
/// @param[in] argc index (0 = program executable file)
/// @param[in] argv command line argument
#ifdef 
int main(int argc, char *argv[]);
#else
int flic(int argc, char *argv[]);
#endif

/// @brief print command line argument
/// @param[in] argc index
/// @param[in] argv value
void arg(int argc, char *argv);

/// @}
