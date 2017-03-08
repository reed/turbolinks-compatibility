---
title: FancyBox
contributors:
  - user:     R-osey
  
  - user:     jd-erreape
    name:     Juan de Dios Herrero
issues:
  - repo:     rails/turbolinks
    number:   96
---

# FancyBox

> **[fancybox.net/howto](http://fancybox.net/howto)**

FancyBox (>= 2.1.2) is known to work with Turbolinks without modifications.

For version 1.3.4, just add this to your application's javascript:

```coffeescript
$(document).bind 'page:change', ->
  $.fancybox.init()
```
