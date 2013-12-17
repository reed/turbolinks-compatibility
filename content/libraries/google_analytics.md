---
title: Google Analytics
contributors:
  - user:     jonwolfe
    name:     Jonathon Wolfe
issues:
  - repo:     rails/turbolinks
    number:   166
---

# Google Analytics

> **[google.com/analytics](http://www.google.com/analytics/)**

Many of the [solutions](https://github.com/shukydvir/google-analytics-turbolinks) [out](http://railsapps.github.io/rails-google-analytics.html) [there](http://stackoverflow.com/questions/18945464/rails-4-turbolinks-with-google-analytics) either only work with Turbolinks and don't gracefully degrade, or track multiple page views on the initial page load. To get around this, you need to take the following approach:

1. Move the Google Analytics script from the `<body>` to the `<head>`. Modify it to not actually track the pageview -- you just want to initialize Google Analytics.
2. If the browser supports Turbolinks, and Turbolinks is initialized, set up a callback to track pageviews on every page:change event. (With Turbolinks > 2.0.0, page:change is called on full page loads, as well as Turbolinks-driven page updates.)
3. If the browser doesn't support Turbolinks, or Turbolinks is not initialized, track the pageview.

Here's a coffeescript snippet that implements the approach above. It has a couple extra features which may be useful:

* Supports not tracking local requests -- modify the isLocalRequest() method to suit your needs.
* Supports multiple Google Analytics IDs -- test GoogleAnalytics.documentDomainIncludes('your-domain-name') in the analyticsID() function.
* If you need to manually track pageviews in your other Coffee/JS, just call GoogleAnalytics.trackPageview()

```coffeescript
class @GoogleAnalytics

  @load: ->
    # Google Analytics depends on a global _gaq array. window is the global scope.
    window._gaq = []
    window._gaq.push ["_setAccount", GoogleAnalytics.analyticsId()]

    # Create a script element and insert it in the DOM
    ga = document.createElement("script")
    ga.type = "text/javascript"
    ga.async = true
    ga.src = ((if "https:" is document.location.protocol then "https://ssl" else "http://www")) + ".google-analytics.com/ga.js"
    firstScript = document.getElementsByTagName("script")[0]
    firstScript.parentNode.insertBefore ga, firstScript

    # If Turbolinks is supported, set up a callback to track pageviews on page:change.
    # If it isn't supported, just track the pageview now.
    if typeof Turbolinks isnt 'undefined' and Turbolinks.supported
      document.addEventListener "page:change", (->
        GoogleAnalytics.trackPageview()
      ), true
    else
      GoogleAnalytics.trackPageview()

  @trackPageview: (url) ->
    unless GoogleAnalytics.isLocalRequest()
      if url
        window._gaq.push ["_trackPageview", url]
      else
        window._gaq.push ["_trackPageview"]
      window._gaq.push ["_trackPageLoadTime"]

  @isLocalRequest: ->
    GoogleAnalytics.documentDomainIncludes "local"

  @documentDomainIncludes: (str) ->
    document.domain.indexOf(str) isnt -1

  @analyticsId: ->
    # your google analytics ID(s) here...

GoogleAnalytics.load()
```
