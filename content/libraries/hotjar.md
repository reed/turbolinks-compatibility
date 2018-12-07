---
title: Hotjar Tracking Code
contributors:
  - user:     olepalm
    name:     Ole Palm
---

# Hotjar

> **[hotjar.com](https://www.hotjar.com)**

### Official Implementation
After creating an account you will be able to access an embed code similar to this on their admin tracking code section:

```html
<!-- BEGIN HOTJAR TRACKING CODE -->
<script>
  (function(h,o,t,j,a,r){
      h.hj=h.hj||function(){(h.hj.q=h.hj.q||[]).push(arguments)};
      h._hjSettings={hjid:HOTJAR_ID,hjsv:HOTJAR_SV};
      a=o.getElementsByTagName('head')[0];
      r=o.createElement('script');r.async=1;
      r.src=t+h._hjSettings.hjid+j+h._hjSettings.hjsv;
      a.appendChild(r);
    })(window,document,'https://static.hotjar.com/c/hotjar-','.js?sv=');
  });
</script>
<!-- END HOTJAR TRACKING CODE -->
```

### Solution
Add a listener after the official solution, tracking changes to the request referrer on `turbolinks:load`.
Dont forget to insert the actual values to the `HOTJAR_ID` and `HOTJAR_SV` placeholders.

```html
<!-- BEGIN HOTJAR TRACKING CODE -->
<script>
  (function(h,o,t,j,a,r){
      h.hj=h.hj||function(){(h.hj.q=h.hj.q||[]).push(arguments)};
      h._hjSettings={hjid:INSERT_HOTJAR_ID,hjsv:INSERT_HOTJAR_SV};
      a=o.getElementsByTagName('head')[0];
      r=o.createElement('script');r.async=1;
      r.src=t+h._hjSettings.hjid+j+h._hjSettings.hjsv;
      a.appendChild(r);
    })(window,document,'https://static.hotjar.com/c/hotjar-','.js?sv=');
  });
  document.addEventListener("turbolinks:load", function(event) {
    hj('stateChange', document.referrer);
  });
</script>
<!-- END HOTJAR TRACKING CODE -->
```
