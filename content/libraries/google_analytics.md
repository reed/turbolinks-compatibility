---
title: Google Analytics
contributors:
  - user:     shukydvir
    name:     Shuky Dvir
issues:
  - repo:     rails/turbolinks
    number:   166
---

# Google Analytics

> **[google.com/analytics](http://www.google.com/analytics/)**

Move the javascript snippet from the head to the body and load the following script inside the `<head>`.

```coffeescript
$(document).on 'page:change', ->
  if window._gaq?
    _gaq.push ['_trackPageview']
  else if window.pageTracker?
    pageTracker._trackPageview()
```
