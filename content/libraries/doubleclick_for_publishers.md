---
title: DoubleClick for Publishers
contributors:
  - user:     richardvenneman
    name:     Richard Venneman
issues:
  - repo:     reed/turbolinks-compatibility
    number:   36
---

# DoubleClick for Publishers

> **[google.com/dfp](http://www.google.com/doubleclick/publishers/welcome/)**

## Turbolinks-classic

### Official Implementation

```html
  <script type='text/javascript'>
  var googletag = googletag || {};
  googletag.cmd = googletag.cmd || [];
  (function() {
  var gads = document.createElement('script');
  gads.async = true;
  gads.type = 'text/javascript';
  var useSSL = 'https:' == document.location.protocol;
  gads.src = (useSSL ? 'https:' : 'http:') +
  '//www.googletagservices.com/tag/js/gpt.js';
  var node = document.getElementsByTagName('script')[0];
  node.parentNode.insertBefore(gads, node);
  })();
  </script>

  <script type='text/javascript'>
  googletag.cmd.push(function() {
  googletag.defineSlot('/123456789/ad', [200, 200], 'div-gpt-ad-123456789-0').addService(googletag.pubads());
  googletag.pubads().enableSingleRequest();
  googletag.enableServices();
  });
  </script>
  ```

```html
  <!-- Ad -->
  <div id='div-gpt-ad-123456789-0' style='width:200px; height:200px;'>
  <script type='text/javascript'>
  googletag.cmd.push(function() { googletag.display('div-gpt-ad-123456789-0'); });
  </script>
  </div>
  ```

### Solution

1. Add the following script tag to the head, **above** the application.js file:

    ```html
    <script type='text/javascript'>
      var googletag = googletag || {};
      googletag.cmd = googletag.cmd || [];
      (function() {
        var gads = document.createElement('script');
        gads.async = true;
        gads.type = 'text/javascript';
        var useSSL = 'https:' == document.location.protocol;
        gads.src = (useSSL ? 'https:' : 'http:') + '//www.googletagservices.com/tag/js/gpt.js';
        var node = document.getElementsByTagName('script')[0];
        node.parentNode.insertBefore(gads, node);
      })();
    </script>
    ```

2. Define this class somewhere in your application's JS:

    ```coffeescript
    class @Gpt
      constructor: ->
        @slots = {}
        window.googletag = googletag || {}
        window.googletag.cmd = googletag.cmd || []

        $(document).on 'page:fetch', => @clearAds()
        $(document).on 'page:load', => @evaluate()

        @evaluate()

      evaluate: ->
        for slot in $('.gpt-ad')
          $slot = $(slot)
          cachedSlot = @slots[$slot.data('gpt-div-id')]

          if cachedSlot? then @refreshSlot(cachedSlot) else @defineSlot($slot)

      defineSlot: ($slot) ->
        divId = $slot.data('gpt-div-id')
        path = $slot.data('gpt-path')
        dimensions = $slot.data('gpt-dimensions')

        googletag.cmd.push =>
          slot = googletag.defineSlot(path, dimensions, divId).addService(googletag.pubads())
          googletag.enableServices()
          googletag.display(divId)
          @slots[divId] = slot

      refreshSlot: (slot) ->
        googletag.cmd.push ->
          googletag.pubads().refresh([slot])

      clearAds: ->
        googletag.cmd.push ->
          googletag.pubads().clear()
    ```
3. Create an instance of the GooglePublisherTag class once:

    ```coffeescript
    $ ->
      @gpt ||= new Gpt()
    ```

4. For each ad, create an element with the class `gpt-ad` and the ad attributes as data attributes:

    ```html
    <div class="gpt-ad" data-gpt-div-id="div-gpt-ad-123456789-0" data-gpt-path="/12345678/ad" data-gpt-dimensions="[200, 200]"></div>
    ```
