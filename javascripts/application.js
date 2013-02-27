(function() {
  var bindFacebookEvents, fb_events_bound, fb_root, initializeFacebookSDK, loadFacebookSDK, renderTweetButtons, restoreFacebookRoot, saveFacebookRoot;

  fb_root = null;

  fb_events_bound = false;

  $(function() {
    loadFacebookSDK();
    if (!fb_events_bound) {
      return bindFacebookEvents();
    }
  });

  bindFacebookEvents = function() {
    $(document).on('page:fetch', saveFacebookRoot).on('page:change', restoreFacebookRoot).on('page:load', function() {
      return typeof FB !== "undefined" && FB !== null ? FB.XFBML.parse() : void 0;
    });
    return fb_events_bound = true;
  };

  saveFacebookRoot = function() {
    return fb_root = $('#fb-root').detach();
  };

  restoreFacebookRoot = function() {
    if ($('#fb-root').length > 0) {
      return $('#fb-root').replaceWith(fb_root);
    } else {
      return $('body').append(fb_root);
    }
  };

  loadFacebookSDK = function() {
    window.fbAsyncInit = initializeFacebookSDK;
    return $.getScript("//connect.facebook.net/en_US/all.js#xfbml=1");
  };

  initializeFacebookSDK = function() {
    return FB.init({
      status: true,
      cookie: true,
      xfbml: true
    });
  };

  $(function() {
    return $(document).on('page:load', renderTweetButtons);
  });

  renderTweetButtons = function() {
    $('.twitter-share-button').each(function() {
      var button;
      button = $(this);
      if (button.data('url') == null) {
        button.attr('data-url', document.location.href);
      }
      if (button.data('text') == null) {
        return button.attr('data-text', document.title);
      }
    });
    return twttr.widgets.load();
  };

}).call(this);
