primitive _CharClassBeginArray
primitive _CharClassBeginObject
primitive _CharClassEndArray
primitive _CharClassEndObject
primitive _CharClassNameSeparator
primitive _CharClassValueSeparator
primitive _CharClassWs
primitive _CharClassF
primitive _CharClassA
primitive _CharClassL
primitive _CharClassS
primitive _CharClassE
primitive _CharClassN
primitive _CharClassU
primitive _CharClassT
primitive _CharClassR
primitive _CharClassDecimalPoint
primitive _CharClassDigit19
primitive _CharClassBigE
primitive _CharClassMinus
primitive _CharClassPlus
primitive _CharClassDigit0
primitive _CharClassQuotationMark
primitive _CharClassReverseSolidus
primitive _CharClassSolidus
primitive _CharClassB
primitive _CharClassHexDigit
primitive _CharClassUnescaped
primitive _CharClassOther

type _CharClass is (_CharClassBeginArray |
                    _CharClassBeginObject |
                    _CharClassEndArray |
                    _CharClassEndObject |
                    _CharClassNameSeparator |
                    _CharClassValueSeparator |
                    _CharClassWs |
                    _CharClassF |
                    _CharClassA |
                    _CharClassL |
                    _CharClassS |
                    _CharClassE |
                    _CharClassN |
                    _CharClassU |
                    _CharClassT |
                    _CharClassR |
                    _CharClassDecimalPoint |
                    _CharClassDigit19 |
                    _CharClassBigE |
                    _CharClassMinus |
                    _CharClassPlus |
                    _CharClassDigit0 |
                    _CharClassQuotationMark |
                    _CharClassReverseSolidus |
                    _CharClassSolidus |
                    _CharClassB |
                    _CharClassHexDigit |
                    _CharClassUnescaped |
                    _CharClassOther)

primitive _State1
  fun v(): U32 => 0
primitive _State2
  fun v(): U32 => 1

type LexerState is (_State1 | _State2)

