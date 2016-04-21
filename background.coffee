Commands =
  # Mute all tabs.
  muteAllAudio: ->
    chrome.tabs.query {audible: true}, (tabs) ->
      for tab in tabs
        chrome.tabs.update tab.id, muted: true

  # Taggle the mute status in the current tab.
  toggleMute: ->
    chrome.tabs.query {currentWindow: true, active: true}, (tabs) ->
      for tab in tabs
        chrome.tabs.update tab.id, muted: not tab.mutedInfo.muted

  # Focus the first audible tab.
  focusAudio: ->
    chrome.tabs.query {audible: true}, (tabs) ->
      if 0 < tabs.length
        tab = tabs[0]
        chrome.tabs.update tab.id, active: true, ->
          chrome.windows.update tab.windowId, focused: true

chrome.runtime.onMessageExternal.addListener (request) ->
  Commands[request.name]? request
