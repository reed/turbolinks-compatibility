---
title: Olark
contributors:
  - user:     Empact
    name:     Ben Woosley
issues:
  - repo:     rails/turbolinks
    number:   166
---

# Olark Chat Widget 

> **[olark.com](http://olark.com)**

### Overview

The supplied javascript will look something like this:

```html
<script>
  window.olark || (function(c){
    // initialization code
  })({ 
    loader: "static.olark.com/jsclient/loader0.js", 
    name: "olark", 
    methods: ["configure", "extend", "declare", "identify"]
  });
  olark.identify('<your identity string>');
</script>
```

### Solution

Add the following code after embedding Olark on to the page, to persist the dom between page changes.


```javascript
/*
    Turbolinks works by replacing the elements inside of the <body> tags with new content.
    The below code makes sure that the HTML tags created by Olark are persisted on the page when turbolinks does it's magic.
  
    USE AT YOUR OWN RISK, THIS CODE IS UNSUPPORTED
    
    KNOWN ISSUES:
      In some versions of safari we have seen occsional errors:
        TypeError: undefined is not a function (evaluating '_.postMessage(t,n)')
      
      This happens during page transitions when the iframe is removed from the dom.
      
  */

  
  (function(){
    // Keep track of Olark Elements on the page
    var olarkElements = undefined;
    
    // Find all the Olark Dom Elements, so that when turbolinks removes them we can add them back.
    function findAndGrabOlarkDomElements(){
      var olarkMainDiv = document.getElementById("habla_beta_container_do_not_rely_on_div_classes_or_names");
      var olarkLoader = null;
      var olarkFrameStore = null;
    
      // find framestore and storage iframe
      var iframes = document.getElementsByTagName("iframe");
      for(var i=0;i<iframes.length;i++){
        var iframe = iframes[i];
      
        if(iframe && iframe.id){
          if (iframe.id.match(/olark-loader/)){
            // TODO make this work in IE
            if(iframe.parentElement){
              olarkLoader = iframe.parentElement.parentElement;
              console.log('loader', olarkLoader)
            }
          }
          else if(iframe.id.match(/olark_framesocket/)){
            // TODO make this work in IE
            if(iframe.parentElement){
              olarkFrameStore = iframe.parentElement;
              console.log('frame', olarkFrameStore)
            }            
          }
        }
      }
      return [olarkMainDiv, olarkLoader,  olarkFrameStore]
    }
  
    // Register Turbolinks event handlers so we can grab our dom elements before it's too late.
    // (from docs: https://github.com/rails/turbolinks)
    document.addEventListener('page:before-unload', function(){
      olarkElements = findAndGrabOlarkDomElements()
    });
  
    document.addEventListener('page:change', function(){
      if(olarkElements){
        var body = document.getElementsByTagName("body")[0]
        for(var i=0;i<olarkElements.length;i++){
          body.appendChild(olarkElements[i]);    
        }         
      }
    });
    
  })();
```
