---
title: "Google Analytics"
---

# Google Analytics

### [google.com/analytics](http://www.google.com/analytics/)

Move the javascript snippet from the head to the body and load the following script inside the `<head>`.

```coffeescript
$(document).on 'page:change', ->
  if window._gaq?
    _gaq.push ['_trackPageview']
  else if window.pageTracker?
    pageTracker._trackPageview()
```

*Related Turbolinks issue:* [#166](https://github.com/rails/turbolinks/issues/166)

*Credit:* [Shuky Dvir](https://github.com/shukydvir)