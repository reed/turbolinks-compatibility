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
    class GooglePublisherTag
      constructor: ->
        $(document).on 'page:change', @clearAds
        $(document).on 'page:load', =>
          @evaluate()
          @refreshAds()

        @evaluate()

      evaluate: ->
        return unless googletag?
        @initAd($(ad)) for ad in $('.gpt-ad')

      initAd: ($ad) ->
        path = $ad.data('gpt-path')
        size = $ad.data('gpt-size')
        id = $ad.attr('id')

        googletag.cmd.push ->
          googletag.defineSlot(path, size, id).addService(googletag.pubads())
          googletag.enableServices()
          googletag.display(id)

      clearAds: ->
        googletag.pubads().clear() if googletag?.pubads?

      refreshAds: ->
        googletag.pubads().refresh() if googletag?.pubads?
    ```

3. Create an instance of the GooglePublisherTag class once:

    ```coffeescript
    $ ->
      @googlePublisherTag ||= new GooglePublisherTag()
    ```

4. For each ad, create an element with the class `gpt-ad`, the correct ad ID as the elements `id` and the appropriate data attributes:

    ```html
    <div class="gpt-ad" id="div-gpt-ad-123456789-0" data-gpt-path="/12345678/ad" data-gpt-size="[200, 200]"></div>
    ```
