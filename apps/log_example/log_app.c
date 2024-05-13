#include <sys/syslog.h>
#include <syslog.h>

static const char APP_NAME [] = "log_app";

int main(){
    openlog(APP_NAME, 0, LOG_USER); 
    syslog(LOG_INFO, "hello world, %s", APP_NAME);
    closelog();
}