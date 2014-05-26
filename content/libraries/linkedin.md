---
title: LinkedIn
contributors:
  - user:   zpasal
    name:   Zaharije Pasalic
---

# LinkedIn Share Button

> **[linkedin.com/plugins/share-plugin-generator](https://developer.linkedin.com/plugins/share-plugin-generator)**

### Official Implementation

```html
<body>
  <script src="//platform.linkedin.com/in.js" type="text/javascript">
    lang: en_US
  </script>
  <script type="IN/Share" data-url="http://mysite.com" data-counter="right"></script>  
</body>
```

### Solution


Remove the following script from `<body>`:

```html
<script src="//platform.linkedin.com/in.js" type="text/javascript">
  lang: en_US
</script>
```

Load the following script inside the `<head>`.

```coffeescript
$ ->
  loadLinkedIn()
  $(document).on 'page:load', loadLinkedIn

loadLinkedIn = ->
  delete IN
  $.getScript("//platform.linkedin.com/in.js")
  lang: 'en_US'
```
