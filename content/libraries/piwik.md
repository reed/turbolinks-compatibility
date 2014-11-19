---
title: Piwik
contributors:
  - user:   halfdan
    name:   Fabian Becker
  - user:   makkrnic
    name:   Mak Krnic
---

# Piwik - Open Source Web Analytics

> **[piwik.org](http://piwik.org/)**

Move the JavaScript snippet from the head to the body and load the following script inside the `<head>`.

```coffeescript
$(document).on 'page:change', ->
  if window._paq?
    _paq.push ['trackPageView']
  else if window.piwikTracker?
    piwikTracker.trackPageview()
```

Also, you will probably want to include the following code after `var _paq = _paq || [];` to the body snippet so tracked title and url are updated accordingly:

```javascript
_paq.push(['setCustomUrl', document.location]);
_paq.push(['setDocumentTitle', document.title]);
```
