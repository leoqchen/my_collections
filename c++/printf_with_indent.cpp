static int _indent = 0;
static void _printf( const char *format, ... )
{
    if( _indent )
        printf("%*s", _indent, "");

    va_list ap;
    va_start(ap, format);
    vprintf( format, ap );
    va_end(ap);
}


#define _printf_filename() printf("%s\n", __FILE__)
#define _printf(...) printf_indent( __func__, __LINE__, __VA_ARGS__ )
static void printf_indent( const char *funcName, int line, const char *format, ... )
{
    int indent = 0;

    if( 1 ){
        struct{
            char funcName[32];
            int indent;
        }table[] = {
            { "CopyTexImage", 4},
            { "CopyTexImageCore", 8},
        };

        const int n = sizeof(table) / sizeof(table[0]);
        for( int i=0; i < n; i++ ){
            if( strcmp( table[i].funcName, funcName ) == 0 ) {
                indent = table[i].indent;
                break;
            }
        }
    }

    printf("%*s%s::%d: ", indent, "", funcName, line);

    va_list ap;
    va_start(ap, format);
    vprintf( format, ap );
    va_end(ap);
}
