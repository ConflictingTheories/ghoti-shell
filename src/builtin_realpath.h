// Prototypes for executing builtin_realpath function.
#ifndef ghoti_BUILTIN_REALPATH_H
#define ghoti_BUILTIN_REALPATH_H

#include "maybe.h"

class parser_t;
struct io_streams_t;

maybe_t<int> builtin_realpath(parser_t &parser, io_streams_t &streams, wchar_t **argv);
#endif
