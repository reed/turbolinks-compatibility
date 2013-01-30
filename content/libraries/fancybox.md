---
title: FancyBox
---

# FancyBox

FancyBox (>= 2.1.2) is known to work with Turbolinks without modifications.

For version 1.3.4, just add this to your application's javascript:

```coffeescript
$(document).bind 'page:change', ->
  $.fancybox.init()
```

*Credit:* [Rose](https://github.com/R-osey), [Juan de Dios Herrero](https://github.com/jd-erreape)