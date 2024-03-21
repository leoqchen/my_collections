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
