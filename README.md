# Turbolinks Compatibility
[reednj77.github.com/turbolinks-compatibility](http://reednj77.github.com/turbolinks-compatibility)

***

A collection of tutorials for how to get your favorite javascript libraries, plugins, and snippets working with [Turbolinks](https://github.com/rails/turbolinks).

All submissions are encouraged.  To submit a change, fork this repo, commit your changes and send me a pull request.  

## Setup

The site is built with [nanoc](http://nanoc.ws).  Use bundler to install it along with the other necessary gems:

```
$ bundle install
```

You can see the available commands with nanoc:

```
$ nanoc -h
```

Check out the [nanoc documentation](http://nanoc.ws/docs) to get started.  

Ruby 1.9 is required to build the site.

## Development

Nanoc compiles the site into static files living in `./output`.  

```
$ nanoc compile
Loading site data... done
Compiling site...
	create  [0.25s]  output/index.html
	create  [2.07s]  output/facebook.html
	create  [0.01s]  output/fancybox.html
	create  [0.01s]  output/google_analytics.html
	create  [0.03s]  output/map_generator.html
	create  [0.02s]  output/olark.html
	create  [0.01s]  output/stripe.html
	create  [0.02s]  output/twitter.html
	create  [0.00s]  output/css/bootstrap_custom.css
	create  [0.00s]  output/css/github.css
	create  [0.00s]  output/css/style.css
	create  [0.00s]  output/images/bg.gif

Site compiled in 2.47s.
```

To view the site, launch Webrick via nanoc:

```
$ nanoc view
```

If you get tired of manually compiling, use `autocompile`, which will launch the webserver and compile (or recompile) each file when you request it.

```
$ nanoc autocompile
```

## Style Guide

The [libraries](content/libraries) folder contains a markdown file for each solution.  There are a couple structural requirements for these files:

#### Page Title

The top of each file should include a nanoc `title` attribute declaration.  

```
---
title: "Facebook"
---
```

This title will be used for the page's `<title>` element and the menu pane on the left side of the page.

#### Page Header

Begin the markup with a top-level header for the page header.  

```
# Facebook Social Plugins
```

This element will receive special styling, as you can clearly see on the site.  

All top-level headers in the markup will be wrapped inside a [hero unit](https://twitter.github.com/bootstrap/components.html#typography), so I recommend against using any after the page header. 

#### Markdown

Markdown files are rendered with [Redcarpet](https://github.com/vmg/redcarpet) and the [Github Flavored Markdown](https://github.github.com/github-flavored-markdown) filter.  Therefore, fenced code blocks with syntax highlighting are supported.

## Deployment

The site is hosted with [Github Pages](http://pages.github.com).  

After compiling the site, the contents of the `./output` directory will be pushed to this repo's `gh-pages` branch.

## Contributing

Having trouble getting a third-party javascript library to work with Turbolinks?  Create an issue, and we'll see if we can come up with a solution together.  

If you have a solution you would like added to the site, or know of a better way to implement an existing solution, submit a pull request for it.  Please submit them to the **master branch**, not the gh-pages branch.  After merging, I'll compile and deploy the site to gh-pages.

  