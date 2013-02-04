---
title: FancyBox
---

# FancyBox

### [fancybox.net/howto](http://fancybox.net/howto)

FancyBox (>= 2.1.2) is known to work with Turbolinks without modifications.

For version 1.3.4, just add this to your application's javascript:

```coffeescript
$(document).bind 'page:change', ->
  $.fancybox.init()
```

*Related Turbolinks issue:* [#96](https://github.com/rails/turbolinks/issues/96)

*Credit:* [@R-osey](https://github.com/R-osey), [Juan de Dios Herrero](https://github.com/jd-erreape)