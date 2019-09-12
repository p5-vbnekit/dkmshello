#ifndef P5_DKMSHELLO_H
#define P5_DKMSHELLO_H
#pragma once

#define P5_DKMSHELLO_MODULE_NAME "p5 dkmshello"
#define P5_DKMSHELLO_MODULE_AUTHOR "p5-vbnekit"
#define P5_DKMSHELLO_MODULE_VERSION "1.0"
#define P5_DKMSHELLO_MODULE_LICENSE "GPL"
#define P5_DKMSHELLO_MODULE_DESCRIPTION "p5 Team hello world example linux module"

#ifdef P5_DKMSHELLO_BUILD

#define P5_DKMSHELLO_INIT_MESSAGE "Hello, World!"
#define P5_DKMSHELLO_EXIT_MESSAGE "Bye, World!"

#endif /* defined P5_DKMSHELLO_BUILD */

#endif /* ! defined P5_DKMSHELLO_H */
