Commands =
  sayHello: ->
    alert "Hello!"

window.addEventListener "message", (request) ->
  Commands[request.data?.name]? request
