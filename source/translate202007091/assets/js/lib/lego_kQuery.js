kQuery=function(i,o){var l=!!o.createElement("div").addEventListener,n=o,r=n.body,f=function(n){var e,d,w,N,o,i,g,C,c,l,m,x,u,v,y,f,h,E,T="sizzle"+-new Date,L=n.document,S=0,r=0,s=oe(),p=oe(),A=oe(),D=function(e,t){return e===t&&(l=!0),0},B="undefined",I={}.hasOwnProperty,t=[],P=t.pop,R=t.push,k=t.push,H=t.slice,M=t.indexOf||function(e){for(var t=0,n=this.length;t<n;t++)if(this[t]===e)return t;return-1},$="checked|selected|async|autofocus|autoplay|controls|defer|disabled|hidden|ismap|loop|multiple|open|readonly|required|scoped",O="[\\x20\\t\\r\\n\\f]",q="(?:\\\\.|[\\w-]|[^\\x00-\\xa0])+",j=q.replace("w","w#"),X="\\["+O+"*("+q+")"+O+"*(?:([*^$|!~]?=)"+O+"*(?:(['\"])((?:\\\\.|[^\\\\])*?)\\3|("+j+")|)|)"+O+"*\\]",F=":("+q+")(?:\\(((['\"])((?:\\\\.|[^\\\\])*?)\\3|((?:\\\\.|[^\\\\()[\\]]|"+X.replace(3,8)+")*)|.*)\\)|)",Y=new RegExp("^"+O+"+|((?:^|[^\\\\])(?:\\\\.)*)"+O+"+$","g"),U=new RegExp("^"+O+"*,"+O+"*"),z=new RegExp("^"+O+"*([>+~]|"+O+")"+O+"*"),G=new RegExp("="+O+"*([^\\]'\"]*?)"+O+"*\\]","g"),V=new RegExp(F),_=new RegExp("^"+j+"$"),Q={ID:new RegExp("^#("+q+")"),CLASS:new RegExp("^\\.("+q+")"),TAG:new RegExp("^("+q.replace("w","w*")+")"),ATTR:new RegExp("^"+X),PSEUDO:new RegExp("^"+F),CHILD:new RegExp("^:(only|first|last|nth|nth-last)-(child|of-type)(?:\\("+O+"*(even|odd|(([+-]|)(\\d*)n|)"+O+"*(?:([+-]|)"+O+"*(\\d+)|))"+O+"*\\)|)","i"),bool:new RegExp("^(?:"+$+")$","i"),needsContext:new RegExp("^"+O+"*[>+~]|:(even|odd|eq|gt|lt|nth|first|last)(?:\\("+O+"*((?:-\\d)?\\d*)"+O+"*\\)|)(?=[^-]|$)","i")},J=/^(?:input|select|textarea|button)$/i,K=/^h\d$/i,W=/^[^{]+\{\s*\[native \w/,Z=/^(?:#([\w-]+)|(\w+)|\.([\w-]+))$/,ee=/[+~]/,te=/'|\\/g,ne=new RegExp("\\\\([\\da-f]{1,6}"+O+"?|("+O+")|.)","ig"),re=function(e,t,n){var r="0x"+t-65536;return r!=r||n?t:r<0?String.fromCharCode(65536+r):String.fromCharCode(r>>10|55296,1023&r|56320)};try{k.apply(t=H.call(L.childNodes),L.childNodes),t[L.childNodes.length].nodeType}catch(e){k={apply:t.length?function(e,t){R.apply(e,H.call(t))}:function(e,t){for(var n=e.length,r=0;e[n++]=t[r++];);e.length=n-1}}}function ie(e,t,n,r){var i,o,u,a,s,c,l,f,h,p;if((t?t.ownerDocument||t:L)!==x&&m(t),n=n||[],!e||"string"!=typeof e)return n;if(1!==(a=(t=t||x).nodeType)&&9!==a)return[];if(v&&!r){if(i=Z.exec(e))if(u=i[1]){if(9===a){if(!(o=t.getElementById(u))||!o.parentNode)return n;if(o.id===u)return n.push(o),n}else if(t.ownerDocument&&(o=t.ownerDocument.getElementById(u))&&E(t,o)&&o.id===u)return n.push(o),n}else{if(i[2])return k.apply(n,t.getElementsByTagName(e)),n;if((u=i[3])&&d.getElementsByClassName&&t.getElementsByClassName)return k.apply(n,t.getElementsByClassName(u)),n}if(d.qsa&&(!y||!y.test(e))){if(f=l=T,h=t,p=9===a&&e,1===a&&"object"!==t.nodeName.toLowerCase()){for(c=pe(e),(l=t.getAttribute("id"))?f=l.replace(te,"\\$&"):t.setAttribute("id",f),f="[id='"+f+"'] ",s=c.length;s--;)c[s]=f+de(c[s]);h=ee.test(e)&&fe(t.parentNode)||t,p=c.join(",")}if(p)try{return k.apply(n,h.querySelectorAll(p)),n}catch(e){}finally{l||t.removeAttribute("id")}}}return function(e,t,n,r){var i,o,u,a,s,c=pe(e);if(!r&&1===c.length){if(2<(o=c[0]=c[0].slice(0)).length&&"ID"===(u=o[0]).type&&d.getById&&9===t.nodeType&&v&&N.relative[o[1].type]){if(!(t=(N.find.ID(u.matches[0].replace(ne,re),t)||[])[0]))return n;e=e.slice(o.shift().value.length)}for(i=Q.needsContext.test(e)?0:o.length;i--&&(u=o[i],!N.relative[a=u.type]);)if((s=N.find[a])&&(r=s(u.matches[0].replace(ne,re),ee.test(o[0].type)&&fe(t.parentNode)||t))){if(o.splice(i,1),!(e=r.length&&de(o)))return k.apply(n,r),n;break}}return g(e,c)(r,t,!v,n,ee.test(e)&&fe(t.parentNode)||t),n}(e.replace(Y,"$1"),t,n,r)}function oe(){var n=[];function r(e,t){return n.push(e+" ")>N.cacheLength&&delete r[n.shift()],r[e+" "]=t}return r}function ue(e){return e[T]=!0,e}function ae(e){var t=x.createElement("div");try{return!!e(t)}catch(e){return!1}finally{t.parentNode&&t.parentNode.removeChild(t),t=null}}function se(e,t){for(var n=e.split("|"),r=e.length;r--;)N.attrHandle[n[r]]=t}function ce(e,t){var n=t&&e,r=n&&1===e.nodeType&&1===t.nodeType&&(~t.sourceIndex||1<<31)-(~e.sourceIndex||1<<31);if(r)return r;if(n)for(;n=n.nextSibling;)if(n===t)return-1;return e?1:-1}function le(u){return ue(function(o){return o=+o,ue(function(e,t){for(var n,r=u([],e.length,o),i=r.length;i--;)e[n=r[i]]&&(e[n]=!(t[n]=e[n]))})})}function fe(e){return e&&typeof e.getElementsByTagName!==B&&e}for(e in d=ie.support={},i=ie.isXML=function(e){var t=e&&(e.ownerDocument||e).documentElement;return!!t&&"HTML"!==t.nodeName},m=ie.setDocument=function(e){var t,n,s=e?e.ownerDocument||e:L,r=s.defaultView;if(s===x||9!==s.nodeType||!s.documentElement)return x;u=(x=s).documentElement,v=!i(s),r&&r!==r.top&&(r.addEventListener?r.addEventListener("unload",function(){m()},!1):r.attachEvent&&r.attachEvent("onunload",function(){m()})),d.attributes=ae(function(e){return e.className="i",!e.getAttribute("className")}),d.getElementsByTagName=ae(function(e){return e.appendChild(s.createComment("")),!e.getElementsByTagName("*").length}),d.getElementsByClassName=W.test(s.getElementsByClassName)&&ae(function(e){return e.innerHTML="<div class='a'></div><div class='a i'></div>",e.firstChild.className="i",2===e.getElementsByClassName("i").length}),d.getById=ae(function(e){return u.appendChild(e).id=T,!s.getElementsByName||!s.getElementsByName(T).length}),d.getById?(N.find.ID=function(e,t){if(typeof t.getElementById!==B&&v){var n=t.getElementById(e);return n&&n.parentNode?[n]:[]}},N.filter.ID=function(e){var t=e.replace(ne,re);return function(e){return e.getAttribute("id")===t}}):(delete N.find.ID,N.filter.ID=function(e){var n=e.replace(ne,re);return function(e){var t=typeof e.getAttributeNode!==B&&e.getAttributeNode("id");return t&&t.value===n}}),N.find.TAG=d.getElementsByTagName?function(e,t){if(typeof t.getElementsByTagName!==B)return t.getElementsByTagName(e)}:function(e,t){var n,r=[],i=0,o=t.getElementsByTagName(e);if("*"!==e)return o;for(;n=o[i++];)1===n.nodeType&&r.push(n);return r},N.find.CLASS=d.getElementsByClassName&&function(e,t){if(typeof t.getElementsByClassName!==B&&v)return t.getElementsByClassName(e)},f=[],y=[],(d.qsa=W.test(s.querySelectorAll))&&(ae(function(e){e.innerHTML="<select t=''><option selected=''></option></select>",e.querySelectorAll("[t^='']").length&&y.push("[*^$]="+O+"*(?:''|\"\")"),e.querySelectorAll("[selected]").length||y.push("\\["+O+"*(?:value|"+$+")"),e.querySelectorAll(":checked").length||y.push(":checked")}),ae(function(e){var t=s.createElement("input");t.setAttribute("type","hidden"),e.appendChild(t).setAttribute("name","D"),e.querySelectorAll("[name=d]").length&&y.push("name"+O+"*[*^$|!~]?="),e.querySelectorAll(":enabled").length||y.push(":enabled",":disabled"),e.querySelectorAll("*,:x"),y.push(",.*:")})),(d.matchesSelector=W.test(h=u.webkitMatchesSelector||u.mozMatchesSelector||u.oMatchesSelector||u.msMatchesSelector))&&ae(function(e){d.disconnectedMatch=h.call(e,"div"),h.call(e,"[s!='']:x"),f.push("!=",F)}),y=y.length&&new RegExp(y.join("|")),f=f.length&&new RegExp(f.join("|")),t=W.test(u.compareDocumentPosition);try{n=W.test(docElemContains)}catch(e){}return E=function(){return t?function(e,t){9===e.nodeType&&e.documentElement;var n=t&&t.parentNode;return e===n||!!(n&&1===n.nodeType&&e.compareDocumentPosition&&16&e.compareDocumentPosition(n))}:n?function(){var e=9===a.nodeType?a.documentElement:a,t=b&&b.parentNode;return a===t||!(!t||1!==t.nodeType||!e.contains(t))}:function(e,t){if(t)for(;t=t.parentNode;)if(t===e)return!0;return!1}},D=t?function(e,t){if(e===t)return l=!0,0;var n=!e.compareDocumentPosition-!t.compareDocumentPosition;return n||(1&(n=(e.ownerDocument||e)===(t.ownerDocument||t)?e.compareDocumentPosition(t):1)||!d.sortDetached&&t.compareDocumentPosition(e)===n?e===s||e.ownerDocument===L&&E(L,e)?-1:t===s||t.ownerDocument===L&&E(L,t)?1:c?M.call(c,e)-M.call(c,t):0:4&n?-1:1)}:function(e,t){if(e===t)return l=!0,0;var n,r=0,i=e.parentNode,o=t.parentNode,u=[e],a=[t];if(!i||!o)return e===s?-1:t===s?1:i?-1:o?1:c?M.call(c,e)-M.call(c,t):0;if(i===o)return ce(e,t);for(n=e;n=n.parentNode;)u.unshift(n);for(n=t;n=n.parentNode;)a.unshift(n);for(;u[r]===a[r];)r++;return r?ce(u[r],a[r]):u[r]===L?-1:a[r]===L?1:0},s},ie.matches=function(e,t){return ie(e,null,null,t)},ie.matchesSelector=function(e,t){if((e.ownerDocument||e)!==x&&m(e),t=t.replace(G,"='$1']"),d.matchesSelector&&v&&(!f||!f.test(t))&&(!y||!y.test(t)))try{var n=h.call(e,t);if(n||d.disconnectedMatch||e.document&&11!==e.document.nodeType)return n}catch(e){}return 0<ie(t,x,null,[e]).length},ie.contains=function(e,t){return(e.ownerDocument||e)!==x&&m(e),E(e,t)},ie.attr=function(e,t){(e.ownerDocument||e)!==x&&m(e);var n=N.attrHandle[t.toLowerCase()],r=n&&I.call(N.attrHandle,t.toLowerCase())?n(e,t,!v):void 0;return void 0!==r?r:d.attributes||!v?e.getAttribute(t):(r=e.getAttributeNode(t))&&r.specified?r.value:null},ie.error=function(e){throw new Error("Syntax error, unrecognized expression: "+e)},ie.uniqueSort=function(e){var t,n=[],r=0,i=0;if(l=!d.detectDuplicates,c=!d.sortStable&&e.slice(0),e.sort(D),l){for(;t=e[i++];)t===e[i]&&(r=n.push(i));for(;r--;)e.splice(n[r],1)}return c=null,e},o=ie.getText=function(e){var t,n="",r=0,i=e.nodeType;if(i){if(1===i||9===i||11===i){if("string"==typeof e.textContent)return e.textContent;for(e=e.firstChild;e;e=e.nextSibling)n+=o(e)}else if(3===i||4===i)return e.nodeValue}else for(;t=e[r++];)n+=o(t);return n},(N=ie.selectors={cacheLength:50,createPseudo:ue,match:Q,attrHandle:{},find:{},relative:{">":{dir:"parentNode",first:!0}," ":{dir:"parentNode"},"+":{dir:"previousSibling",first:!0},"~":{dir:"previousSibling"}},preFilter:{ATTR:function(e){return e[1]=e[1].replace(ne,re),e[3]=(e[4]||e[5]||"").replace(ne,re),"~="===e[2]&&(e[3]=" "+e[3]+" "),e.slice(0,4)},CHILD:function(e){return e[1]=e[1].toLowerCase(),"nth"===e[1].slice(0,3)?(e[3]||ie.error(e[0]),e[4]=+(e[4]?e[5]+(e[6]||1):2*("even"===e[3]||"odd"===e[3])),e[5]=+(e[7]+e[8]||"odd"===e[3])):e[3]&&ie.error(e[0]),e},PSEUDO:function(e){var t,n=!e[5]&&e[2];return Q.CHILD.test(e[0])?null:(e[3]&&void 0!==e[4]?e[2]=e[4]:n&&V.test(n)&&(t=pe(n,!0))&&(t=n.indexOf(")",n.length-t)-n.length)&&(e[0]=e[0].slice(0,t),e[2]=n.slice(0,t)),e.slice(0,3))}},filter:{TAG:function(e){var t=e.replace(ne,re).toLowerCase();return"*"===e?function(){return!0}:function(e){return e.nodeName&&e.nodeName.toLowerCase()===t}},CLASS:function(e){var t=s[e+" "];return t||(t=new RegExp("(^|"+O+")"+e+"("+O+"|$)"))&&s(e,function(e){return t.test("string"==typeof e.className&&e.className||typeof e.getAttribute!==B&&e.getAttribute("class")||"")})},ATTR:function(n,r,i){return function(e){var t=ie.attr(e,n);return null==t?"!="===r:!r||(t+="","="===r?t===i:"!="===r?t!==i:"^="===r?i&&0===t.indexOf(i):"*="===r?i&&-1<t.indexOf(i):"$="===r?i&&t.slice(-i.length)===i:"~="===r?-1<(" "+t+" ").indexOf(i):"|="===r&&(t===i||t.slice(0,i.length+1)===i+"-"))}},CHILD:function(p,e,t,d,g){var m="nth"!==p.slice(0,3),v="last"!==p.slice(-4),y="of-type"===e;return 1===d&&0===g?function(e){return!!e.parentNode}:function(e,t,n){var r,i,o,u,a,s,c=m!=v?"nextSibling":"previousSibling",l=e.parentNode,f=y&&e.nodeName.toLowerCase(),h=!n&&!y;if(l){if(m){for(;c;){for(o=e;o=o[c];)if(y?o.nodeName.toLowerCase()===f:1===o.nodeType)return!1;s=c="only"===p&&!s&&"nextSibling"}return!0}if(s=[v?l.firstChild:l.lastChild],v&&h){for(a=(r=(i=l[T]||(l[T]={}))[p]||[])[0]===S&&r[1],u=r[0]===S&&r[2],o=a&&l.childNodes[a];o=++a&&o&&o[c]||(u=a=0)||s.pop();)if(1===o.nodeType&&++u&&o===e){i[p]=[S,a,u];break}}else if(h&&(r=(e[T]||(e[T]={}))[p])&&r[0]===S)u=r[1];else for(;(o=++a&&o&&o[c]||(u=a=0)||s.pop())&&((y?o.nodeName.toLowerCase()!==f:1!==o.nodeType)||!++u||(h&&((o[T]||(o[T]={}))[p]=[S,u]),o!==e)););return(u-=g)===d||u%d==0&&0<=u/d}}},PSEUDO:function(e,o){var t,u=N.pseudos[e]||N.setFilters[e.toLowerCase()]||ie.error("unsupported pseudo: "+e);return u[T]?u(o):1<u.length?(t=[e,e,"",o],N.setFilters.hasOwnProperty(e.toLowerCase())?ue(function(e,t){for(var n,r=u(e,o),i=r.length;i--;)e[n=M.call(e,r[i])]=!(t[n]=r[i])}):function(e){return u(e,0,t)}):u}},pseudos:{not:ue(function(e){var r=[],i=[],a=g(e.replace(Y,"$1"));return a[T]?ue(function(e,t,n,r){for(var i,o=a(e,null,r,[]),u=e.length;u--;)(i=o[u])&&(e[u]=!(t[u]=i))}):function(e,t,n){return r[0]=e,a(r,null,n,i),!i.pop()}}),has:ue(function(t){return function(e){return 0<ie(t,e).length}}),contains:ue(function(t){return function(e){return-1<(e.textContent||e.innerText||o(e)).indexOf(t)}}),lang:ue(function(n){return _.test(n||"")||ie.error("unsupported lang: "+n),n=n.replace(ne,re).toLowerCase(),function(e){var t;do{if(t=v?e.lang:e.getAttribute("xml:lang")||e.getAttribute("lang"))return(t=t.toLowerCase())===n||0===t.indexOf(n+"-")}while((e=e.parentNode)&&1===e.nodeType);return!1}}),target:function(e){var t=n.location&&n.location.hash;return t&&t.slice(1)===e.id},root:function(e){return e===u},focus:function(e){return e===x.activeElement&&(!x.hasFocus||x.hasFocus())&&!!(e.type||e.href||~e.tabIndex)},enabled:function(e){return!1===e.disabled},disabled:function(e){return!0===e.disabled},checked:function(e){var t=e.nodeName.toLowerCase();return"input"===t&&!!e.checked||"option"===t&&!!e.selected},selected:function(e){return e.parentNode&&e.parentNode.selectedIndex,!0===e.selected},empty:function(e){for(e=e.firstChild;e;e=e.nextSibling)if(e.nodeType<6)return!1;return!0},parent:function(e){return!N.pseudos.empty(e)},header:function(e){return K.test(e.nodeName)},input:function(e){return J.test(e.nodeName)},button:function(e){var t=e.nodeName.toLowerCase();return"input"===t&&"button"===e.type||"button"===t},text:function(e){var t;return"input"===e.nodeName.toLowerCase()&&"text"===e.type&&(null==(t=e.getAttribute("type"))||"text"===t.toLowerCase())},first:le(function(){return[0]}),last:le(function(e,t){return[t-1]}),eq:le(function(e,t,n){return[n<0?n+t:n]}),even:le(function(e,t){for(var n=0;n<t;n+=2)e.push(n);return e}),odd:le(function(e,t){for(var n=1;n<t;n+=2)e.push(n);return e}),lt:le(function(e,t,n){for(var r=n<0?n+t:n;0<=--r;)e.push(r);return e}),gt:le(function(e,t,n){for(var r=n<0?n+t:n;++r<t;)e.push(r);return e})}}).pseudos.nth=N.pseudos.eq,{radio:!0,checkbox:!0,file:!0,password:!0,image:!0})N.pseudos[e]=function(t){return function(e){return"input"===e.nodeName.toLowerCase()&&e.type===t}}(e);for(e in{submit:!0,reset:!0})N.pseudos[e]=function(n){return function(e){var t=e.nodeName.toLowerCase();return("input"===t||"button"===t)&&e.type===n}}(e);function he(){}function pe(e,t){var n,r,i,o,u,a,s,c=p[e+" "];if(c)return t?0:c.slice(0);for(u=e,a=[],s=N.preFilter;u;){for(o in n&&!(r=U.exec(u))||(r&&(u=u.slice(r[0].length)||u),a.push(i=[])),n=!1,(r=z.exec(u))&&(n=r.shift(),i.push({value:n,type:r[0].replace(Y," ")}),u=u.slice(n.length)),N.filter)!(r=Q[o].exec(u))||s[o]&&!(r=s[o](r))||(n=r.shift(),i.push({value:n,type:o,matches:r}),u=u.slice(n.length));if(!n)break}return t?u.length:u?ie.error(e):p(e,a).slice(0)}function de(e){for(var t=0,n=e.length,r="";t<n;t++)r+=e[t].value;return r}function ge(a,e,t){var s=e.dir,c=t&&"parentNode"===s,l=r++;return e.first?function(e,t,n){for(;e=e[s];)if(1===e.nodeType||c)return a(e,t,n)}:function(e,t,n){var r,i,o,u=S+" "+l;if(n){for(;e=e[s];)if((1===e.nodeType||c)&&a(e,t,n))return!0}else for(;e=e[s];)if(1===e.nodeType||c)if((i=(o=e[T]||(e[T]={}))[s])&&i[0]===u){if(!0===(r=i[1])||r===w)return!0===r}else if((i=o[s]=[u])[1]=a(e,t,n)||w,!0===i[1])return!0}}function me(i){return 1<i.length?function(e,t,n){for(var r=i.length;r--;)if(!i[r](e,t,n))return!1;return!0}:i[0]}function ve(e,t,n,r,i){for(var o,u=[],a=0,s=e.length,c=null!=t;a<s;a++)(o=e[a])&&(n&&!n(o,r,i)||(u.push(o),c&&t.push(a)));return u}function ye(p,d,g,m,v,e){return m&&!m[T]&&(m=ye(m)),v&&!v[T]&&(v=ye(v,e)),ue(function(e,t,n,r){var i,o,u,a=[],s=[],c=t.length,l=e||function(e,t,n){for(var r=0,i=t.length;r<i;r++)ie(e,t[r],n);return n}(d||"*",n.nodeType?[n]:n,[]),f=!p||!e&&d?l:ve(l,a,p,n,r),h=g?v||(e?p:c||m)?[]:t:f;if(g&&g(f,h,n,r),m)for(i=ve(h,s),m(i,[],n,r),o=i.length;o--;)(u=i[o])&&(h[s[o]]=!(f[s[o]]=u));if(e){if(v||p){if(v){for(i=[],o=h.length;o--;)(u=h[o])&&i.push(f[o]=u);v(null,h=[],i,r)}for(o=h.length;o--;)(u=h[o])&&-1<(i=v?M.call(e,u):a[o])&&(e[i]=!(t[i]=u))}}else h=ve(h===t?h.splice(c,h.length):h),v?v(null,t,h,r):k.apply(t,h)})}function Ee(m,v){function e(e,t,n,r,i){var o,u,a,s=0,c="0",l=e&&[],f=[],h=C,p=e||b&&N.find.TAG("*",i),d=S+=null==h?1:Math.random()||.1,g=p.length;for(i&&(C=t!==x&&t,w=y);c!==g&&null!=(o=p[c]);c++){if(b&&o){for(u=0;a=m[u++];)if(a(o,t,n)){r.push(o);break}i&&(S=d,w=++y)}E&&((o=!a&&o)&&s--,e&&l.push(o))}if(s+=c,E&&c!==s){for(u=0;a=v[u++];)a(l,f,t,n);if(e){if(0<s)for(;c--;)l[c]||f[c]||(f[c]=P.call(r));f=ve(f)}k.apply(r,f),i&&!e&&0<f.length&&1<s+v.length&&ie.uniqueSort(r)}return i&&(S=d,C=h),l}var y=0,E=0<v.length,b=0<m.length;return E?ue(e):e}return he.prototype=N.filters=N.pseudos,N.setFilters=new he,g=ie.compile=function(e,t){var n,r=[],i=[],o=A[e+" "];if(!o){for(n=(t=t||pe(e)).length;n--;)(o=function e(t){for(var r,n,i,o=t.length,u=N.relative[t[0].type],a=u||N.relative[" "],s=u?1:0,c=ge(function(e){return e===r},a,!0),l=ge(function(e){return-1<M.call(r,e)},a,!0),f=[function(e,t,n){return!u&&(n||t!==C)||((r=t).nodeType?c:l)(e,t,n)}];s<o;s++)if(n=N.relative[t[s].type])f=[ge(me(f),n)];else{if((n=N.filter[t[s].type].apply(null,t[s].matches))[T]){for(i=++s;i<o&&!N.relative[t[i].type];i++);return ye(1<s&&me(f),1<s&&de(t.slice(0,s-1).concat({value:" "===t[s-2].type?"*":""})).replace(Y,"$1"),n,s<i&&e(t.slice(s,i)),i<o&&e(t=t.slice(i)),i<o&&de(t))}f.push(n)}return me(f)}(t[n]))[T]?r.push(o):i.push(o);o=A(e,Ee(i,r))}return o},d.sortStable=T.split("").sort(D).join("")===T,d.detectDuplicates=!!l,m(),d.sortDetached=ae(function(e){return 1&e.compareDocumentPosition(x.createElement("div"))}),ae(function(e){return e.innerHTML="<a href='#'></a>","#"===e.firstChild.getAttribute("href")})||se("type|href|height|width",function(e,t,n){if(!n)return e.getAttribute(t,"type"===t.toLowerCase()?1:2)}),d.attributes&&ae(function(e){return e.innerHTML="<input/>",e.firstChild.setAttribute("value",""),""===e.firstChild.getAttribute("value")})||se("value",function(e,t,n){if(!n&&"input"===e.nodeName.toLowerCase())return e.defaultValue}),ae(function(e){return null==e.getAttribute("disabled")})||se($,function(e,t,n){var r;if(!n)return!0===e[t]?t.toLowerCase():(r=e.getAttributeNode(t))&&r.specified?r.value:null}),ie}(i);function u(e,t){if(!e)return new p([],!0);var n=e.nodeType;if(function(e){var t=typeof e;if("object"!=t&&"function"!=t)return!1;var n="function";return String(e).slice(0,n.length)===n}(e))x(e);else{if("string"==typeof e){if("<"!==e.charAt(0))return new p(e,t);var r=o.createElement("div");return r.innerHTML=e,u.forEach(f("script",r),function(e){e.parentNode.removeChild(e)}),new p(r.childNodes,!0)}if(e instanceof p)return e;if(e===i||1===n||9===n)return new p(e,!1);if("length"in e)return new p(e,!0)}}function s(t,n){return Object.keys(n).forEach(function(e){t[e]=n[e]}),t}function t(){return!0}function c(e){return"object"==typeof e&&"length"in e&&e!==i}var h=0;function p(e,t){for(var n=!0===t?e:!1===t?[e]:f(e,t),r=n.length,i=0;i<r;++i)this[i]=n[i];this.length=r}function d(e){var t;this.originalEvent=e,this.type=e.type,this.target=l?e.target:e.srcElement,this.relatedTarget=e.relatedTarget||(e.fromElement!==this.target?e.fromElement:e.toElement),this.clientX=e.clientX,this.clientY=e.clientY,this.screenX=e.screenX,this.screenY=e.screenY,this.target&&(t=this.target.ownerDocument||o,n=t.documentElement,r=t.body,"pageX"in e?(this.pageX=e.pageX,this.pageY=e.pageY):(this.pageX=e.clientX+(n&&n.scrollLeft||r&&r.scrollLeft||0)-(n&&n.clientLeft||r&&r.clientLeft||0),this.pageY=e.clientY+(n&&n.scrollTop||r&&r.scrollTop||0)-(n&&n.clientTop||r&&r.clientTop||0))),0===e.type.indexOf("mouse")&&(this.which=1&e.button?1:2&e.button?3:4&e.button?2:0)}s(u,{select:f,extend:s,ready:x,forEach:function(e,t){for(var n=e.length,r=0;r<n&&!1!==t(e[r],r);++r);},map:function(e,t){for(var n=e.length,r=[],i=0;i<n;++i)r.push(t(e[i],i))},param:function(t){return"object"!=typeof t?"":Object.keys(t).map(function(e){return encodeURIComponent(e)+"="+encodeURIComponent(t[e])}).join("&")},matchesSelector:function(e,t){return c(e)&&(e=e[0]),!(!e||!t)&&f.matchesSelector(e,t)},text:function(e,t){if(c(e)&&(e=e[0]),!e)return!1;if(0===h)for(var n=["innerText","textContent"],r=n.length,i=0;i<r;++i){var o=n[i];if(o in e){h=o;break}}return"innerText"===h&&"SCRIPT"===e.tagName&&(h="text"),t?e[h]=t:t},html:function(e,t){return c(e)&&(e=e[0]),!!e&&(t?e.innerHTML=t:e.innerHTML)},contains:function(e,t){for(var n=t;;){if(n===e)return!0;if(!(n=n.parentNode))return!0}return!1}}),(p.prototype.constructor=u).fn=u.prototype=p.fn=p.prototype,s(d.prototype,{preventDefault:function(){var e=this.originalEvent;this.isDefaultPrevented=t,e&&(e.preventDefault?e.preventDefault():e.returnValue=!1)},stopPropagation:function(){var e=this.originalEvent;this.isPropagationStopped=t,e&&(e.stopPropagation&&e.stopPropagation(),e.cancelBubble=!0)},stopImmediatePropagation:function(){this.isImmediatePropagationStopped=t,this.stopPropagation()}});var g=Object.create(null),m=0;function v(e){return e.__kId||(e.__kId=++m)}function y(){var t=o.createDocumentFragment();return u.forEach(function t(e){if(1<arguments.length)return t(arguments);if(!c(e))return[e];var n=[];return u.forEach(e,function(e){n=n.concat(t(e))}),n}(arguments),function(e){t.appendChild(e)}),t}["every","forEach","some","reduce","reduceRight"].forEach(function(e){u.fn[e]=Array.prototype[e]}),["map","filter"].forEach(function(e){u.fn[e]=function(){return u(Array.prototype[e].apply(this,arguments))}}),s(u.fn,{filterSelector:function(e){return u(f(e,o,null,this))},matchesSelector:function(e){return 0!==this.length&&f.matchesSelector(this[0],e)},matches:function(e){f.matches(e,this)},hasClass:function(e){if(0===this.length)return!1;var t=this[0];return t.classList?t.classList.contains(e):-1!==t.className.split(" ").indexOf(e)},addClass:function(n){return this.forEach(function(e){var t;return u(e).hasClass(n)?this:void(e.classList?e.classList.add(n):((t=e.className.split(" ")).push(n),e.className=t.join(" ")))}),this},removeClass:function(n){return this.forEach(function(e){var t;return u(e).hasClass(n)?void(e.classList?e.classList.remove(n):(t=e.className.split(" "),e.className=t.filter(function(e){return e!==n}).join(" "))):this}),this},toggleClass:function(n){return this.forEach(function(e){var t;e.classList?e.classList.toggle(n):(t=u(e)).hasClass(n)?t.removeClass(n):t.addClass(n)}),this},removeProp:function(t){return this.forEach(function(e){try{e[t]=void 0,delete e[t]}catch(e){}}),this},prop:function(t,n){return 1<arguments.length?(this.forEach(function(e){e[t]=n}),this):this[0]?this[0][t]:void 0},removeAttr:function(t){return this.forEach(function(e){e.removeAttribute(t)}),this},attr:function(t,n){return 1<arguments.length?(this.forEach(function(e){e.setAttribute(t,n)}),this):this[0]?this[0].getAttribute(t):void 0},val:function(t){return t?(this.forEach(function(e){e.value=t}),this):this[0]?this[0].value:void 0},on:function(a,s,c){switch(arguments.length){case 3:break;case 2:c=s,s=null;break;default:throw"Arguments incorrect"}return this.forEach(function(e){function t(e){var t=new d(e),n=t.target;i&&!f.matchesSelector(n,i)||!1===o.call(n,t)&&(t.preventDefault(),t.stopPropagation())}var n,r,i,o,u;r=a,i=s,o=c,u=v(n=e),(g[u]||(g[u]=[])).push({elem:n,event:r,filter:i,fn:o,proxy:t}),l?n.addEventListener(r,t,!1):n.attachEvent("on"+r,t)}),this},off:function(a,s,c){switch(arguments.length){case 3:break;case 2:c=s,s=null}return this.forEach(function(e){var n,r,i,o,t,u;r=a,i=s,o=c,t=v(n=e),(u=g[t])&&u.forEach(function(e,t){!e||n!==e.elem||r&&e.event!==r||i&&e.filter!==i||o&&e.fn!==o||(l?n.removeEventListener(e.event,e.proxy,!1):n.detachEvent("on"+e.event,e.proxy),delete u[t])})}),this},css:function(t,n){if(0===this.length)return this;if(1<arguments.length)return this.forEach(function(e){e.style[t]=n}),this;if("string"!=typeof t)return this.forEach(function(e){s(e.style,t)}),this;var e=this[0].style[t];return""!==e?e:getComputedStyle(this[0])[t]},remove:function(){return 0===this.length||this.forEach(function(e){e.parentNode.removeChild(e)}),this},html:function(e){return 0===this.length?this:0<arguments.length?(u.html(this[0],e),this):u.html(this[0])},text:function(e){if(0===this.length)return this;var t=this[0];return 0<arguments.length?(u.text(t,e),this):u.text(t)},parent:function(){return 0===this.length?u([]):u(this[0].parentNode)},parents:function(){if(0===this.length)return u([]);for(var e=this[0],t=[];e=e.parentNode;)t.push(e);return u(t)},closest:function(e){for(var t=this[0];t=t&&t.parentNode;)if(f.matchesSelector(t,e))return u(t);return u([])},find:function(e){return 0===this.length?u([]):u(e,this[0])},children:function(e){return 0===this.length?u([]):u(e?f(e,this[0],null,this[0].children):this[0].children)},append:function(){return 0===this.length||this[0].appendChild(y(arguments)),this},appendTo:function(e){var t=u(e);return 0===t.length||t[0].appendChild(y(this)),this},prepend:function(){if(0===this.length)return this;var e=this[0];return e.insertBefore(y(arguments),e.children[0]),this},prependTo:function(e){var t=u(e);if(0===t.length)return this;var n=t[0];return n.insertBefore(y(this),n.chilren[0]),this},insertBefore:function(e){if(0===this.length)return this;var t=u(e)[0];return t.parentNode.insertBefore(this[0],t),this},before:function(e){if(0===this.length)return this;var t=this[0],n=u(e)[0];return t.parentNode.insertBefore(n,t),this},insertAfter:function(e){if(0===this.length)return this;var t=u(e)[0];return t.parentNode.insertBefore(this[0],t.nextSibling),this},after:function(e){if(0===this.length)return this;var t=this[0],n=u(e)[0];return t.parentNode.insertBefore(n,t.nextSibling),this},hide:function(){return this.css("display","none"),this},show:function(){return this.css("display","block"),this}});var e,E,w=((e=o.createElement("div")).innerHTML="\x3c!--[if LTE 8]>x<![endif]--\x3e","x"===e.innerHTML||!e.addEventListener);function N(){var e;return E||(e=o.readyState,E=(!w&&"interactive"===e||"complete"===e)&&!!o.body),E}var C=[];function x(e){N()?e(u):C.push(e)}function T(){N()&&(C.forEach(function(e){e(u)}),C.length=0,l?o.removeEventListener("readystatechange",T,!1):o.detachEvent("onreadystatechange",T))}return N()||(l?o.addEventListener("readystatechange",T,!1):o.attachEvent("onreadystatechange",T)),u}(window,document),$=kQuery;