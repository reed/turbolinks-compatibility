---
title: Picturefill
contributors:
  - user:   jamesmkur
    name:   James Kurczodyna
---

# Picturefill

> **[github.com/scottjehl/picturefill](https://github.com/scottjehl/picturefill)**

## Turbolinks-classic

Initialize Picturefill with Turbolinks' page:load event.  

In vanilla JavaScript:

```javascript
window.addEventListener( "page:load", window.picturefill(), false );
```

In CoffeeScript:

```coffeescript
$(document).bind 'page:load', ->
  window.picturefill()
```
