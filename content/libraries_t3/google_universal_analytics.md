---
title: Google Universal Analytics
contributors:
  - user:     rmarescu
    name:     Razvan Marescu
  - user:     michellekaye
    name:     Michelle Kaye Lagunsad
  - user:     jdibella
    name:     Jake DiBella
issues:
  - repo:     rails/turbolinks
    number:   166
---

# Google Universal Analytics

> **[support.google.com/analytics/answer/2790010](https://support.google.com/analytics/answer/2790010?hl=en)**

### Official Implementation

```html
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-123456-1', 'auto');
  ga('send', 'pageview');
</script>
```

### Solution

This solution comes with minimum code change from official implementation. Google recommends adding the code after the opening `<body>` tag. Replace `UA-123456-1` with your own Tracking ID.

```html
<script data-turbolinks-eval="false">
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-123456-1', 'auto');
</script>
<script>
  ga('set', 'location', location.href.split('#')[0]);
  ga('send', 'pageview', { "title": document.title });
</script>
```

Basically there are 3 changes:

* Initialize `ga` in a JavaScript tag that is not [re-evaluated](https://github.com/rails/turbolinks#evaluating-script-tags)
* Set location manually, otherwise the URL of the page being tracked will not be send correctly (by [default](https://developers.google.com/analytics/devguides/collection/analyticsjs/pages), `location` doesn't preserve the anchor)
* Set title of the page manually so that is properly associated with your pageview
