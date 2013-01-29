---
title: "Google Analytics"
---

## Google Analytics

Move the javascript snippet from the head to the body and load the following script inside the `<head>`.

```coffeescript
$(document).on 'page:change', ->
  if window._gaq?
    _gaq.push ['_trackPageview']
  else if window.pageTracker?
    pageTracker._trackPageview()
```

*Credit:* [Shuky Dvir](https://github.com/shukydvir)