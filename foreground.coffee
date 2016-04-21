Commands =
  sayHello: ->
    alert "Hello!"

window.addEventListener "message", (request) ->
  Commands[request.data?.name]? request

for own command of Commands
  console.log "map X sendMessage name=#{command}"
