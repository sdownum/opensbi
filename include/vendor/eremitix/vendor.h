#ifndef __VENDOR_H__
#define __VENDOR_H__

#define STR_IDENT(x) #x
#define STR_MACRO(x) STR_IDENT(x)

#define VENDOR_BUILD_NAME STR_MACRO(VENDOR_BUILD_TAG)

#endif