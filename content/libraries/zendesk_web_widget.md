---
title: Zendesk Web Widget
contributors:
  - user:     brianac
    name:     Briana Coppard
  - user:     koppen
    name:     Jakob Skjerning
---

# Zendesk Web Widget

> **[zendesk.com/embeddables](https://www.zendesk.com/embeddables)**

### Official Implementation

```html
<!-- Start of Zendesk Widget script -->
<script id="ze-snippet" src="https://static.zdassets.com/ekr/snippet.js?key=re-dac-ted"> </script>
<!-- End of Zendesk Widget script -->
```

### Solution

Insert the supplied Javascript in the `body` of your responses instead of in the `head` as suggested by Zendesk. Don’t forget to replace the key placeholder with your own key.

Then add an event listener that clears the `zEACLoaded` flag before rendering the next page somewhere in your `head` or application scripts:

```javascript
window.addEventListener('turbolinks:before-render', function () {
  window.zEACLoaded = undefined;
});
```


## Zendesk Web Widget (legacy)

> **[zendesk.com/embeddables](https://www.zendesk.com/embeddables)**

### Official Implementation

```html
<script>
  window.zEmbed || (function(url, host) {
    var queue = [],
        dom,
        doc,
        where,
        iframe = document.createElement('iframe'),
        iWin,
        iDoc;

    window.zEmbed = function() {
      queue.push(arguments);
    };

    window.zE = window.zE || window.zEmbed;

    iframe.src = 'javascript:false';
    iframe.title = ''; iframe.role='presentation';  // a11y
    (iframe.frameElement || iframe).style.cssText = 'display: none';
    where = document.getElementsByTagName('script');
    where = where[where.length - 1];
    where.parentNode.insertBefore(iframe, where);

    iWin = iframe.contentWindow;
    iDoc = iWin.document;

    try {
      doc = iDoc;
    } catch(e) {
      dom = document.domain;
      iframe.src='javascript:var d=document.open();d.domain="'+dom+'";void(0);';
      doc = iDoc;
    }
    doc.open()._l = function() {
      var js = this.createElement('script');
      if (dom) this.domain = dom;
      js.id = 'js-iframe-async';
      js.src = url;
      this.t = +new Date();
      this.zendeskHost = host;
      this.zEQueue = queue;
      this.body.appendChild(js);
    };
    doc.write('<body onload="document._l();">');
    doc.close();
  }('//assets.zendesk.com/embeddable_framework/main.js', "subdomain"));
</script>
```

### Solution

Remove the supplied javascript and add the following to your application's javascript. Don’t forget to replace the “subdomain” placeholder with your subdomain.

```javascript
<script>
  function zendesk_web_widget(){
    window.zEmbed = window.zE = null;
    $('head iframe[src="javascript:false"]').remove();

    (function(url, host) {
      var queue = [],
          dom,
          doc,
          where,
          iframe = document.createElement('iframe'),
          iWin,
          iDoc;

      window.zEmbed = function() {
        queue.push(arguments);
      };

      window.zE = window.zE || window.zEmbed;

      iframe.src = 'javascript:false';
      iframe.title = ''; iframe.role='presentation';  // a11y
      (iframe.frameElement || iframe).style.cssText = 'display: none';
      where = document.getElementsByTagName('script');
      where = where[where.length - 1];
      where.parentNode.insertBefore(iframe, where);

      iWin = iframe.contentWindow;
      iDoc = iWin.document;

      try {
        doc = iDoc;
      } catch(e) {
        dom = document.domain;
        iframe.src='javascript:var d=document.open();d.domain="'+dom+'";void(0);';
        doc = iDoc;
      }
      doc.open()._l = function() {
        var js = this.createElement('script');
        if (dom) this.domain = dom;
        js.id = 'js-iframe-async';
        js.src = url;
        this.t = +new Date();
        this.zendeskHost = host;
        this.zEQueue = queue;
        this.body.appendChild(js);
      };
      doc.write('<body onload="document._l();">');
      doc.close();
    }('//assets.zendesk.com/embeddable_framework/main.js', "subdomain"));
  }

  $(document).on("ready page:load", function() {
    zendesk_web_widget();
  });
</script>

```
