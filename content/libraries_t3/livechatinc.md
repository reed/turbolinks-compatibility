---
title: LiveChat
contributors:
  - user:     maddijoyce
    name:     Maddi Joyce
    
  - user:     reed
    name:     Nick Reed
issues:
  - repo:     reed/turbolinks-compatibility
    number:   21
---

# LiveChat (livechatinc) Plugin

> **[livechatinc.com](https://www.livechatinc.com)**

### Official Implementation

```html
<body>
  <script>
  var __lc = {};
  __lc.license = #######;

  (function() {
      var lc = document.createElement('script'); lc.type = 'text/javascript'; lc.async = true;
      lc.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'cdn.livechatinc.com/tracking.js';
      var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(lc, s);
  })();
  </script>
</body>
```

### Solution

Replace the javascript with the following:

```javascript
var __lc = {};
__lc.license = #######;

(function() {
    delete(window.LC_API);
    delete(window.LC_Invite);
    delete(window.__lc_iframe_current_skill);
    delete(window.__lc_inited);
    delete(window.__lc_lang);
    var lc = document.createElement('script'); lc.type = 'text/javascript'; lc.async = true;
    lc.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'cdn.livechatinc.com/tracking.js';
    var s = document.body.getElementsByTagName('script')[0]; s.parentNode.insertBefore(lc, s);
})();
```
