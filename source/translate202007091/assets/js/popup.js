define(function(require){require("lib/jq.mobi-custom");var o=require("lib/jq.mobi"),e=require("lib/jquery.transition"),i=require("lib/storage"),a=require("components/resultView");e(o);function s(e,t){chrome.runtime.sendMessage({type:"stat",value:{type:e,data:t}})}o("#translate");var t=o("#form"),l=t.find(".input-query"),u=t.find("input[type=submit]"),c=o("#result");c.on("mouseover",".lb_dic_sound",function(e){var t=e.target.getAttribute("sound");if(t){var n=99;switch(e.target.getAttribute("ph")){case"ph_en":n=1;break;case"ph_am":n=2}s(10,{value:2,value1:n}),chrome.runtime.sendMessage({type:"play",key:e.target.getAttribute("key"),url:t})}});var r=o("#poweredBy");r.on("click","a",function(){s(11)});var d,n=JSON.parse(i.getItem("settings")||"{}");!0===n.openSelected&&o("#openSelected").attr("checked","true").attr("title","点击关闭划词翻译"),!0===n.openPage&&o("#openPage").attr("checked","true").attr("title","点击关闭整页翻译"),o('input[name="settings"]').change(function(){n[o(this).attr("id")]=this.checked,i.setItem("settings",JSON.stringify(n)),o(this).attr("title","点击"+(this.checked?"关闭":"开启")+("openPage"==o(this).attr("id")?"整页":"划词")+"翻译")}),o("#openPage").change(function(){this.checked&&i.removeItem("ignoreHost")});var p=!1;u.on("mousedown",function(){if(u.hasClass("input-delete"))return l.val(""),l[0].focus(),!1});var m,v,g,h=!1;function f(){d!==l.val()&&(p=!0,t.submit())}chrome.runtime.sendMessage({type:"isShowDetails"},function(e){e&&(console.log(e),l.val(e),h=!0,t.trigger("submit"))}),t.on("submit",function(e){e.preventDefault(),d=l.val();var n=l.val().replace(/　/g," ").replace(/(^\s*)|(\s*$)/g,"");if(!n.length)return l.val(""),l[0].focus(),!1;c.css({top:"350px"}),o("#poweredBy").hide(),c[0].textContent="正在查询中...",t.transition({top:"20px"}),o("#dictionary").animate({top:"-1000px"}),c.transition({top:"87px"},function(){c[0].style.webkitTransform="rotateZ(0)"}),chrome.runtime.sendMessage({type:"queryFromPopup",value:n,auto:p,isShowDetails:h},function(e){h=!1;var t=e.value.result;c[0].innerHTML=a(n,t),r[0].innerHTML=e.value.poweredBy,e.value.poweredBy&&(o("#poweredBy")[0].innerHTML=e.value.poweredBy+" 支持",o("#poweredBy").show()),p?p=!1:l[0].blur(),u.removeClass("input-submit").addClass("input-delete"),i.setItem("query",n),i.setItem("result",t),[].forEach.call(c[0].querySelectorAll(".lb_dic_sound"),function(t){var e=t.getAttribute("sound");e&&chrome.runtime.sendMessage({type:"isPlayable",key:t.getAttribute("key"),url:e},function(e){e&&(t.style.display="")})})})}),o(".icon-close").on("click",function(){window.close()}),l.on("click",function(){this.select()}).on("focus",function(){u.removeClass("input-delete").addClass("input-submit")}).on("input",function(){m&&clearTimeout(m),m=setTimeout(f,1e3)}),window.location.search.length&&(v=window.location.search.substr(1).match(new RegExp("(^|&)word=([^&]*)(&|$)","i")),g=decodeURIComponent(v[2]),l.val(g),t.submit());var y=l,b=o('<menu class="contextmenu"><li class="copyAll">复制全部</li><li class="copy">复制</li><li class="paste">粘贴</li></menu>');document.body.appendChild(b[0]);var w,k=o(".copyAll",b),C=o(".copy",b),x=o(".paste",b),A=window.getSelection(),R=o('<div class="copyAll-tips">已复制到剪贴板</div>');function S(){s(10,{value:2,value1:1}),w=null;var e=document.createRange();return e.selectNode(y[0]),A.removeAllRanges(),A.addRange(e),document.execCommand("copy"),A.removeAllRanges(),document.body.appendChild(R[0]),setTimeout(function(){document.body.removeChild(R[0])},1e3),b.hide(),!1}k.on("click",S),C.on("click",function(){if(y===l)s(10,{value:1,value1:1}),""===l[0].value?(l[0].value=" ",l[0].select(),document.execCommand("copy"),l[0].value=""):(l[0].select(),document.execCommand("copy"));else{if(A.removeAllRanges(),A.addRange(w),w=null,0===A.toString().length)return S();s(10,{value:2,value1:2}),document.execCommand("copy")}return b.hide(),!1}),x.on("click",function(){return s(10,{value:1,value1:2}),w=null,y[0].select(),document.execCommand("paste"),b.hide(),!1});var I=o(document.body);I.on("contextmenu",function(e){var t=e.target;if(l[0].contains(t))y=l,k.hide(),x.show();else{if(!c[0].contains(t))return;w=A.getRangeAt(0),y=c,k.show(),x.hide()}var n=e.pageX,o=e.pageY;return 240<n&&(n-=75),330<o&&(o-=55),b.css({left:n+"px",top:o+"px"}),b.show(),I.on("mouseup",function e(){I.off("mouseup",e),b.hide()}),!1});var M=3,T=setInterval(function(){--M<0?clearInterval(T):o("<div>").addClass("circle").appendTo(o("#dictionary"))},1500)});
