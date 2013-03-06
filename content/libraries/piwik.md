---
title: "Piwik"
---

# Piwik - Open Source Web Analytics

> **[piwik.org](http://piwik.org/)**

Move the JavaScript snippet from the head to the body and load the following script inside the `<head>`.

```coffeescript
$(document).on 'page:change', ->
  if window._paq?
    _paq.push ['trackPageview']
  else if window.piwikTracker?
    piwikTracker.trackPageview()
```

*Credit:* [Fabian Becker](https://github.com/halfdan)
