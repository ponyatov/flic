// FORTH syntax for ragel

/// @defgroup token token
/// @brief parser token (tagged union)
/// @{

/// @brief token type
typedef enum uint8_t {
    CHAR,  ///< single 8bit char
    INT,   ///< signed integer
    STR,   ///< string
    PTR    ///< in-memory pointer
} T;

/// @brief token value (one of)
typedef union {
    char c;
    int n;
    char* s;
    void* p;
} V;

typedef struct {
    enum T t;
    union V v;
} TOKEN;

/// @}

struct TOKEN token(void) {}
