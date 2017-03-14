---
title: Google+ Platform/Sign-In
contributors:
  - user:       shaneog
    name:       Shane O'Grady
---

# Google+ Platform/Sign-In

> **[developers.google.com/+/web/signin/](https://developers.google.com/+/web/signin/)**

## Turbolinks-classic

### Official Implementation

Set configuration using [page-level configuration options](https://developers.google.com/+/web/signin/reference#page-config), and include the script in the page head.

```html
<head>
  <script src="https://apis.google.com/js/client:platform.js" async defer></script>
</head>
```

### Solution

Remove the script from the head and load the following script inside the `<head>`.

```coffeescript
google_frame = null
google_events_bound = false

$ ->
  unless google_events_bound
    loadGoogleSDK()
    bindGoogleEvents()
    google_events_bound = true

bindGoogleEvents = ->
  $(document)
    .on('page:fetch', saveGoogleFrame)
    .on('page:change', restoreGoogleFrame)

saveGoogleFrame = ->
  google_frame = $('iframe[id^="oauth2relay"]').detach()

restoreGoogleFrame = ->
  if $('iframe[id^="oauth2relay"]').length > 0
    $('iframe[id^="oauth2relay"]').replaceWith google_frame
  else
    $('body').append google_frame

loadGoogleSDK = ->
  # We load the platform script directly and load the
  # client library in the callback
  $.getScript('//apis.google.com/js/platform.js', initializeGoogleSDK)

initializeGoogleSDK = ->
  # You can load more libraries here depending on the platform features you want
  window.gapi.load('client', 'v1') if window.gapi
```

*I have implemented this specifically for Google+ Sign-In via JavaScript, but this method should also work for other Google+ Platform API libraries*
