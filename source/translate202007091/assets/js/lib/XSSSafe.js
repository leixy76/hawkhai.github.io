define(function(){var r={"&":"&#38;","<":"&#60;",">":"&#62;",'"':"&#34;","'":"&#39;","/":"&#47;"},e=/&|<|>|"|'|\//g;return function(n){if(n.replace)return n.replace(e,function(n){return r[n]||n});throw"Not a string"}});
