// Prototypes for functions for executing builtin_complete functions.
#ifndef ghoti_BUILTIN_COMPLETE_H
#define ghoti_BUILTIN_COMPLETE_H

#include <cstring>
#include <cwchar>

class parser_t;

maybe_t<int> builtin_complete(parser_t &parser, io_streams_t &streams, wchar_t **argv);
#endif
