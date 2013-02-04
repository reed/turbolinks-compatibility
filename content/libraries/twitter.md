---
title: Twitter
---

# Twitter Buttons

> **[twitter.com/about/resources/buttons](https://twitter.com/about/resources/buttons)**

### Official Implementation

```html
<body>
  <a href="https://twitter.com/share" class="twitter-share-button" data-via="njreed86" data-size="large">Tweet</a>
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

### Solution

Replace the supplied javascript snippet with an external script tag pointing to platform.twitter.com/widgets.js.

```html
<body>
  <a href="https://twitter.com/share" class="twitter-share-button" data-via="njreed86" data-size="large">Tweet</a>
  <script src="//platform.twitter.com/widgets.js"></script>
</body>
```

*Related Turbolinks issue:* [#119](https://github.com/rails/turbolinks/issues/119)

*Credit:* [Nick Reed](https://github.com/reednj77)
