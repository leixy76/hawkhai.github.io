define(function(){"use strict";var c={version:"1.0.1",templateSettings:{evaluate:/\{\{([\s\S]+?(\}?)+)\}\}/g,interpolate:/\{\{=([\s\S]+?)\}\}/g,encode:/\{\{!([\s\S]+?)\}\}/g,use:/\{\{#([\s\S]+?)\}\}/g,useParams:/(^|[^\w$])def(?:\.|\[[\'\"])([\w$\.]+)(?:[\'\"]\])?\s*\:\s*([\w$\.]+|\"[^\"]+\"|\'[^\']+\'|\{[^\}]+\})/g,define:/\{\{##\s*([\w\.$]+)\s*(\:|=)([\s\S]+?)#\}\}/g,defineParams:/^\s*([\w$]+):([\s\S]+)/,conditional:/\{\{\?(\?)?\s*([\s\S]*?)\s*\}\}/g,iterate:/\{\{~\s*(?:\}\}|([\s\S]+?)\s*\:\s*([\w$]+)\s*(?:\:\s*([\w$]+))?\s*\}\})/g,varname:"it",strip:!0,append:!0,selfcontained:!1},template:void 0,compile:void 0};function s(){var t={"&":"&#38;","<":"&#60;",">":"&#62;",'"':"&#34;","'":"&#39;","/":"&#47;"},e=/&(?!#?\w+;)|<|>|"|'|\//g;return function(){return this?this.replace(e,function(e){return t[e]||e}):this}}String.prototype.encodeHTML=s();var p={append:{start:"'+(",end:")+'",endencode:"||'').toString().encodeHTML()+'"},split:{start:"';out+=(",end:");out+='",endencode:"||'').toString().encodeHTML();out+='"}},l=/$^/;function d(e){return e.replace(/\\('|\\)/g,"$1").replace(/[\r\t\n]/g," ")}return c.template=function(e,t,n){var r,a,i=(t=t||c.templateSettings).append?p.append:p.split,o=0,u=t.use||t.define?function r(a,e,i){return("string"==typeof e?e:e.toString()).replace(a.define||l,function(e,r,t,n){return 0===r.indexOf("def.")&&(r=r.substring(4)),r in i||(":"===t?(a.defineParams&&n.replace(a.defineParams,function(e,t,n){i[r]={arg:t,text:n}}),r in i||(i[r]=n)):new Function("def","def['"+r+"']="+n)(i)),""}).replace(a.use||l,function(e,t){a.useParams&&(t=t.replace(a.useParams,function(e,t,n,r){if(i[n]&&i[n].arg&&r){var a=(n+":"+r).replace(/'|\\/g,"_");return i.__exp=i.__exp||{},i.__exp[a]=i[n].text.replace(new RegExp("(^|[^\\w$])"+i[n].arg+"([^\\w$])","g"),"$1"+r+"$2"),t+"def.__exp['"+a+"']"}}));var n=new Function("def","return "+t)(i);return n?r(a,n,i):n})}(t,e,n||{}):e,u=("var out='"+(t.strip?u.replace(/(^|\r|\n)\t* +| +\t*(\r|\n|$)/g," ").replace(/\r|\n|\t|\/\*[\s\S]*?\*\//g,""):u).replace(/'|\\/g,"\\$&").replace(t.interpolate||l,function(e,t){return i.start+d(t)+i.end}).replace(t.encode||l,function(e,t){return r=!0,i.start+d(t)+i.endencode}).replace(t.conditional||l,function(e,t,n){return t?n?"';}else if("+d(n)+"){out+='":"';}else{out+='":n?"';if("+d(n)+"){out+='":"';}out+='"}).replace(t.iterate||l,function(e,t,n,r){return t?(o+=1,a=r||"i"+o,t=d(t),"';var arr"+o+"="+t+";if(arr"+o+"){var "+n+","+a+"=-1,l"+o+"=arr"+o+".length-1;while("+a+"<l"+o+"){"+n+"=arr"+o+"["+a+"+=1];out+='"):"';} } out+='"}).replace(t.evaluate||l,function(e,t){return"';"+d(t)+"out+='"})+"';return out;").replace(/\n/g,"\\n").replace(/\t/g,"\\t").replace(/\r/g,"\\r").replace(/(\s|;|\}|^|\{)out\+='';/g,"$1").replace(/\+''/g,"").replace(/(\s|;|\}|^|\{)out\+=''\+/g,"$1out+=");return r&&t.selfcontained&&(u="String.prototype.encodeHTML=("+s.toString()+"());"+u),new Function(t.varname,u)},c.compile=function(e,t){return c.template(e,null,t)},c});
