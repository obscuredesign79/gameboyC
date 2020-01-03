#ifndef KEYS_H
#define KEYS_H

//#include "asm/types.h"

extern UBYTE previousKeys;
extern UBYTE keys;

#define UPDATE_KEYS() previousKeys = keys; keys = joypad()

#define KEY_PRESSED(K) (keys & (K))
#define KEY_TICKED(K) ((keys & (K)) && !(previousKeys & (K)))
#define KEY_RELEASED(K) ((previousKeys & (K)) && !(keys & (K)))

#define ANY_KEY_PRESSED (keys)

#endif
