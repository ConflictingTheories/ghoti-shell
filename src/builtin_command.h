// Prototypes for executing builtin_command function.
#ifndef ghoti_BUILTIN_COMMAND_H
#define ghoti_BUILTIN_COMMAND_H

#include "maybe.h"

class parser_t;
struct io_streams_t;

maybe_t<int> builtin_command(parser_t &parser, io_streams_t &streams, wchar_t **argv);
#endif
