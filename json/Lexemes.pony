interface Lexeme
  fun start(): U32
  fun stop(): U32

class BeginArray
  let _position: U32
  
  new create(position: U32) =>
    _position = position
  
  fun start(): U32 =>
    _position 
  
  fun stop(): U32 =>
    _position + 1

class BeginObject
  let _position: U32
  
  new create(position: U32) =>
    _position = position
  
  fun start(): U32 =>
    _position 
  
  fun stop(): U32 =>
    _position + 1

class EndArray
  let _position: U32
  
  new create(position: U32) =>
    _position = position
  
  fun start(): U32 =>
    _position 
  
  fun stop(): U32 =>
    _position + 1

class EndObject
  let _position: U32
  
  new create(position: U32) =>
    _position = position
  
  fun start(): U32 =>
    _position 
  
  fun stop(): U32 =>
    _position + 1

class NameSeparator
  let _position: U32
  
  new create(position: U32) =>
    _position = position
  
  fun start(): U32 =>
    _position 
  
  fun stop(): U32 =>
    _position + 1

class ValueSeparator
  let _position: U32
  
  new create(position: U32) =>
    _position = position
  
  fun start(): U32 =>
    _position 
  
  fun stop(): U32 =>
    _position + 1

class FalseToken
  let _position: U32
  
  new create(position: U32) =>
    _position = position
  
  fun start(): U32 =>
    _position 
  
  fun stop(): U32 =>
    _position + 5

class NullToken
  let _position: U32
  
  new create(position: U32) =>
    _position = position
  
  fun start(): U32 =>
    _position 
  
  fun stop(): U32 =>
    _position + 4

class TrueToken
  let _position: U32
  
  new create(position: U32) =>
    _position = position
  
  fun start(): U32 =>
    _position 
  
  fun stop(): U32 =>
    _position + 4

class NumberToken
  let _position: U32
  let _string: String

  new create(position: U32, string: String) => 
    _position = position
    _string = string

  fun start(): U32 =>
    _position

  fun stop(): U32 =>
    _position + U32.from[USize](_string.size())

  fun value(): F64 =>
    _string.f64()
