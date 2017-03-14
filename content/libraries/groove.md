---
title: Groove Support Widget
contributors:
  - user:     jscheel
    name:     Jared A. Scheel
---

# Groove Support Widget

> **[groovehq.com/apps/widget](https://www.groovehq.com/apps/widget)**

## Turbolinks-classic

### Official Implementation
After creating and customizing a widget, you will be give an embed code similar to this:

```html
<!-- BEGIN GROOVE WIDGET CODE -->
<script id="grv-widget">
  /*<![CDATA[*/
    window.groove = window.groove || {}; groove.widget = function(){ groove._widgetQueue.push(Array.prototype.slice.call(arguments)); }; groove._widgetQueue = [];
    groove.widget('setWidgetId', '[[INSERT YOUR WIDGET ID HERE]]');
    !function(g,r,v){var a,c,n=r.createElement("iframe");(n.frameElement||n).style.cssText="width: 0; height: 0; border: 0",n.title="",n.role="presentation",n.src="javascript:false",r.body.appendChild(n);try{a=n.contentWindow.document}catch(b){c=r.domain;var d="javascript:document.write('<head><script>document.domain=\""+c+"\";</",i="script></head><body></body>')";n.src=d+i,a=n.contentWindow.document}var s="https:"==r.location.protocol?"https://":"http://",p="http://groove-widget-production.s3.amazonaws.com".replace("http://",s);n.className="grv-widget-tag",a.open()._l=function(){c&&(this.domain=c);var t=this.createElement("script");t.type="text/javascript",t.charset="utf-8",t.async=!0,t.src=p+"/loader.js",this.body.appendChild(t)},a.write('<body onload="document._l();">'),a.close()}(window,document);
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
  window.groove = window.groove || {}; groove.widget = function(){ groove._widgetQueue.push(Array.prototype.slice.call(arguments)); }; groove._widgetQueue = [];
  groove.widget('setWidgetId', 'INSERT YOUR WIDGET ID HERE');
  groove.widget('setAutoload', false);
  (function(){
    var loadEvent = 'turbolinks:load';
    var unloadEvent = 'turbolinks:before-visit';
    var loadHandler = function() {
      document.removeEventListener(loadEvent, loadHandler);
      document.addEventListener(unloadEvent, unloadHandler);
      groove.widget('load');
    };
    var unloadHandler = function() {
      document.removeEventListener(unloadEvent, unloadHandler);
      groove.widget('unload');
    };
    document.addEventListener(loadEvent, loadHandler);
    setTimeout(function() {
      !function(g,r,v){var a,c,n=r.createElement("iframe");(n.frameElement||n).style.cssText="width: 0; height: 0; border: 0",n.title="",n.role="presentation",n.src="javascript:false",r.body.appendChild(n);try{a=n.contentWindow.document}catch(b){c=r.domain;var d="javascript:document.write('<head><script>document.domain=\""+c+"\";</",i="script></head><body></body>')";n.src=d+i,a=n.contentWindow.document}var s="https:"==r.location.protocol?"https://":"http://",p="http://groove-widget-production.s3.amazonaws.com".replace("http://",s);n.className="grv-widget-tag",a.open()._l=function(){c&&(this.domain=c);var t=this.createElement("script");t.type="text/javascript",t.charset="utf-8",t.async=!0,t.src=p+"/loader.js",this.body.appendChild(t)},a.write('<body onload="document._l();">'),a.close()}(window,document);
    }, 1);
  })();
  /*]]>*/
</script>
<!-- END GROOVE WIDGET CODE -->
```
