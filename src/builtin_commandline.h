// Prototypes for functions for executing builtin_commandline functions.
#ifndef ghoti_BUILTIN_COMMANDLINE_H
#define ghoti_BUILTIN_COMMANDLINE_H

#include <cstring>
#include <cwchar>

class parser_t;

maybe_t<int> builtin_commandline(parser_t &parser, io_streams_t &streams, wchar_t **argv);
#endif
