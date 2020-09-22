// Prototypes for functions for executing builtin_set functions.
#ifndef ghoti_BUILTIN_SET_H
#define ghoti_BUILTIN_SET_H

#include <cstring>
#include <cwchar>

class parser_t;

maybe_t<int> builtin_set(parser_t &parser, io_streams_t &streams, wchar_t **argv);
#endif
