define(function(){var t=document.getElementById("swfPlayer").contentWindow;return{play:function(e){t.postMessage({type:"play",url:e},"*")},pause:function(){t.postMessage({type:"stop"},"*")}}});
