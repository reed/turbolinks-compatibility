---
title: Twitter
contributors:
  - user:     reed
    name:     Nick Reed
issues:
  - repo:     rails/turbolinks
    number:   119
---

# Twitter Buttons

> **[twitter.com/about/resources/buttons](https://twitter.com/about/resources/buttons)**

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

If all of your tweet buttons explicitly set the url and text properties (either through query parameters or data attributes), you can use either solution.  If not, and any or all of your tweet buttons rely on using the current url and document title, you must use the second solution.

The first solution is less work to implement, but the second might be faster since it only runs the widgets.js script once, on the initial page load.

*Solution #2 is implemented on this site.*

#### Solution #1

Replace the supplied javascript snippet with an external script tag pointing to platform.twitter.com/widgets.js.

```html
<body>
  <a href="https://twitter.com/share" class="twitter-share-button" data-url="http://mysite.com" data-size="large">Tweet</a>
  <script src="//platform.twitter.com/widgets.js"></script>
</body>
```

#### Solution #2

Replace the supplied javascript snippet with an external script tag pointing to platform.twitter.com/widgets.js.  Place this script tag inside the document head.

```html
<head>
  <script src="//platform.twitter.com/widgets.js"></script>
</head>
<body>
  <a href="https://twitter.com/share" class="twitter-share-button" data-size="large">Tweet</a>
</body>
```

Add the following code to your application's javascript (inside the document head):

```coffeescript
twttr_events_bound = false

$ ->
  bindTwitterEventHandlers() unless twttr_events_bound

bindTwitterEventHandlers = ->
  $(document).on 'page:load', renderTweetButtons
  twttr_events_bound = true

renderTweetButtons = ->
  $('.twitter-share-button').each ->
    button = $(this)
    button.attr('data-url', document.location.href) unless button.data('url')?
    button.attr('data-text', document.title) unless button.data('text')?  
  twttr.widgets.load()
```
