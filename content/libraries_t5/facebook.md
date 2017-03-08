---
title: Facebook
---

# Facebook

## Page widget

### Official Implementation

```html
<!-- Include the SDK JavaScript on your page once, ideally right after the opening <body> tag. -->

<script type="text/javascript">
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/fr_FR/sdk.js#xfbml=1&version=v2.8&appId=247971618578324";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<!-- Include this where you want to display the widget -->
<div class="fb-page" data-href="[PAGE_URL]" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true">
  <blockquote cite="[PAGE_URL]" class="fb-xfbml-parse-ignore">
    <a href="[PAGE_URL]">Page name</a>
  </blockquote>
</div>
```

### Solution

```coffeescript
bindFacebookEvents = ->
  $(document)
    .on('turbolinks:request-start', saveFacebookRoot)
    .on('turbolinks:render', restoreFacebookRoot)
    .on('turbolinks:load', ->
      FB?.XFBML.parse()
    )
  window.fbEventsBound = true

saveFacebookRoot = ->
  if $('#fb-root').length
    @fbRoot = $('#fb-root').detach()

restoreFacebookRoot = ->
  if @fbRoot?
    if $('#fb-root').length
      $('#fb-root').replaceWith @fbRoot
    else
      $('body').append @fbRoot

loadFacebookSDK = ->
  window.fbAsyncInit = initializeFacebookSDK
  $.getScript("//connect.facebook.net/en_US/sdk.js")

initializeFacebookSDK = ->
  FB.init
    appId  : '[APP_ID]'
    version: 'v2.7'
    status : true
    cookie : true
    xfbml  : true

loadFacebookSDK()
bindFacebookEvents() unless window.fbEventsBound
```

Then you still need to include the markup `fb-page`
