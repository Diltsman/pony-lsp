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

actor Lexer
  let _transitions: Array[LexerState] = [_State1; _State2]
  new create() =>
    var x : U64 = 0
