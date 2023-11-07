#include <stdio.h>
#include <stdlib.h>
#include <string.h>

const char *checkWindowManager() {
    char *desktopSession = getenv("DESKTOP_SESSION");
    if (desktopSession == NULL) {
        return "Not Found";
    } else {
        if (strstr(desktopSession, "xmonad") != NULL) {
            return "xmonad";
        } else if (strstr(desktopSession, "herb") != NULL) {
            return "herb";
        } else if (strstr(desktopSession, "awesome") != NULL) {
            return "awesome";
        } else if (strstr(desktopSession, "dwm") != NULL) {
            return "dwm";
        } else {
            return desktopSession;
        }
    }
}