#ifndef __BYTESWAP_H__
#define __BYTESWAP_H__

#ifdef __cplusplus
extern "C" {
#endif //__cplusplus

// Mac OS X / Darwin features
#include <libkern/OSByteOrder.h>
#define __bswap_16(x) OSSwapInt16(x)
#define __bswap_32(x) OSSwapInt32(x)
#define __bswap_64(x) OSSwapInt64(x)

#ifdef __cplusplus
}
#endif //__cplusplus

#endif // __BYTESWAP_H__
