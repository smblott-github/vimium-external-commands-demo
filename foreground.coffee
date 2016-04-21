Commands =
  # Show a simple alert.
  sayHello: ->
    alert "Hello!"

  # Use link hints to select a link then do something with it (here, just show its link text).
  showLinkText: ({index}) ->
    element = document.documentElement.getElementsByTagName("*")[index]
    alert "The link text is #{element.textContent}."

window.addEventListener "message", (request) ->
  Commands[request.data?.name]? request.data

# These commands use link hints.
linkHintCommands = ["showLinkText"]

for own command of Commands
  extra = if command in linkHintCommands then "links " else ""
  console.log "map X sendMessage #{extra}name=#{command}"
