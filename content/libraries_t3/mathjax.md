---
title: MathJax
contributors:
  - user:     reed
    name:     Nick Reed
issues:
  - repo:     reed/turbolinks-compatibility
    number:   16
---

# MathJax

> **[mathjax.org](http://mathjax.org)**

### Official Implementation

```html
<script src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>
<script type="text/x-mathjax-config">
  MathJax.Hub.Config({
    showMathMenu: false
  });
</script>
```

### Simple Solution

Remove the script tags from the `head` and add the following coffeescript to your application:

```coffeescript
$ ->
  loadMathJax()
  $(document).on 'page:load', loadMathJax

loadMathJax = ->
  window.MathJax = null
  $.getScript "http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML", ->
    MathJax.Hub.Config
      showMathMenu: false
```

### Advanced Solution *(with AJAX caching)*

1. Remove the script tags from the `head`.

2. Define this classes somewhere in your application's JS:

    ```coffeescript
    class MathJax
      constructor: (@options) ->
        @bind()

      load: =>
        window.MathJax = null
        @_fetch().done =>
          window.MathJax.Hub.Config @options

      bind: ->
        $ => @load()
        $(document).on 'page:load', @load

      unbind: ->
        $(document).off 'page:load', @load

      # private

      _fetch: ->
        $.ajax
          dataType: 'script'
          cache: true
          url: "http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"
    ```

3. Add this line to your application's JS (after the class has been defined) to initialize MathJax

    ```coffeescript
    new MathJax
      showMathMenu: false
    ```
