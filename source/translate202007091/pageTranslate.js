void 0===window.__lbTranslatePageTranslateInited&&(window.__lbTranslatePageTranslateInited=!0,kQuery(function(S){var $,j,H,R=!window.XMLHttpRequest,o=Object.create(null);["BODY","SECTION","NAV","ARTICLE","ASIDE","H1","H2","H3","H4","H5","H6","HEADER","FOOTER","ADDRESS","MAIN","P","PRE","BLOCKQUOTE","OL","UL","LI","DL","DT","DD","DIV","A","EM","STRONG","SMALL","S","CITE","Q","DFN","ABBR","I","B","U","MARK","SPAN","INS","DEL","TABLE","CAPTION","COLGROUP","COL","TBODY","THEAD","TFOOT","TR","TD","TH","FORM","SELECT","OPTION","LABEL","OUTPUT"].forEach(function(e){o[e]=!0});var n,a,P=(a=n=null,function(){return n=[],a=[],function e(t,o){if(t&&!1!==o(t))for(var n=t.childNodes,a=n.length,r=0;r<a;r++)e(n[r],o)}(document.body,function(e){var t;return 3==e.nodeType&&e.parentNode&&e.parentNode.tagName.toUpperCase()in o?(n.push(e),a.push(e.parentNode),!1):(!e.getAttribute||!(t=e.getAttribute("id"))||0!==t.indexOf("lb_infobar_")&&0!==t.indexOf("lb_tip_"))&&void 0}),n});!function(o){var e=document&&document.documentElement&&document.documentElement.lang&&document.documentElement.lang.toLowerCase&&document.documentElement.lang.toLowerCase();if(e){if(0===e.indexOf("zh"))return o("ch");if(0===e.indexOf("ja"))return o("ja")}var n=!1;chrome.runtime.sendMessage({type:"countText",html:document.body.innerHTML},function(e){var t;n||(n=!0,t="",window.console&&window.console.dir&&window.console.dir(e),t=!e||!e.total||e.total<30?"":e.ja&&.2<e.ja/e.total?"ja":(!e.ch||e.ch/e.total<.1)&&(!e.ja||e.ja/e.total<.05)&&e.en&&.5<e.en/e.total?"en":"ch",o(t))})}(function(e){var B=Math.ceil(1e10*Math.random());if("ja"===e)$="日文",j="JA2ZH_CN",H=1;else{if(!/^en/i.test(e))return;$="英文",j="EN2ZH_CN",H=0}chrome.runtime.sendMessage({type:"isShowInfoBar"},function(e){var A,L,M,t;e.showInfoBar&&(A=function(e,t){chrome.runtime.sendMessage({type:"stat",value:{type:e,data:t}})},L=e.action,A(5,{value:window.location.href,la:H}),(t=(M=function(){var e=['<div id="lb_infobar_#barId#" _lego="translate">','<div id="lb_infobar_icon_#barId#"></div>','<span id="lb_infobar_notice_#barId#">此网站为'+$+"页面, 是否需要翻译?</span>",'<input id="lb_infobar_return_#barId#" style="display:none" type="button" value="恢复原文" />','<input id="lb_infobar_translate_#barId#" type="button" value="翻译网页" />','<input id="lb_infobar_words_#barId#" class="lb_infobar_btn_inactive_#barId#" type="button" '+(R?'style="display:none !important;"':"")+' value="鼠标悬停翻译" />','<span id="lb_infobar_powered_#barId#" style="display:none">powered by youdao</span>','<div id="lb_infobar_close_#barId#">×</div>','<a id="lb_infobar_ignore_#barId#" href="#">不再翻译此网站</a>','<a id="lb_infobar_manual_#barId#" href="http://f.youdao.com/?vendor=liebao" target="_blank">人工翻译</a>',"</div>",'<div id="lb_infobar_hover_#barId#" style="display:none"></div>'];var t,o,n,a=document.body,r=getComputedStyle(a),i=(t=document,o=document.body,(n=S.extend({},document.body.getBoundingClientRect())).top=n.top+(t&&t.scrollTop||document.documentElement&&document.documentElement.scrollTop||o&&o.scrollTop||0)-(t&&t.clientTop||o&&o.clientTop||0),n.left=n.left+(t&&t.scrollLeft||document.documentElement&&document.documentElement.scrollLeft||o&&o.scrollLeft||0)-(t&&t.clientLeft||o&&o.clientLeft||0),n),l=a.style.cssText,d=(parseInt(r.marginTop,10)||0)+38,c=parseInt(r.marginLeft,10)||0,b=r.position||"static";a.style.cssText+=";margin-top:"+d+"px !important;"+("static"===b?"position:relative !important;":"");var s,u,p,f=document.createElement("div"),_=e.join("").replace(/#barId#/g,B),g=["#lb_infobar_#barId#{","color:#000000;","font-weight:normal;","text-decoration:none;","margin-top:0;","margin-bottom:0;","margin-left:0;","margin-right:0;","padding-top:0;","padding-bottom:0;","padding-left:0;","padding-right:0;","float:none;","text-align:left;","height:37px;","width:100%;","background-color:#F5F5F5;","background-image:-webkit-linear-gradient(top,#F5F5F5,#EEEDED);","border-bottom:1px solid #C0C0C0;","box-shadow:inset 0 1px 1px 1px #FFFFFF;","line-height:36px;","font-family:'微软雅黑','宋体';","z-index:9999999999;","margin:0;","padding:0;","position:fixed;","top:0px;","left:0px;","}","#lb_infobar_#barId#,#lb_infobar_#barId# *{","border-radius:0;","padding:0;","margin:0;","}","#lb_infobar_#barId# *{","width:auto;","background:none;","}","#lb_infobar_#barId# input{","border-radius:4px;","box-shadow:0 1px 2px rgba(0,0,0,.15);","font-family:'微软雅黑,','宋体';","font-size:12px;","font-weight:normal;","text-shadow:none;","margin:0 0 0 18px;","padding:0;","}","#lb_infobar_translate_#barId#{","background-color:#FBB016;","background-image:-webkit-linear-gradient(top,#FBB016,#ED8A0D);","width:78px;","height:26px;","border:1px solid #E19D3C;","color:#FFFFFF;","cursor:pointer;","line-height:normal;","vertical-align:middle;","}","#lb_infobar_translate_#barId#:hover{","background-color:#FDBF3F;","background-image:-webkit-linear-gradient(top,#FDBF3F,#ED8A0D);","}","#lb_infobar_translate_#barId#:active{","background-color:#ED8A0D;","background-image:-webkit-linear-gradient(top,#ED8A0D,#FBB016);","}","#lb_infobar_words_#barId#{","background-color:#FBB016;","background-image:-webkit-linear-gradient(top,#FBB016,#ED8A0D);","width:90px;","height:26px;","border:1px solid #E19D3C;","color:#FFFFFF;","cursor:pointer;","line-height:normal;","vertical-align:middle;","left:360px;","}","#lb_infobar_words_#barId#:hover{","background-color:#FDBF3F;","background-image:-webkit-linear-gradient(top,#FDBF3F,#ED8A0D);","}","#lb_infobar_words_#barId#:active{","background-color:#ED8A0D;","background-image:-webkit-linear-gradient(top,#ED8A0D,#FBB016);","}","#lb_infobar_return_#barId#{","background-color:#FFFFFF;","background-image:-webkit-linear-gradient(top,#FFFFFF,#E0DFDF);","width:78px;","height:26px;","border:1px solid #B0AFAF;","color:rgba(0,0,0,.5);","cursor:pointer;","line-height:normal;","vertical-align:middle;","}","#lb_infobar_return_#barId#.lb_infobar_return_words_#barId#{","width:130px;","}","#lb_infobar_return_#barId#:hover{","background-color:#EDECEC;","background-image:-webkit-linear-gradient(top,#FFFFFF,#EDECEC);","}","#lb_infobar_return_#barId#:active{","background-color:#E0DFDF;","background-image:-webkit-linear-gradient(top,#E0DFDF,#FFFFFF);","}","#lb_infobar_#barId# a{","text-decoration:underline;","font-size:12px;","color:#999999;","cursor:pointer;","}","#lb_infobar_#barId# a:hover{","color:#FC9500;","}","#lb_infobar_#barId# a:active{","color:#D68003;","}","#lb_infobar_close_#barId#{","background-position:-66px -27px;","cursor:pointer;","position:absolute;","top:0;","right:1em;","line-height:36px;","}","#lb_infobar_close_#barId#:hover{","background-position:-66px -41px;","}","#lb_infobar_close_#barId#:active{","background-position:-66px -54px;","}","#lb_infobar_notice_#barId#{","line-height:36px;","margin-left:55px;","font-size:14px;","vertical-align:middle;","}","#lb_infobar_powered_#barId#{","padding-left:18px;","font-size:10px;","color:#979797;","font-family:'Arial';","font-style:italic;","}","#lb_infobar_ignore_#barId#{","line-height:36px;","margin-right:3em;","position:absolute;","top:0;","right:0;","}","#lb_infobar_manual_#barId#{","line-height:36px;","margin-right:12em;","position:absolute;","top:0;","right:0;","}","#lb_infobar_icon_#barId#{","position:absolute;","top:0;","left:0;","height:37px;","width:42px;","color:#fff;","font-size:24px;","text-align:center;","background-repeat:no-repeat;","background-position:-80px 0;","}","#lb_infobar_translate_#barId#.lb_infobar_btn_inactive_#barId#,#lb_infobar_words_#barId#.lb_infobar_btn_inactive_#barId#{","background-color:#FFFFFF;","background-image:-webkit-linear-gradient(top,#FFFFFF,#E0DFDF);","border:1px solid #B0AFAF;","color:#808080;","}","#lb_infobar_translate_#barId#.lb_infobar_btn_inactive_#barId#:hover,#lb_infobar_words_#barId#.lb_infobar_btn_inactive_#barId#:hover{","background-color:#EDECEC;","background-image:-webkit-linear-gradient(top,#FFFFFF,#EDECEC);","}","#lb_infobar_translate_#barId#.lb_infobar_btn_inactive_#barId#:hover,#lb_infobar_words_#barId#.lb_infobar_btn_inactive_#barId#:active{","background-color:#E0DFDF;","background-image:-webkit-linear-gradient(top,#E0DFDF,#FFFFFF);","}","#lb_infobar_hover_#barId#:before{",'content:" ";',"position:absolute;","border:5px solid transparent;","border-top:5px solid #000;","bottom: -10px;","left: 50%;","}","#lb_infobar_hover_#barId#:after{",'content:" ";',"position:absolute;","border:5px solid transparent;","border-top:5px solid #fff;","bottom: -9px;","left: 50%;","}","#lb_infobar_hover_#barId#{","line-height:1.2;","font-size:12px;","min-width:150px;","position:fixed;","background:#fff;","border:1px solid #333;","border-radius:3px;","padding:10px;","color:#333;","z-index:9999999999;","}","#lb_infobar_hover_#barId#.lb_infobar_hover_below:before{",'content:" ";',"position:absolute;","border:5px solid transparent;","border-bottom:5px solid #000;","top:-10px;","left:50%;","bottom:auto;","}","#lb_infobar_hover_#barId#.lb_infobar_hover_below:after{",'content:" ";',"position:absolute;","border:5px solid transparent;","border-bottom:5px solid #fff;","top: -9px;","left: 50%;","bottom:auto;","}"].join("").replace(/#barId#/g,B).replace(/;/g," !important;"),h=!!window.XMLHttpRequest;f.webkitCreateShadowRoot?(f.innerHTML="",f.style.cssText=[";width:0","height:0","padding:0","margin:0","z-index:9999999999",""].join(" !important;"),(s=f.webkitCreateShadowRoot()).resetStyleInheritance=!0,s.innerHTML="<style>"+g+"</style>"+_,u=s.querySelector("div")):(S.addCss(g),f.innerHTML=_,u=f.childNodes[0],h||(p=document.documentElement.clientWidth||document.body.clientWidth||window.innerWidth,u.style.cssText+=";position:absolute !important;width:"+p+"px !important;top:-"+("CSS1Compat"===document.compatMode?Math.max(i.top,d):0)+"px !important;left:-"+Math.max(i.left,c)+"px !important;")),document.body.appendChild(f);var m=S("#lb_infobar_icon_"+B,u);return chrome.lego.getFile("/images/tip.png",function(e){m[0].style.cssText="background-image:url("+e+") !important;"}),{$infoBar:S(u),$manual:S("#lb_infobar_manual_"+B,u),$close:S("#lb_infobar_close_"+B,u),$ignore:S("#lb_infobar_ignore_"+B,u),$translate:S("#lb_infobar_translate_"+B,u),$return:S("#lb_infobar_return_"+B,u),$notice:S("#lb_infobar_notice_"+B,u),$powered:S("#lb_infobar_powered_"+B,u),$words:S("#lb_infobar_words_"+B,u),$hoverTips:S(u.nextSibling),close:function(){u.style.display="none",a.style.cssText=l,f.parentNode&&f.parentNode.removeChild(f)}}}()).$infoBar).on("click",function(e){e.stopPropagation()}),t.on("mousedown",function(e){e.stopPropagation()}),t.on("mouseup",function(e){e.stopPropagation()}),M.$close.on("click",function(){A(6,{value:window.location.href,value1:4,la:H}),M.close()}),M.$manual.on("click",function(){A(6,{value:window.location.href,value1:2,la:H})}),M.$ignore.on("click",function(){A(6,{value:window.location.href,value1:3,la:H}),M.close(),chrome.runtime.sendMessage({type:"ignore",value:window.location.hostname})}),function(){var f=null,l=!1,_=null,g=null,h=M.$translate,m=M.$return,v=M.$words,w=M.$notice,x=M.$powered,d=(M.$wordsCount,null),c=[],b=[],F=M.$hoverTips;function s(e){return y(e)&&3===e.nodeType}var a=null,r=[];function y(e,t){if(a){if(1===arguments.length){for(var o=a.length-1;-1<o;--o)if(a[o]===e)return r[o];return null}for(o=a.length-1;-1<o;--o)if(a[o]===e)return void(r[o]=t);a.push(e),r.push(t)}else{if(1===arguments.length)return e.__lb_translate_data;e.__lb_translate_data=t}}!function(e){try{e.__lb_translated="test",e.__lb_translated=null}catch(e){a=[]}}(document.createTextNode(" "));var u="lb_translate_span_"+B;function o(e){if(e!==d){for(var t=e.childNodes,o=t.length,n=!1,a=0;a<o;++a)if(s(t[a])){n=!0;break}if(!n)return;for(t=function(e){for(var t=[],o=e.length-1;-1<o;--o)t.unshift(e[o]);return t}(t),c.length=0,b.length=0,d=e,a=0;a<o;++a){var r,i=t[a];s(i)&&0<C(i.nodeValue).length&&((r=document.createElement("span")).className=u,r.appendChild(i.cloneNode()),y(r,y(t[a])),d.replaceChild(r,t[a]),b.push(r),c.push(t[a]))}S(e).on("mousemove",function(e){var t,o,n=e.target;n.className===u?(t=e.clientX,o=e.clientY,k=n,chrome.lego.clearTimeout(E),E=chrome.lego.setTimeout(function(){k===n&&!function e(t,o,n,a){k=t;var r={display:"block",left:"auto",right:"auto",top:"auto",bottom:"auto",width:"auto"};var i=window.innerWidth||document.documentElement.clientWidth||document.body.clientWidth;var l=window.innerHeight||document.documentElement.clientHeight||document.body.clientHeight;var d=F[0].innerText=y(t);var c=150;30<d.replace(/[^\x00-\xff]/g,"**").length&&(c=300,r.width=c+"px");var b=t.getBoundingClientRect();if(0===b.top&&0===b.left&&0===b.right&&0===b.bottom||b.top<30)return void(a&&chrome.lego.setTimeout(function(){k===t&&e(t,o,n,!0)},300));console.log(JSON.stringify(b));100<b.top?(r.bottom=l-b.top+10+"px",F[0].className=""):(r.top=b.bottom+10+"px",F[0].className="lb_infobar_hover_below");Math.abs(b.right-b.left)<200?r.left=Math.max(Math.floor((b.left+b.right-c)/2),10):r.left=Math.max(i-b.right>b.left?b.right-c:b.left,10);r.left=Math.min(r.left,i-c-40)+"px";var s="";var u=Object.keys(r);for(var p=u.length-1;-1<p;--p)s+=u[p]+":"+r[u[p]]+" !important;";I=Date.now();F[0].style.cssText=s}(n,t,o)},300)):(k=null,p())})}}var I=0;function p(e){0!==I&&(A(14,{value:g?2:1,value1:Math.round((Date.now()-I)/1e3)}),F[I=0].style.cssText="display:none !important;")}var k=null;var i,E=null;function D(e){var t=e.target;d?d!==t&&t.className!==u&&(S(d).off("mousemove"),p(),function(){for(var e=b.length-1;-1<e;--e)d.replaceChild(c[e],b[e]);c.length=0,b.length=0,d=null}()):(p(),o(t))}function T(){var e,t;R||(S(document).on("mousemove",D),e=["."+u+":hover{","background:#f1f0a0;","}","."+u+"{","display:inline;","width:auto;","margin:0;","padding:0;","font-family:inherit;","font-size:inherit;","line-height:inherit;","float:none;","text-transform:initial;","color:inherit;","font-weight:inherit;","cursor:inherit;","}"].join("").replace(/#barId#/,B).replace(/;/g," !important;"),(i=document.createElement("style")).setAttribute("type","text/css"),i.styleSheet?i.styleSheet.cssText=e:i.innerHTML=e,document.head.appendChild(i),(t=S(window)).on("scroll",p),t.on("resize",p))}function C(e){return e.replace(/^[\s\r\n\u00A0]+|[\s\r\n\u00A0]+$/g,"")}function t(){_=P();var e,t,o,n=Math.ceil(_.length/40);f={};for(var a=0;a<n;a++){e=40*a,t=Math.min(40*(a+1),_.length),o={};for(var r,i=e;i<t;i++){!_[i].parentNode||0<(r=C(_[i].nodeValue)).length&&(o[i]={src:r,tag:_[i].parentNode.tagName})}!function(i){chrome.lego.ajax({url:"http://fanyi.youdao.com/jtr",method:"POST",data:{type:j,ue:"utf-8",data:JSON.stringify(i),keyfrom:"liebao_translate"}},function(e){if(l){try{var t=JSON.parse(e)}catch(e){return}if(0===t.errorCode&&t.data)for(var o,n=Object.keys(t.data),a=0;a<n.length;a++){o=t.data[n[a]].tst;var r=i[n[a]].src;(o=o&&C(o))&&o.toLowerCase()!==r.toLowerCase()&&_[n[a]]&&_[n[a]].parentNode&&(f[n[a]]=document.createTextNode(o),y(f[n[a]],"原文: "+r),_[n[a]].parentNode.replaceChild(f[n[a]],_[n[a]]))}}},function(e){})}(o)}l=!0,h.css({display:"none"}),m.css({display:""}),x.css({display:""}),w.text("已经翻译全文, 您也可以点击这里"),h[0].className="lb_infobar_btn_inactive_"+B,v[0].className="lb_infobar_btn_inactive_"+B,T()}function n(e){if(l||g){if(A(6,{value:window.location.href,value1:5,la:H}),l){for(var t=Object.keys(f),o=0;o<t.length;o++)f[t[o]]&&_[t[o]]&&f[t[o]].parentNode&&f[t[o]].parentNode.replaceChild(_[t[o]],f[t[o]]);f={}}var n;a&&(a.length=0),r.length=0,g=l=!1,m.css({display:"none"}),m.removeClass("lb_infobar_return_words_"+B),m.val("恢复原文"),h.css({display:""}),R||v.css({display:""}),x.css({display:"none"}),w.text("此网站为"+$+"页面, 是否需要翻译?"),R||(S(document).off("mousemove",D),i&&i.parentNode&&i.parentNode.removeChild(i),(n=S(window)).off("scroll",p),n.off("resize",p)),e&&e.stopPropagation()}}h.on("click",function(e){chrome.runtime.sendMessage({type:"action",action:"translate"}),l||(g?(A(6,{value:window.location.href,value1:72,la:H}),n(),g=!1):A(6,{value:window.location.href,value1:71,la:H}),t())});var N=!1;function O(){_=P(),f={};for(var e=_.length-1;-1<e;--e){var t,o=_[e].nodeValue;if(0<o.length&&-1!==o.indexOf(". ")&&0<C(o).length&&1<(t=o.split(". ")).length){for(var n=[e,1],a=document.createDocumentFragment(),r=t.length,i=0;i<r;++i){var l=document.createTextNode(t[i]+(i===r-1?"":". "));n.push(l),a.appendChild(l)}_[e].parentNode.replaceChild(a,_[e]),_.splice.apply(_,n)}}for(var d,c,b,s=Math.ceil(_.length/40),u=0;u<s;u++){d=40*u,c=Math.min(40*(u+1),_.length),b={};for(var p,e=d;e<c;e++){!_[e].parentNode||0<(p=C(_[e].nodeValue)).length&&(b[e]={src:p,tag:_[e].parentNode.tagName})}!function(i){chrome.lego.ajax({url:"http://fanyi.youdao.com/jtr",method:"POST",data:{type:j,ue:"utf-8",data:JSON.stringify(i),keyfrom:"liebao_translate"}},function(e){if(g){try{var t=JSON.parse(e)}catch(e){return}if(0===t.errorCode&&t.data)for(var o,n=Object.keys(t.data),a=0;a<n.length;a++){o=t.data[n[a]].tst;var r=i[n[a]].src;(o=o&&C(o))&&o.toLowerCase()!==r.toLowerCase()&&_[n[a]]&&_[n[a]].parentNode&&y(_[n[a]],"翻译: "+o)}}},function(e){})}(b)}g=!0,x.css({display:""}),h[0].className="lb_infobar_btn_inactive_"+B,v.css({display:"none"}),v[0].className="lb_infobar_btn_inactive_"+B,m.css({display:""}),m.addClass("lb_infobar_return_words_"+B),m.val("取消鼠标悬停翻译"),w.text("已进入鼠标悬停翻译模式, 您也可以点击这里"),T()}m.on("click",function(e){L&&!N&&(N=!0,A(6,{value:window.location.href,value1:85,la:H})),chrome.runtime.sendMessage({type:"return"}),n(e),h[0].className=""}),v.on("click",function(e){chrome.runtime.sendMessage({type:"action",action:"words"}),g||(l?(A(6,{value:window.location.href,value1:82,la:H}),n(),l=!1):A(6,{value:window.location.href,value1:81,la:H}),O())}),"translate"===L?(A(12,{value:window.location.hostname,value1:1,la:H}),t()):"words"===L&&(A(12,{value:window.location.hostname,value1:2,la:H}),O())}())})})}));