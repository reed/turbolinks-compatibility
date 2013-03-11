---
title: Facebook
contributors:
  - user:       pomartel
    name:       Pierre Olivier Martel
    
  - user:       reed
    name:       Nick Reed
    
  - user:       rickypai
issues:
  - repo:     rails/turbolinks
    number:   25
  - repo:     rails/turbolinks
    number:   62
---

# Facebook Social Plugins

> **[developers.facebook.com/docs/plugins](http://developers.facebook.com/docs/plugins)**

### Official Implementation 

```html
<body>
  <div id="fb-root"></div>
  <script>
    (function(d, s, id){
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) return;
      js = d.createElement(s); js.id = id;
      js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
      fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
  </script>
  
  <!-- Like button -->
  <div class="fb-like" data-send="true" data-layout="button_count" data-width="450" data-show-faces="true"></div>
</body>
```

### Solution

Remove the script from the body and load the following script inside the `<head>`.

```coffeescript
fb_root = null
fb_events_bound = false

$ ->
  loadFacebookSDK()
  bindFacebookEvents() unless fb_events_bound

bindFacebookEvents = ->
  $(document)
    .on('page:fetch', saveFacebookRoot)
    .on('page:change', restoreFacebookRoot)
    .on('page:load', ->
      FB?.XFBML.parse()
    )
  fb_events_bound = true

saveFacebookRoot = ->
  fb_root = $('#fb-root').detach()
  
restoreFacebookRoot = ->
  if $('#fb-root').length > 0
    $('#fb-root').replaceWith fb_root
  else
    $('body').append fb_root
  
loadFacebookSDK = ->
  window.fbAsyncInit = initializeFacebookSDK
  $.getScript("//connect.facebook.net/en_US/all.js#xfbml=1")

initializeFacebookSDK = ->
  FB.init
    appId     : 'YOUR_APP_ID'
    channelUrl: '//WWW.YOUR_DOMAIN.COM/channel.html'
    status    : true
    cookie    : true
    xfbml     : true
```

*This solution is implemented on this site.*
