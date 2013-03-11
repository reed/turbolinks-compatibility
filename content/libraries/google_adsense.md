---
title: Google AdSense
contributors:
  - user:     reed
    name:     Nick Reed
issues:
  - repo:     rails/turbolinks
    number:   151
---

# Google AdSense

> **[support.google.com/adsense](https://support.google.com/adsense/bin/answer.py?hl=en&answer=181947&topic=29033&parent=28893&rd=1)**

### Official Implementation

```html
<script type="text/javascript">
google_ad_client = "ca-pub-1234567890123456";
google_ad_slot = "1234567890";
google_ad_width = 300;
google_ad_height = 250;
</script>
<script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js"></script>
```

### Solution

1. Add the following script tag to the head, **above** the application.js file:

    ```html
    <script src="//www.google.com/jsapi"></script>
    ```

2. Define these classes somewhere in your application's JS:

    ```coffeescript
    class AdSense
      constructor: (@ad_client) ->
        if google?
          google.load 'ads', '1'
          google.setOnLoadCallback @initPage
          @ads = {}
          $(document).on 'page:fetch', =>
            @clearAds()
          $(document).on 'page:load', =>
            @initPage()
  
      initPage: =>
        ad.load() for id, ad of @ads
    
      clearAds: ->
        @ads = {}
  
      newAd: (container, options) ->
        id = (options.format || 'ad') + '_' + container.id
        @ads[id] = new Ad @, id, container, options
    ```
    ```coffeescript
    class Ad
      constructor: (@adsense, @id, @container, @options) ->
  
      load: ->
        if @ad_object? then @refresh() else @create()
    
      refresh: ->
        @ad_object.refresh()
  
      create: ->
        @ad_object = new google.ads.Ad @adsense.ad_client, @container, @options
    ```

3. Add this line to your application's JS  (after the classes have been defined) to initialize AdSense

    ```coffeescript
    window.MyAdSense = new AdSense "ca-pub-1234567890123456" # your google_ad_client id
    ```

4. Create a container with an ID for each ad on the page

    ```html
    <body>
      <!-- content -->
      <div id="my_ad"></div>
    </body>
    ```

5. Add a script tag to the **body** of the page that will initialize the ad:

    ```html
    <script>
    window.MyAdSense.newAd(document.getElementById('my_ad'), {
      'ad_slot': "1234567890",
      'ad_width': 300,
      'ad_height': 250
    });
    </script>
    ```


*Inspiration:* [www.redkart.com/google_adsense.html](http://www.redkart.com/google_adsense.html)
