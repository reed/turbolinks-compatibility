# Turbolinks Compatibility

> ### A collection of tutorials for how to get your favorite javascript libraries, plug-ins, and snippets working with [Turbolinks](https://github.com/rails/turbolinks).

Turbolinks can conflict with the behavior of your application's javascript, and it's up to you to fix it.  This is pretty easy to do with the code you've written, but when the problem lies within a third-party library or plug-in, identifying and resolving the conflict can become much more frustrating.  

Some common causes for these conflicts include:

* Initialization bound to the DOM Ready event
* Initialization code loading external scripts and appending elements to the document's `head`
* The use of global variables on the `window` object.

If you're needing a solution that isn't on this site, try looking through the solutions that *are* here to get an idea of how you might approach solving your conflict.  Many of these plugins and snippets use similar methods of initialization, so you might just find what you're looking for where you least expect it.  
 
## Requests

Are you having trouble with a library or plugin that's not on this site?  I'd be happy to work with you to find an acceptable solution that we can add to the site.  Just [submit an issue](http://github.com/reednj77/turbolinks-compatibility/issues) to this project on [Github](http://github.com).

Conversely, if you use a third-party library, plugin, or snippet that works flawlessly out of the box with Turbolinks, let me know and I'll add it to the site to aid future users' peace of mind.

## Contribute

Have you successfully manipulated a third-party javascript library or plugin to work with Turbolinks?  Tell us what you did! Do you think one of our existing solutions can be improved?  Improve it!

1. Fork the [turbolinks-compatibility](http://github.com/reednj77/turbolinks-compatibility) project on Github
2. Read the guidelines for contributing in the project's README
3. Make your changes
4. Submit a [pull request](http://help.github.com/articles/using-pull-requests)