actor Lexer                           // 0x00            0x01            0x02            0x03
  let _charClasses: Array[_CharClass] = [_CharClassOther;_CharClassOther;_CharClassOther;_CharClassOther
                                      // 0x04            0x05            0x06            0x07
                                         _CharClassOther;_CharClassOther;_CharClassOther;_CharClassOther
                                      // 0x08            0x09         0x0a         0xb
                                         _CharClassOther;_CharClassWs;_CharClassWs;_CharClassOther
                                      // 0x0c            0x0d         0x0e            0x0f
                                         _CharClassOther;_CharClassWs;_CharClassOther;_CharClassOther
                                      // 0x10            0x11            0x12            0x13
                                         _CharClassOther;_CharClassOther;_CharClassOther;_CharClassOther
                                      // 0x14            0x15            0x16            0x17
                                         _CharClassOther;_CharClassOther;_CharClassOther;_CharClassOther
                                      // 0x18            0x19            0x1a            0x1b
                                         _CharClassOther;_CharClassOther;_CharClassOther;_CharClassOther
                                      // 0x1c            0x1d            0x1e            0x1f
                                         _CharClassOther;_CharClassOther;_CharClassOther;_CharClassOther
                                      // 0x20         0x21                0x22                    0x23
                                         _CharClassWs;_CharClassUnescaped;_CharClassQuotationMark;_CharClassUnescaped
                                      // 0x24                0x25                0x26                0x27
                                         _CharClassUnescaped;_CharClassUnescaped;_CharClassUnescaped;_CharClassUnescaped
                                      // 0x28                0x29                0x2a                0x2b
                                         _CharClassUnescaped;_CharClassUnescaped;_CharClassUnescaped;_CharClassPlus
                                      // 0x2c                     0x2d            0x2e                   0x2f
                                         _CharClassValueSeparator;_CharClassMinus;_CharClassDecimalPoint;_CharClassSolidus
                                      // 0x30            0x31            0x32            0x33
                                         _CharClassDigit0;_CharClass19;_CharClass19;_CharClass19
                                      // 0x34            0x35            0x36            0x37
                                         _CharClass19;_CharClass19;_CharClass19;_CharClass19
                                      // 0x38            0x39            0x3a            0x3b
                                         _CharClass19;_CharClass19;_CharClassNameSeparator;_CharClassUnescaped
                                      // 0x3c            0x3d            0x3e            0x3f
                                         _CharClassUnescaped;_CharClassUnescaped;_CharClassUnescaped;_CharClassUnescaped
                                      // 0x40            0x41            0x42            0x43
                                         _CharClassUnescaped;_CharClassHexDigit;_CharClassHexDigit;_CharClassHexDigit
                                      // 0x44            0x45            0x46            0x47
                                         _CharClassHexDigit;_CharClassBigE;_CharClassHexDigit;_CharClassUnescaped
                                      // 0x48            0x49            0x4a            0x4b
                                         _CharClassUnescaped;_CharClassUnescaped;_CharClassUnescaped;_CharClassUnescaped
                                      // 0x4c            0x4d            0x4e            0x4f
                                         _CharClassUnescaped;_CharClassUnescaped;_CharClassUnescaped;_CharClassUnescaped
                                      // 0x50            0x51            0x52            0x53
                                         _CharClassUnescaped;_CharClassUnescaped;_CharClassUnescaped;_CharClassUnescaped
                                      // 0x54            0x55            0x56            0x57
                                         _CharClassUnescaped;_CharClassUnescaped;_CharClassUnescaped;_CharClassUnescaped
                                      // 0x58            0x59            0x5a            0x5b
                                         _CharClassUnescaped;_CharClassUnescaped;_CharClassUnescaped;_CharClassBeginArray
                                      // 0x5c            0x5d            0x5e            0x5f
                                         _CharClassReverseSolidus;_CharClassEndArray;_CharClassUnescaped;_CharClassUnescaped
                                      // 0x60            0x61            0x62            0x63
                                         _CharClassUnescaped;_CharClassA;_CharClassB;_CharClassHexDigit
                                      // 0x64            0x65            0x66            0x67
                                         _CharClassHexDigit;_CharClassE;_CharClassF;_CharClassUnescaped
                                      // 0x68            0x69            0x6a            0x6b
                                         _CharClassUnescaped;_CharClassUnescaped;_CharClassUnescaped;_CharClassUnescaped
                                      // 0x6c            0x6d            0x6e            0x6f
                                         _CharClassL;_CharClassUnescaped;_CharClassN;_CharClassUnescaped
                                      // 0x70            0x71            0x72            0x73
                                         _CharClassUnescaped;_CharClassUnescaped;_CharClassR;_CharClassS
                                      // 0x74            0x75            0x76            0x77
                                         _CharClassT;_CharClassU;_CharClassUnescaped;_CharClassUnescaped
                                      // 0x78            0x79            0x7a            0x7b
                                         _CharClassUnescaped;_CharClassUnescaped;_CharClassUnescaped;_CharClassBeginObject
                                      // 0x7c            0x7d            0x7e            0x7f
                                         _CharClassUnescaped;_CharClassEndObject;_CharClassUnescaped;_CharClassOther
                                      // 0x80            0x81            0x82            0x83
                                         _CharClassOther;_CharClassOther;_CharClassOther;_CharClassOther
                                      // 0x84            0x85            0x86            0x87
                                         _CharClassOther;_CharClassOther;_CharClassOther;_CharClassOther
                                      // 0x88            0x89            0x8a            0x8b
                                         _CharClassOther;_CharClassOther;_CharClassOther;_CharClassOther
                                      // 0x8c            0x8d            0x8e            0x8f
                                         _CharClassOther;_CharClassOther;_CharClassOther;_CharClassOther
                                      // 0x90            0x91            0x92            0x93
                                         _CharClassOther;_CharClassOther;_CharClassOther;_CharClassOther
                                      // 0x94            0x95            0x96            0x97
                                         _CharClassOther;_CharClassOther;_CharClassOther;_CharClassOther
                                      // 0x98            0x99            0x9a            0x9b
                                         _CharClassOther;_CharClassOther;_CharClassOther;_CharClassOther
                                      // 0x9c            0x9d            0x9e            0x9f
                                         _CharClassOther;_CharClassOther;_CharClassOther;_CharClassOther
                                      // 0xa0            0xa1            0xa2            0xa3
                                         _CharClassOther;_CharClassOther;_CharClassOther;_CharClassOther
                                      // 0xa4            0xa5            0xa6            0xa7
                                         _CharClassOther;_CharClassOther;_CharClassOther;_CharClassOther
                                      // 0xa8            0xa9            0xaa            0xab
                                         _CharClassOther;_CharClassOther;_CharClassOther;_CharClassOther
                                      // 0xac            0xad            0xae            0xaf
                                         _CharClassOther;_CharClassOther;_CharClassOther;_CharClassOther
                                      // 0xb0            0xb1            0xb2            0xb3
                                         _CharClassOther;_CharClassOther;_CharClassOther;_CharClassOther
                                      // 0xb4            0xb5            0xb6            0xb7
                                         _CharClassOther;_CharClassOther;_CharClassOther;_CharClassOther
                                      // 0xb8            0xb9            0xba            0xbb
                                         _CharClassOther;_CharClassOther;_CharClassOther;_CharClassOther
                                      // 0xbc            0xbd            0xbe            0xbf
                                         _CharClassOther;_CharClassOther;_CharClassOther;_CharClassOther
                                      // 0xc0            0xc1            0xc2            0xc3
                                         _CharClassOther;_CharClassOther;_CharClassOther;_CharClassOther
                                      // 0xc4            0xc5            0xc6            0xc7
                                         _CharClassOther;_CharClassOther;_CharClassOther;_CharClassOther
                                      // 0xc8            0xc9            0xca            0xcb
                                         _CharClassOther;_CharClassOther;_CharClassOther;_CharClassOther
                                      // 0xcc            0xcd            0xce            0xcf
                                         _CharClassOther;_CharClassOther;_CharClassOther;_CharClassOther
                                      // 0xd0            0xd1            0xd2            0xd3
                                         _CharClassOther;_CharClassOther;_CharClassOther;_CharClassOther
                                      // 0xd4            0xd5            0xd6            0xd7
                                         _CharClassOther;_CharClassOther;_CharClassOther;_CharClassOther
                                      // 0xd8            0xd9            0xda            0xdb
                                         _CharClassOther;_CharClassOther;_CharClassOther;_CharClassOther
                                      // 0xdc            0xdd            0xde            0xdf
                                         _CharClassOther;_CharClassOther;_CharClassOther;_CharClassOther
                                      // 0xe0            0xe1            0xe2            0xe3
                                         _CharClassOther;_CharClassOther;_CharClassOther;_CharClassOther
                                      // 0xe4            0xe5            0xe6            0xe7
                                         _CharClassOther;_CharClassOther;_CharClassOther;_CharClassOther
                                      // 0xe8            0xe9            0xea            0xeb
                                         _CharClassOther;_CharClassOther;_CharClassOther;_CharClassOther
                                      // 0xec            0xed            0xee            0xef
                                         _CharClassOther;_CharClassOther;_CharClassOther;_CharClassOther
                                      // 0xf0            0xf1            0xf2            0xf3
                                         _CharClassOther;_CharClassOther;_CharClassOther;_CharClassOther
                                      // 0xf4            0xf5            0xf6            0xf7
                                         _CharClassOther;_CharClassOther;_CharClassOther;_CharClassOther
                                      // 0xf8            0xf9            0xfa            0xfb
                                         _CharClassOther;_CharClassOther;_CharClassOther;_CharClassOther
                                      // 0xfc            0xfd            0xfe            0xff
                                         _CharClassOther;_CharClassOther;_CharClassOther;_CharClassOther]
  let _transitions: Array[LexerState] = [_State1; _State2]
  new create() =>
    var x : U64 = 0
