define(function(require){function e(t,e){return e.toUpperCase()}var p=require("./jq.mobi-custom"),n=document.documentElement,o={},i=o.toString,r=/^-ms-/,s=/-([\da-z])/gi;p.map=function(t,e,n){var o,i,r,s,c=0,f=t.length,u=[];if(r=(i=t).length,s=p.type(i),!p.isWindow(i)&&(!(1!==i.nodeType||!r)||"array"===s||"function"!==s&&(0===r||"number"==typeof r&&0<r&&r-1 in i)))for(;c<f;c++)null!=(o=e(t[c],c,n))&&(u[u.length]=o);else for(c in t)null!=(o=e(t[c],c,n))&&(u[u.length]=o);return[].concat.apply([],u)},p.isWindow=function(t){return null!=t&&t===t.window},p.type=function(t){return null==t?String(t):"object"==typeof t||"function"==typeof t?o[i.call(t)]||"object":typeof t},p.isUrl=function(t){return/^(https?|ftp):\/\//gi.test(t)},p.isEmptyObject=function(t){var e;for(e in t)return!1;return!0},p.extend(p.fn,{map:function(n){return this.pushStack(p.map(this,function(t,e){return n.call(t,e,t)}))},pushStack:function(t){var e=p.merge(this.constructor(),t);return e.prevObject=this,e.context=this.context,e},position:function(){if(this[0]){var t,e,n=this[0],o={top:0,left:0};return"fixed"===p.css(n,"position")?e=n.getBoundingClientRect():(t=p(this.offsetParent()),e=this.offset(),p.nodeName(t[0],"html")||(o=t.offset()),o.top+=p.css(t[0],"borderTopWidth",!0),o.left+=p.css(t[0],"borderLeftWidth",!0)),{top:e.top-o.top-p.css(n,"marginTop",!0),left:e.left-o.left-p.css(n,"marginLeft",!0)}}},offsetParent:function(){for(var t=this[0].offsetParent||n;t&&!p.nodeName(t,"html")&&"static"===p.css(t,"position");)t=t.offsetParent;return t||n},offset:function(e){if(arguments.length)return void 0===e?this:this.each(function(t){p.offset.setOffset(this,e,t)});var t,n,o,i=this[0],r={top:0,left:0},s=i&&i.ownerDocument;return s?(t=s.documentElement,p.contains(t,i)?(void 0!==i.getBoundingClientRect&&(r=i.getBoundingClientRect()),o=s,n=p.isWindow(o)?o:9===o.nodeType&&o.defaultView,{top:r.top+n.pageYOffset-t.clientTop,left:r.left+n.pageXOffset-t.clientLeft}):r):void 0}}),p.offset={setOffset:function(t,e,n){var o,i,r,s,c,f,u=p.css(t,"position"),a=p(t),l={};"static"===u&&(t.style.position="relative"),c=a.offset(),r=p.css(t,"top"),f=p.css(t,"left"),i=("absolute"===u||"fixed"===u)&&-1<(r+f).indexOf("auto")?(s=(o=a.position()).top,o.left):(s=parseFloat(r)||0,parseFloat(f)||0),p.isFunction(e)&&(e=e.call(t,n,c)),null!=e.top&&(l.top=e.top-c.top+s),null!=e.left&&(l.left=e.left-c.left+i),"using"in e?e.using.call(t,l):a.css(l)}},p.merge=function(t,e){var n=e.length,o=t.length,i=0;if("number"==typeof n)for(;i<n;i++)t[o++]=e[i];else for(;void 0!==e[i];)t[o++]=e[i++];return t.length=o,t},p.extend({cssHooks:{opacity:{get:function(t,e){if(e){var n=d(t,"opacity");return""===n?"1":n}}}},cssNumber:{columnCount:!0,fillOpacity:!0,fontWeight:!0,lineHeight:!0,opacity:!0,orphans:!0,widows:!0,zIndex:!0,zoom:!0},cssProps:{float:"cssFloat"},nodeName:function(t,e){return t.nodeName&&t.nodeName.toLowerCase()===e.toLowerCase()},style:function(t,e,n,o){if(t&&3!==t.nodeType&&8!==t.nodeType&&t.style){var i,r,s,c=p.camelCase(e),f=t.style;if(e=p.cssProps[c]||(p.cssProps[c]=l(f,c)),s=p.cssHooks[e]||p.cssHooks[c],void 0===n)return s&&"get"in s&&void 0!==(i=s.get(t,!1,o))?i:f[e];"string"===(r=typeof n)&&(i=rrelNum.exec(n))&&(n=(i[1]+1)*i[2]+parseFloat(p.css(t,e)),r="number"),null==n||"number"===r&&isNaN(n)||("number"!==r||p.cssNumber[c]||(n+="px"),p.support.clearCloneStyle||""!==n||0!==e.indexOf("background")||(f[e]="inherit"),s&&"set"in s&&void 0===(n=s.set(t,n,o))||(f[e]=n))}},css:function(t,e,n,o){var i,r,s,c=p.camelCase(e);return e=p.cssProps[c]||(p.cssProps[c]=l(t.style,c)),(s=p.cssHooks[e]||p.cssHooks[c])&&"get"in s&&(i=s.get(t,!0,n)),void 0===i&&(i=d(t,e,o)),"normal"===i&&e in f&&(i=f[e]),""===n||n?(r=parseFloat(i),!0===n||p.isNumeric(r)?r||0:i):i}});var c=["Webkit","O","Moz","ms"],t=/[+-]?(?:\$*\.|)\$+(?:[eE][+-]?\$+|)/.source,u=/^margin/,a=(new RegExp("^("+t+")(.*)$","i"),new RegExp("^("+t+")(?!px)[a-z%]+$","i")),f={letterSpacing:0,fontWeight:400};function l(t,e){if(e in t)return e;for(var n=e.charAt(0).toUpperCase()+e.slice(1),o=e,i=c.length;i--;)if((e=c[i]+n)in t)return e;return o}var d=function(t,e,n){var o,i,r,s=n||getComputedStyle(t,null),c=s?s.getPropertyValue(e)||s[e]:void 0,f=t.style;return s&&(""!==c||p.contains(t.ownerDocument,t)||(c=p.style(t,e)),a.test(c)&&u.test(e)&&(o=f.width,i=f.minWidth,r=f.maxWidth,f.minWidth=f.maxWidth=f.width=c,c=s.width,f.width=o,f.minWidth=i,f.maxWidth=r)),c};var h,m=/^[^{]+\{\s*\[native \w/.test(n.contains+"")||n.compareDocumentPosition?function(t,e){var n=9===t.nodeType?t.documentElement:t,o=e&&e.parentNode;return t===o||!(!o||1!==o.nodeType||!(n.contains?n.contains(o):t.compareDocumentPosition&&16&t.compareDocumentPosition(o)))}:function(t,e){if(e)for(;e=e.parentNode;)if(e===t)return!0;return!1};p.contains=function(t,e){return t.ownerDocument,document,m(t,e)},p.camelCase=function(t){return t.replace(r,"ms-").replace(s,e)},p.inArray=function(t,e,n){return null==e?-1:[].indexOf.call(e,t,n)},p.isNumeric=function(t){return!isNaN(parseFloat(t))&&isFinite(t)},p.type=function(t){return null==t?String(t):"object"==typeof t||"function"==typeof t?o[{}.toString.call(t)]||"object":typeof t},p.access=function(t,e,n,o,i,r,s){var c=0,f=t.length,u=null==n;if("object"===p.type(n))for(c in i=!0,n)p.access(t,e,c,n[c],!0,r,s);else if(void 0!==o&&(i=!0,p.isFunction(o)||(s=!0),u&&(e=s?(e.call(t,o),null):(u=e,function(t,e,n){return u.call(p(t),n)})),e))for(;c<f;c++)e(t[c],n,s?o:o.call(t[c],c,e(t[c],n)));return i?t:u?e.call(t):f?e(t[0],n):r},p.each({Height:"height",Width:"width"},function(r,s){p.each({padding:"inner"+r,content:s,"":"outer"+r},function(o,t){p.fn[t]=function(t,e){var n=arguments.length&&(o||"boolean"!=typeof t),i=o||(!0===t||!0===e?"margin":"border");return p.access(this,function(t,e,n){var o;return p.isWindow(t)?t.document.documentElement["client"+r]:9===t.nodeType?(o=t.documentElement,Math.max(t.body["scroll"+r],o["scroll"+r],t.body["offset"+r],o["offset"+r],o["client"+r])):void 0===n?p.css(t,e,i):p.style(t,e,n,i)},s,n?t:void 0,n,null)}})}),p.each("blur focus focusin focusout load resize scroll unload click dblclick mousedown mouseup mousemove mouseover mouseout mouseenter mouseleave change select submit keydown keypress keyup error contextmenu".split(" "),function(t,n){p.fn[n]=function(t,e){return 0<arguments.length?this.on(n,t,e):this.trigger(n)}}),p.fn.hover=function(t,e){return this.mouseenter(t).mouseleave(e||t)},p.setStorage=function(t,e){window.localStorage&&("string"==typeof e?window.localStorage.setItem(t,e):p.isObject(e)&&window.localStorage.setItem(t,JSON.stringify(e)))},p.getStorage=function(t){if(window.localStorage)return window.localStorage.getItem(t)};var g=["webkitTransitionEnd","transitionend","transitionEnd"];function y(n,t){var o=n[t];if(!o)throw t+" not exists.";!function t(){var e=o.shift();e&&e.call(n,t)}()}return p.fn.onTransitionEnd=function(e,n){var o=this;function i(t){h=h||t.type,g.forEach(function(t){!n&&h===t||o.off(t,i)}),e.apply(this,arguments)}h?n?o.one(h,e):o.on(h,e):g.forEach(function(t){o.on(t,i)})},p.fn.oneTransitionEnd=function(t){this.onTransitionEnd(t,!0)},p.fn.css3TransformListener=function(r,s){this.each(function(t,n){var e=Date.now(),o=getComputedStyle(n).webkitTransitionDuration,i=e;"ms"!==o.slice(-2)&&(i=e+1e3*parseFloat(o)),p(n).one(r,function(t){var e=Date.now();e<i?setTimeout(s.bind(n,t),i-e):s.call(n,t)})})},p.fn.repaint=function(){return this.each(function(t,e){e.offsetWidth}),this},p.fn.queue=function(){var o,n,i;if([].forEach.call(arguments,function(t){"string"==typeof t?o=t:t instanceof Array?n=t:"function"==typeof t&&(i=t)}),o="fakequeue-"+(o||"fx"),n)this.each(function(t,e){e[o]&&(e[o].length=0),e[o]=n,y(e,o)});else{if(!i)return this[0][o]=this[0][o]||[];this.each(function(t,e){var n;e[o]||(e[o]=[]),0===e[o].length&&(n=!0),e[o].push(i),n&&y(e,o)})}return this},p.forEach=Function.prototype.call.bind(Array.prototype.forEach),p.fx={},p.fx.speeds={slow:600,fast:200,_default:400},p});