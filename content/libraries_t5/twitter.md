---
title: Twitter
---

# Twitter Widgets

## Buttons

### Official Implementation

```html
<body>
  <a href="https://twitter.com/share" class="twitter-share-button" data-url="http://mysite.com" data-size="large">Tweet</a>
  <script>
  !function(d,s,id){
    var js, fjs = d.getElementsByTagName(s)[0];
    if (!d.getElementById(id)){
      js = d.createElement(s);
      js.id = id;
      js.src = "//platform.twitter.com/widgets.js";
      fjs.parentNode.insertBefore(js,fjs);
    }
  }(document,"script","twitter-wjs");
  </script>
</body>
```

### Solutions

```coffeescript
$.getScript "//platform.twitter.com/widgets.js", ->
  $(document).on 'turbolinks:load', renderTweetButtons
  twttr_events_bound = true

renderTweetButtons = ->
  $('.twitter-share-button').each ->
    button = $(this)
    button.attr('data-url', document.location.href) unless button.data('url')?
    button.attr('data-text', document.title) unless button.data('text')?
    twttr.widgets.load()
```
