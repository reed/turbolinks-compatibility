---
title: Google+
contributors:
  - user:     reed
    name:     Nick Reed
issues:
  - repo:     reed/turbolinks-compatibility
    number:   9
---

# Google+

> **[developers.google.com/+/web/+1button](https://developers.google.com/+/web/+1button/)**

## Turbolinks-classic

### Official Implementation

```html
<script type="text/javascript" src="https://apis.google.com/js/plusone.js"></script>
<g:plusone></g:plusone>
```

### Solution

1.  Move the script tag inside the `<head>` and set the loading mechanism to 'explicit'.

    ```html
    <head>
      <script type="text/javascript" src="https://apis.google.com/js/plusone.js" parsetags="explicit"></script>
    </head>
    ```

2.  Add the following lines to your application's javascript:

    ```coffeescript
    $ ->
      gapi.plusone.go()
      $(document).on 'page:load', gapi.plusone.go
    ```
