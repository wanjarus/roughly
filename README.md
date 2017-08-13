# Roughly

jQuery plugin that continuously updates an estimated number since a specific date.

### Features

- Defaults, all settings are optional
- Can add prefix and postfix to number

### Compatibility

Tested to work with the latest versions of Firefox, Chrome, Safari, Opera, and IE for both desktop and mobile.

## Setup

### JavaScript

Include jQuery 1.7.1 or higher and the Roughly script.

```html
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="build/jquery.roughly.js"></script>
```

## Usage

Add the *roughly* class to an empty div or span with any of the following options setup. You can use *data-** attributes to customize.

### Default Settings

```javascript
startDate: 'January 1, 1970', // start date for counter
startCount: 0, // starting number for counter
waitSeconds: 1, // number of seconds to wait between updates
increaseBy: 1, // number to increase by with each update
decimals: 0, // number of decimals to display
prefix: '', // add a prefix to the number
postfix: '' // add a postfix to the number
```

### Examples

Easily setup custom global defaults.

```html
<script>
$.fn.roughly.defaults = {
  startDate: 'January 1, 2015',
  prefix: '$'
};
</script>
```

Setup using CSS class.

```html
<div class="roughly"
  data-start-date="January 1, 2015"
  data-start-count="100"
  data-wait-seconds="2"
  data-increase-by="5"></div>
```

Setup without using CSS class.

```html
<div id="example"></div>
<script>
$("#example").roughly({waitSeconds: 5})
</script>
```
