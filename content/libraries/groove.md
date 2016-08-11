---
title: Groove Support Widget
contributors:
  - user:     jscheel
    name:     Jared A. Scheel
---

# Groove Support Widget

> **[groovehq.com/apps/widget](https://www.groovehq.com/apps/widget)**

### Official Implementation
After creating and customizing a widget, you will be give an embed code similar to this:

```html
<!-- BEGIN GROOVE WIDGET CODE -->
<script id="grv-widget">
  /*<![CDATA[*/
  var _grvq = [];
  _grvq.push(['setWidgetId', '[[INSERT YOUR WIDGET ID HERE]]']);
  !function(t,e,o){var a,n,c=e.createElement("iframe");(c.frameElement||c).style.cssText="width: 0; height: 0; border: 0",c.title="",c.role="presentation",c.src="javascript:false",e.body.appendChild(c);try{a=c.contentWindow.document}catch(i){n=e.domain,c.src="javascript:document.write('<head><script>document.domain='" + n + "'</"+"script></head><body></body>')",a=c.contentWindow.document}var d="https:"==e.location.protocol?"https://":"http://",r="http://groove-widget-production.s3.amazonaws.com".replace("http://",d);c.className="grv-widget-tag",a.open()._l=function(){n&&(this.domain=n);var t=this.createElement("script");t.type="text/javascript",t.charset="utf-8",t.async=!0,t.src=r+"/loader.js",this.body.appendChild(t)},a.write('<body onload="document._l();">'),a.close()}(window,document);
  /*]]>*/
</script>
<!-- END GROOVE WIDGET CODE -->
```

### Solution
Remove the supplied embed code and add the following to your application. Don’t forget to replace the "widget id" placeholder with your widget id.

For more information, read [this knowledge base article on turbolinks compatibility](https://groove.groovehq.com/knowledge_base/topics/support-widget-turbolinks-compatibility).

```html
<!-- BEGIN GROOVE WIDGET CODE -->
<script id="grv-widget">
  /*<![CDATA[*/
  var _grvq = [];
  _grvq.push(['setWidgetId', '[[INSERT YOUR WIDGET ID HERE]]']);
  _grvq.push(['setAutoload', false]);
  (function(){
    var loadEvent = 'turbolinks:load';
    var unloadEvent = 'turbolinks:before-visit';
    var loadHandler = function() {
      document.removeEventListener(loadEvent, loadHandler);
      document.addEventListener(unloadEvent, unloadHandler);
      _grvq.push(['load']);
    };
    var unloadHandler = function() {
      document.removeEventListener(unloadEvent, unloadHandler);
      _grvq.push(['unload']);
    };
    document.addEventListener(loadEvent, loadHandler);
    setTimeout(function() {
      !function(t,e,o){var a,c,n=e.createElement("iframe");(n.frameElement||n).style.cssText="width: 0; height: 0; border: 0",n.title="",n.role="presentation",n.src="javascript:false",e.body.appendChild(n);try{a=n.contentWindow.document}catch(r){c=e.domain;var d="javascript:document.write('<head><script>document.domain=\""+c+'";</',i="script></head><body></body>')";n.src=d+i,a=n.contentWindow.document}var s="https:"==e.location.protocol?"https://":"http://",l="http://localhost:3000".replace("http://",s);n.className="grv-widget-tag",a.open()._l=function(){c&&(this.domain=c);var t=this.createElement("script");t.type="text/javascript",t.charset="utf-8",t.async=!0,t.src=l+"/loader.js",this.body.appendChild(t)},a.write('<body onload="document._l();">'),a.close()}(window,document);
    }, 1);
  })();
  /*]]>*/
</script>
<!-- END GROOVE WIDGET CODE -->
```
