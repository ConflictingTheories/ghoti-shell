// Prototypes for executing builtin_return function.
#ifndef ghoti_BUILTIN_RETURN_H
#define ghoti_BUILTIN_RETURN_H

#include "maybe.h"

class parser_t;
struct io_streams_t;

maybe_t<int> builtin_return(parser_t &parser, io_streams_t &streams, wchar_t **argv);
#endif
