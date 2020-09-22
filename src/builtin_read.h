// Prototypes for executing builtin_read function.
#ifndef ghoti_BUILTIN_READ_H
#define ghoti_BUILTIN_READ_H

#include "maybe.h"

class parser_t;
struct io_streams_t;

maybe_t<int> builtin_read(parser_t &parser, io_streams_t &streams, wchar_t **argv);
#endif
