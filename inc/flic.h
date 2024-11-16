#ifndef FLIC_H_
#define FLIC_H_

/// @defgroup lib lib
/// @{
/// @defgroup libc libc
/// @brief standard C/C++ headers
/// @{
#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
/// @}
/// @}

/// @defgroup main main
/// @brief program entry point
/// @{

/// @brief program entry point (POSIX/MCU)
/// @param[in] argc index (0 = program executable file)
/// @param[in] argv command line argument
#ifdef __linux__
int main(int argc, char *argv[]);
#else
void flic(int argc, char *argv[]);
#endif

/// @brief print command line argument
/// @param[in] argc index
/// @param[in] argv value
void arg(int argc, char *argv);

/// @}

#endif  // FLIC_H_
