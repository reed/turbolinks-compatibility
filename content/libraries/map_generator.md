---
title: Map-Generator
---

# Map-Generator

[map-generator.net](http://map-generator.net)

After customizing the map you want, you will be given a generated code snippet that looks something like this:

```html
<div id="map_canvas_custom_48259" style="width:830px; height:350px" ></div>
<script type="text/javascript">
  // Line breaks inserted for readability.
  (function(d, t) {
    var g = d.createElement(t), s = d.getElementsByTagName(t)[0];
    g.src = "http://map-generator.net/en/maps/48259.js?point=New+York%2C+NY%2C+USA";
    s.parentNode.insertBefore(g, s);
  }(document, "script"));
</script>
<a class="mapgen-link" style="font:8px Arial;text-decoration:none;color:#5C5C5C;text-align: right; display: block; width: 830px;" href="http://map-generator.net/en">map-generator.net</a>
```

**Basic Solution**

If you only have one map on a single page of your application, you can get away with just adding the following to your application JS:

```coffeescript
$(document).bind 'page:load', ->
  initializeMgMaps() if $('#mggapiloader')?
```

**Advanced Solution**

This solution handles multiple maps on the same page or on separate pages of the application.

1.  Add a class to the script tag for each map you have in your application. 

    ```html
    <script class="init_map_generator" type="text/javascript">
    ```

2.  In your application JS, create a function to unload/remove Google Maps and bind it to both the `page:fetch` and `page:restore` events.

    ```coffeescript
    $(document).bind 'page:fetch', ->
      cleanMapGenerator()

    $(document).bind 'page:restore', ->
      cleanMapGenerator true
  
    cleanMapGenerator = (init) ->
      window.mapObjWrapper = undefined
      window.google.maps = undefined
      $('#mggapiloader').remove()
      $('[src*="google-analytics.com/ga.js"]').remove()
      $('[src*="map-generator.net"]').remove()
      $('[src*="maps.gstatic.com"]').remove()
      window.eval initMapGenerator.text() if init and (initMapGenerator = $('script.init_map_generator'))?
    ```
