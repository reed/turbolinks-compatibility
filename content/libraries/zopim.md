---
title: Zopim
contributors:
  - user:     fpleme
    name:     Fernão Paes Leme

  - user:     reed
    name:     Nick Reed

  - user:     eveevans
  - name:     Erick Vanegas
issues:
  - repo:     rails/turbolinks
    number:   131
---

# Zopim Live Chat Widget

> **[zopim.com/product](https://www.zopim.com/product)**

## Turbolinks-classic

### Official Implementation

```html
<body>
<!--Start of Zopim Live Chat Script-->
<script type="text/javascript">
window.$zopim||(function(d,s){var z=$zopim=function(c){z._.push(c)},$=z.s=
d.createElement(s),e=d.getElementsByTagName(s)[0];z.set=function(o){z.set.
_.push(o)};z._=[];z.set._=[];$.async=!0;$.setAttribute("charset","utf-8");
$.src="//v2.zopim.com/?MY_APP_KEY";z.t=+new Date;$.
type="text/javascript";e.parentNode.insertBefore($,e)})(document,"script");
</script>
<!--End of Zopim Live Chat Script-->
</body>
```

### Solution

Remove the supplied javascript and add the following to your application's javascript.

```javascript
<script type="text/javascript">
  function zopim_chat(){$('[__jx__id]').remove();
  window.$zopim = null;
  (function(d,s){
    var z=$zopim=function(c){z._.push(c)},$=z.s=d.createElement(s),e=d.getElementsByTagName(s)[0];
    z.set=function(o){z.set._.push(o)};
    z._=[];
    z.set._=[];
    $.async=!0
    ;$.setAttribute('charset','utf-8');
    $.src='//v2.zopim.com/?MY_APP_KEY';
    z.t=+new Date;
    $.type='text/javascript';e.parentNode.insertBefore($,e)})(document,'script')};
    $(window).off('page:change.zopim').on('page:change.zopim', zopim_chat);
    // zopim_chat();
</script>


```
