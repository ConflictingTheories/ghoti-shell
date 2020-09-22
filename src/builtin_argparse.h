// Prototypes for executing builtin_getopt function.
#ifndef ghoti_BUILTIN_ARGPARSE_H
#define ghoti_BUILTIN_ARGPARSE_H

#include "maybe.h"

class parser_t;
struct io_streams_t;

maybe_t<int> builtin_argparse(parser_t &parser, io_streams_t &streams, wchar_t **argv);
#endif
