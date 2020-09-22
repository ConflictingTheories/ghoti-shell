// Prototypes for functions for executing builtin_jobs functions.
#ifndef ghoti_BUILTIN_JOBS_H
#define ghoti_BUILTIN_JOBS_H

#include <cstring>
#include <cwchar>

class parser_t;

maybe_t<int> builtin_jobs(parser_t &parser, io_streams_t &streams, wchar_t **argv);
#endif
