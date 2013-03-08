---
title: ShareThis
---

# ShareThis

> **[sharethis.com/publishers/get-sharing-tools](http://sharethis.com/publishers/get-sharing-tools)**

### Official Implementation

```html
<head>
  <script type="text/javascript">var switchTo5x=false;</script>
  <script type="text/javascript" src="https://ws.sharethis.com/button/button.js"></script>
  <script type="text/javascript">stLight.options({publisher: 'your-publisher-id'});</script>
</head>
<body>
  <span class="st_sharethis_custom"></span>
</body>
```

### Solutions

Remove the script tags from the `head` and add the following coffeescript to your application:

```coffeescript
$ ->
  ShareThisTurbolinks.reload()
  
$(document).on 'page:load', ->
  ShareThisTurbolinks.reload()

$(document).on 'page:restore', ->
  ShareThisTurbolinks.restore()

ShareThisTurbolinks =
  load: ->
    window.switchTo5x = false
    $.getScript 'https://w.sharethis.com/button/buttons.js', ->
      window.stLight.options
        publisher: 'your-publisher-id'
  
  reload: ->
    stlib?.cookie.deleteAllSTCookie()
    $('[src*="sharethis.com"], [href*="sharethis.com"]').remove()
    window.stLight = undefined
    @load()
  
  restore: ->
    $('.stwrapper, #stOverlay').remove()
    @reload()
```

This is known to work with the example shown in the official implementation above.  If you use a more advanced implementation of ShareThis, and you find this solution isn't working, [let me know](https://github.com/reed/turbolinks-compatibility/issues).

*Related issue:* [#4](https://github.com/reed/turbolinks-compatibility/issues/4)

*Credit:* [Nick Reed](https://github.com/reed)
