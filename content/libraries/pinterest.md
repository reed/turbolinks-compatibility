---
title: Pinterest
contributors:
  - user:     gshaw
    name:     Gerry Shaw
  - user:     rmarescu
    name:     Razvan Marescu
issues:
  - repo:     reed/turbolinks-compatibility
    number:   28
---

# Pinterest

> **[business.pinterest.com/widget-builder/](http://business.pinterest.com/widget-builder/)**

## Turbolinks-classic

### Official Implementation

```html
<a href="//www.pinterest.com/pin/create/button/?url=http%3A%2F%2Fwww.flickr.com%2Fphotos%2Fkentbrew%2F6851755809%2F&media=http%3A%2F%2Ffarm8.staticflickr.com%2F7027%2F6851755809_df5b2051c9_z.jpg&description=Next%20stop%3A%20Pinterest" data-pin-do="buttonPin" data-pin-config="above"><img src="//assets.pinterest.com/images/pidgets/pinit_fg_en_rect_gray_20.png" /></a>
<!-- Please call pinit.js only once per page -->
<script type="text/javascript" async src="//assets.pinterest.com/js/pinit.js"></script>
```

### Solutions

This fix relies on the fact that Pinterest loads it's code into a `PIN_12345`
variable where `12345` is the current day since epoch.  If you inspect the `pinit.js`
file you will see the same calculation used to determine the variable to delete.

Remove the script tag from the `body` and the following coffeescript to your application:

```coffeescript
Pinterest =
  load: ->
    delete window["PIN_"+~~((new Date).getTime()/864e5)]
    $.getScript("//assets.pinterest.com/js/pinit.js")

$ ->
  Pinterest.load()

# if you're using jquery.turbolinks, you don't need this binding
$(document).on 'page:load', ->
  Pinterest.load()
```

Thanks to the [VanRuby Meetup](http://www.meetup.com/vancouver-ruby/) for help
and pizza on developing this fix.
