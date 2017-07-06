---
title: JivoChat
contributors:
  - user:     jfloff
    name:     Joao Ferreira Loff
---

# JivoChat

> **[jivochat.com](http://jivochat.com/)**

I had problems with JivoChat when changing pages, which has been reported by [others](https://stackoverflow.com/questions/39273134/turbolinks-and-3d-party-plugins-issue).

### Official Implementation
After creating and customizing a widget, you will be give an embed code similar to this:

```html
<!-- BEGIN JIVOSITE CODE {literal} -->
<script type='text/javascript'>
(function(){ var widget_id = 'JIVOCHAT_ID';var d=document;var w=window;function l(){
var s = document.createElement('script'); s.type = 'text/javascript'; s.async = true; s.src = '//code.jivosite.com/script/widget/'+widget_id; var ss = document.getElementsByTagName('script')[0]; ss.parentNode.insertBefore(s, ss);}if(d.readyState=='complete'){l();}else{if(w.attachEvent){w.attachEvent('onload',l);}else{w.addEventListener('load',l,false);}}})();</script>
<!-- {/literal} END JIVOSITE CODE -->
```

### Solution
Just add the following code `s.setAttribute('data-turbolinks-track', 'reload');` in between existing code, like this:
<pre><code>
s.type = 'text/javascript'; <b>s.setAttribute('data-turbolinks-track', 'reload');</b> s.async = true;
</code></pre>
