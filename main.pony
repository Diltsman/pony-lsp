use "json"

actor Main
  new create(env: Env) =>
    let l : Lexeme = BeginArray(0)
    env.out.print("Hello, world!")
