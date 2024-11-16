/// @defgroup vmcfg vm
/// @ingroup config
/// @{

#include "flic.h"

/// main memory size (64K limit)
#define Msz 0x1000
/// return stack size (depth limit: 256)
#define Rsz 0x100
/// data stack size (depth limit: 256)
#define Dsz 0x10
/// @}

/// @defgroup vm vm
/// @ingroup repl
/// @brief Virtual Machine (bytecode interpreter)
/// @{

/// @defgroup memory memory
/// @brief @ref vm memory
/// @{

typedef uint8_t byte;   ///<
typedef uint16_t mptr;  ///< @ref M pointer (64K limit)
typedef uint8_t sptr;   ///< stack pointer (depth limit: 256)
typedef int32_t cell;   ///< signed int (virtual machine word)

extern byte M[Msz];  ///< main memory
extern mptr Cp;      ///< compilation pointer
extern mptr Ip;      ///< instruction pointer

extern mptr R[Rsz];  ///< return stack
extern sptr Rp;      ///< return stack pointer

extern cell D[Dsz];  ///< data stack
extern sptr Dp;      ///< data stack pointer

/// @}

/// @}
