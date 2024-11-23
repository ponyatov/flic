// FORTH syntax for ragel

#include <stdlib.h>
#include <assert.h>

/// @defgroup token token
/// @brief parser token (tagged union)
/// @{

/// @brief token type
typedef enum {
    CHAR,  ///< single 8bit char
    INT,   ///< signed integer
    NUM,   ///< floating point number
    STR,   ///< string
    PTR    ///< in-memory pointer
} T;

/// @brief token value (one of)
typedef union {
    char c;
    int n;
    float f;
    char* s;
    void* p;
} V;

/// @brief token structure (tagged union)
struct TOKEN {
    T t;
    V v;
};

%%{
    machine FORTH;

    n = [+\-]?[0-9]+;
    f = [+\-]?[0-9]+'.'[0-9]+;

    REPL := |*
        n => { token.t = INT; token.n = atoi(ts); return token; };
        f => { token.t = NUM; token.f = atof(ts); return token; };
    *|;
}%%

%%write data;

static char* p;    ///< current parser pointer
static char* pe;   ///< source end parser pointer
static int cs;     ///< current DFA state
static char* ts;   ///< parsed start
static char* te;   ///< parser end
static char* act;  ///<
static char* eof;  ///< end of file

/// @brief reset to new input buffer (string)
void source(char* buf, size_t size) {
    assert(p == pe);        // check previous code fully parsed
    p = buf;                // \ set new parsing pointers
    eof = pe = buf + size;  // /
}

/// @brief parse single token from input buffer
struct TOKEN token(void) {
    struct TOKEN token;
    %%write init;
    %%write exec;
}

/// @}
