// FORTH syntax for ragel

#include <stdlib.h>
#include <assert.h>
#include <stdbool.h>

/// @defgroup token token
/// @brief parser token (tagged union)
/// @{

/// @brief token type
typedef enum {
    NIL,   ///< nil
    BOOL,  ///< boolean
    CHAR,  ///< single 8bit char
    INT,   ///< signed integer
    NUM,   ///< floating point number
    STR,   ///< string
    PTR    ///< in-memory pointer
} T;

/// @brief token value (one of)
typedef union {
    bool b;   ///< Bool
    char c;   ///< Char
    int n;    ///< iNteger
    float f;  ///< Floating-point
    char* s;  ///< String
    void* p;  ///< Pointer
} V;

/// @brief token structure (tagged union)
struct TOKEN {
    T t;
    V v;
};

%%{
    machine ton;
    p = '+';
    m = '-';
    n = [0-9];
    main := |*
        p     => { plus = true; };
        m     => { plus = false; };
        n     => { res *= 10; res += (*ts - '0'); };
    *|;
}%%

%%write data nofinal;

int ton(char* p, char* pe) {
    int cs;               // current DFA state
    char *ts, *te, *act;  // token start/end
    int res = 0;          // result
    bool plus = true;     // positive|negative number
    %%write init;
    %%write exec;
    if (plus) return +res; else return -res;
}

%%{
    machine FORTH;

    n = [+\-]?[0-9]+;
    f = [+\-]?[0-9]+'.'[0-9]+;

    REPL := |*
        n => {  token.t = INT;
                token.v.n = ton(ts, te);
                return token; };
        f => {  token.t = NUM;
                token.v.f = atof(ts);
                return token; };
    *|;
}%%

%%write data nofinal;

static char* p;    ///< current parser pointer
static char* pe;   ///< source end parser pointer
static char* eof;  ///< end of file

/// @brief reset to new input buffer (string)
void source(char* buf, size_t size) {
    assert(p == pe);        // check previous code fully parsed
    p = buf;                // \ set new parsing pointers
    eof = pe = buf + size;  // /
}

/// @brief parse single token from input buffer
struct TOKEN token(void) {
    int cs;                           // current DFA state
    char *ts, *te, *act;              // token start/end
    struct TOKEN token = {.t = NIL};  // empty token
    %%write init;
    %%write exec;
    return token;
}

/// @}
