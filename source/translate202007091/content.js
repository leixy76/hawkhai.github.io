!function(B){var t,T,M;void 0===window.__lbTranslateContentInited&&(window.__lbTranslateContentInited=!0,(t=B.createElement("div")).innerHTML="\x3c!--[if LTE 8]>x<![endif]--\x3e","x"!==t.innerHTML&&t.addEventListener&&(T=function(t,e){chrome.runtime.sendMessage({type:"stat",value:{type:t,data:e}})},(M=kQuery)(function(){var s,c,e,n,v=!window.XMLHttpRequest,x=/MSIE 7/.test(navigator.userAgent),y=!1,t=function(t,e,n,i){t.addEventListener?t.addEventListener(e,n,i):t.attachEvent("on"+e,n)};e=/[a-zA-Z0-9]/,n=[913,65509],c=function(t){return e.test(t)},s=function(t){var e=t.charCodeAt(0);return n[0]<e&&e<n[1]};var i,r=function(){var t,e;if(B.getSelection){if((t=B.getSelection()).isCollapsed)return;e=t.getRangeAt(0)}else t=B.selection,e=B.selection.createRange();return o(e).replace(/<\/?[^>]*>/g,"").replace(/[\r\n]/gi,"")};function u(t){return t.toString?t.toString():t.text}function o(t){for(var e=u(t),n=e.length,i=!1,o=0;o<n;++o){var r=function(t){for(var e=[{range:[12352,12543],language:"ja"},{range:[19968,40869],language:"ch"},{range:[48,57],language:"num"},{range:[65,90],language:"en"},{range:[97,122],language:"en"}],n=t.charCodeAt(0),i=e.length-1;0<=i;i--)if(n>=e[i].range[0]&&n<=e[i].range[1])return e[i].language;return"unknown"}(e.charAt(o));if("en"===r||"ja"===r){i=!0;break}}if(!i)return"";!function(t){var e,n,i;if(!t.collapsed&&t.startContainer){for(;0<t.startOffset&&(n=t.toString()[0])&&c(n);)if(t.setStart(t.startContainer,t.startOffset-1),!c(t.toString()[0])){t.setStart(t.startContainer,t.startOffset+1);break}for(;t.endOffset<t.endContainer.length&&(i=(e=t.toString())[e.length-1])&&c(i);)if(t.setEnd(t.endContainer,t.endOffset+1),!c((e=t.toString())[e.length-1])){t.setEnd(t.endContainer,t.endOffset-1);break}}}(t);for(var a,l,p,d=u(t);d.length&&(a=d.charAt(0))&&!c(a)&&!s(a);)d=d.slice(1);for(;(p=d.length)&&(l=d.charAt(p-1))&&!c(l)&&!s(l);)d=d.slice(0,p-1);return d.replace(/<\/?[^>]*>/g,"")}var a,l,w,p,d,k=(a={"&":"&#38;","<":"&#60;",">":"&#62;",'"':"&#34;","'":"&#39;","/":"&#47;"},l=/&|<|>|"|'|\//g,{extend:_,text:function(t,e){return void 0!==e?"innerText"in t?t.innerText=e:t.textContent=e:"innerText"in t?t.innerText:t.textContent},strWidth:function(t){return t.replace(/[^\x00-\xff]/g,"**").length},cutString:function(t,e){var n=t.substr(0,e),i=n.replace(/[^\x00-\xff]/g,"\r\n").split("");e="\r"==i[e-1]?e-2:e-1;var o=i.slice(0,e).join("").replace(/\r\n/g,"*").length+1,r=n.substr(0,o);return r.length!=t.length&&(r+="..."),r},forEach:function(t,e){for(var n=0;n<t.length;++n)e.call(t[n],t[n],n)},remove:function(t){t.parentNode&&t.parentNode.removeChild(t)},query:function(t,e){chrome.runtime.sendMessage({type:"query",value:t},function(t){e(t.value)})},XSSSafe:function(t){if(t.replace)return t.replace(l,function(t){return a[t]||t});throw"Not a string"},show:function(t){_(t.style,{display:"block"})},hide:function(t){_(t.style,{display:"none"})},settings:{get:function(e){chrome.runtime.sendMessage({type:"settings",value:{method:"get"}},function(t){i=t.value,e(t.value)})},set:function(t,e){chrome.runtime.sendMessage({type:"settings",value:{method:"set",data:t},source:"tip"},function(t){k.extend(i,t.value),e(t.value)})}}});function _(e,n){return Object.keys(n).forEach(function(t){e[t]=n[t]}),e}var I,C,E=B.createElement("div"),F=Math.ceil(1e10*Math.random());!function(){var t=["#lb_tip_#tipId#{","position:absolute;","top:0px;","left:0px;","background-color:#FCFCFC;",'font-family:"微软雅黑","宋体",simhei,simsun,sans-serif;',"font-size:12px;","border:1px solid #B8B8B8;","border-radius:4px;","box-shadow:0 5px 16px rgba(0,0,0,.45);","font-weight:normal;","}","#lb_tip_#tipId#,#lb_tip_#tipId# *{","border-radius:0;","padding:0;","margin:0;","}","#lb_tip_article_#tipId#::-webkit-scrollbar{","width: 8px;","background-color:#FCFCFC;","}","#lb_tip_article_#tipId#::-webkit-scrollbar-thumb{","-webkit-border-radius:4px;","border:0;","background-color: #E5E5E5;","}","#lb_tip_article_#tipId#{","max-height:100px;","overflow-x:hidden;","overflow-y:auto;","margin:8px 12px 8px 12px;","line-height:22px;","color:#000000;","}","#lb_tip_close_#tipId#{","background-position:-66px 0;","position:absolute;","top:0;","right:8px;","cursor:pointer;","font-weight:bold;","font-family:SimSun,sans-serif;","cursor:pointer;","line-height:35px;","}","#lb_tip_close_#tipId#:hover{","background-position:-66px -9px;","}","#lb_tip_close_#tipId#:active{","background-position:-66px -18px;","}","#lb_tip_button_#tipId# {","border:1px solid #B2B2B2;","background-color:#FEFEFE;","background-image:-webkit-linear-gradient(top,#FEFEFE,#E1E1E1);","color:#000000;","width:63px;","height:22px;","cursor:pointer;","border-radius:3px;","font-size:12px;","font-family:'微软雅黑','宋体';","}","#lb_tip_button_#tipId#:hover {","border:1px solid #C58201;","background-color:#F5A101;","background-image:-webkit-linear-gradient(top,#F5A101,#E17C05);","color:#FFFFFF;","}","#lb_tip_button_#tipId#:active {","border:1px solid #B46404;background-color:#E27D05;","background-image:-webkit-linear-gradient(top,#E27D05,#F09702);","color:#FFFFFF;","}","#lb_tip_poweredBy_#tipId#{","position:absolute;","bottom:0;","right:0;","font-family:'Arial';","font-size:10px;","color:rgba(0,0,0,.45);","font-style:italic;","}","#lb_tip_poweredBy_#tipId# a{","color:rgba(0,0,0,.45);","text-decoration:none;","line-height:33px;","}","#lb_tip_poweredBy_#tipId# a:hover{","text-decoration:underline;","}","#lb_tip_header_#tipId#{","height:35px;","background-color:#FFF5E6;","color:#F2951F;","padding-left:12px;","line-height:35px;","font-size:12px;","cursor:move;","}","#lb_tip_setting_#tipId#{","cursor:pointer;","text-decoration:underline;","color:rgba(0,0,0,.57);","display:inline;","font-weight:normal;","line-height:33px;","}","#lb_tip_search_#tipId#{","position:absolute;","top:0px;","left:0px;","width:65px;","height:24px;","}","#lb_tip_footer_#tipId#{","border-top:1px solid #E4E4E4;","height:33px;","margin:0 12px;","position:relative;","}",".lb_dic_pronounces_#tipId#{","line-height:13px;","}","lb_dic_ipa_#tipId#{",'font-family:"Arial Unicode MS","Lucida Sans Unicode";',"}",".lb_dic_sound_#tipId#{",v||x?"":"height: 13px;width: 15px;vertical-align: top;display: inline-block;","}",".lb_dic_details_#tipId#{","cursor:pointer;","text-decoration:underline;","color:#28c;","}","#lb_tip_menu_#tipId#{","position:absolute;","width:100px;","background:#f00;","background-color:#FCFCFC;",'font-family:"微软雅黑","宋体",simhei,simsun,sans-serif;',"font-size:12px;","border:1px solid #B8B8B8;","border-radius:4px;","box-shadow:0 5px 16px rgba(0,0,0,.45);","font-weight:normal;","}",".lb_tip_menu_item_#tipId#{","cursor:pointer;","}",".lb_tip_menu_item_#tipId#:hover{","background:#0F0;","}"],e=['<div id="lb_tip_#tipId#">','<div id="lb_tip_header_#tipId#">','<span style="line-height:35px !important;color:#F2951F;"></span>','<div id="lb_tip_close_#tipId#">×</div>',"</div>",'<div id="lb_tip_article_#tipId#"></div>','<div id="lb_tip_footer_#tipId#">','<label id="lb_tip_setting_#tipId#">关闭划词翻译</label>','<div id="lb_tip_poweredBy_#tipId#"></div>',"</div>",'<div id="lb_tip_search_#tipId#" style="display:none">',"</div>",'<div id="lb_tip_menu_#tipId#" style="display:none">','<div id="lb_tip_menu_copy_#tipId#" class="lb_tip_menu_item_#tipId#">复制</div>','<div id="lb_tip_menu_copyAll_#tipId#" class="lb_tip_menu_item_#tipId#">复制全部</div>',"</div>","</div>",'<input id="lb_tip_button_#tipId#" style="left:auto;right:auto;top:auto;bottom:auto" type="button" value="翻译" />'].join("").replace(/#tipId#/g,F),r=t.join("").replace(/#tipId#/g,F).replace(/;/g," !important;"),a=[],l="";function p(t){a.push(t)}E.setAttribute("_lego","translate"),E.innerHTML=e,k.extend(E.style,{position:"absolute",display:"none",margin:0,padding:0,border:"none",textAlign:"left",zIndex:999999,overflow:"visible"});var d=E.webkitCreateShadowRoot,s=!1;C=function(){if(!s){var t,n,e;s=!0,I=d?((t=B.createElement("div")).style.cssText=["width:0","height:0","padding:0","margin:0","z-index:9999999999",""].join(" !important;"),(n=t.webkitCreateShadowRoot()).resetStyleInheritance=!0,(e=B.createElement("style")).textContent=r,n.appendChild(e),p(function(t){var e=B.createElement("style");e.textContent=t,n.appendChild(e)}),n.appendChild(E),B.body.appendChild(t),t):(M.addCss(r),v||x||p(function(t){M.addCss(t)}),B.body.appendChild(E),E),chrome.lego.getFile("images/sound.png",function(i){chrome.lego.getFile("images/sound_on.png",function(t){l=".lb_dic_sound_"+F+'{background: url("'+i+'") no-repeat;}.lb_dic_sound_'+F+':hover{background: url("'+t+'") no-repeat;}';for(var e=a.length,n=0;n<e;++n)a[n](l);a.length=0})});var i=B.createElement("div");i.innerHTML='<script>var _kds2_p = 2367;<\/script><script src="http://goto.www.iciba.com/kds2/kds2_record.js" type="text/javascript" charset="utf-8"><\/script><noscript><img width="0" height="0" src="http://counter.kds.iciba.com/ds2rd.php?p=2367" style="border:none"></noscript>';for(var o=i.childNodes.length-1;0<=o;o--)B.head.appendChild(i.childNodes[o])}}}();var S={};!function(){var t=M(E),e=M("#lb_tip_setting_"+F,E),n=M("#lb_tip_header_"+F,E),i=M("#lb_tip_close_"+F,E);M("#lb_tip_"+F,E),M("#lb_tip_menu_"+F,E),M("#lb_tip_menu_copy_"+F,E),M("#lb_tip_menu_copyAll_"+F,E),M("#lb_tip_article_"+F,E);function o(t){S.start&&k.extend(E.style,{left:S.left+t.pageX-S.x+"px",top:S.top+t.pageY-S.y+"px"})}t.on("mousedown",function(t){return!1}),t.on("mouseup",function(t){return!1});var r=M(B);n.on("mousedown",function(t){S.start=!0,S.x=t.pageX,S.y=t.pageY,S.top=parseInt(E.style.top,10),S.left=parseInt(E.style.left,10),r.on("mousemove",o)}),n.on("mouseup",function(t){S.start=!1,r.off("mousemove",o)}),i.on("click",function(t){k.hide(E),T(13,{value:1})}),e.on("click",function(t){k.settings.set({openSelected:!1},function(t){y=t.openSelected,k.hide(E)}),T(13,{value:2})}),t.on("click",".lb_dic_details_"+F,function(t){var e=t.target.getAttribute("query");chrome.runtime.sendMessage({type:"showDetails",query:e}),T(13,{value:3})})}();var A=k.XSSSafe;!function(){var e=!1,_=M("#lb_tip_button_"+F,E),g=M("#lb_tip_"+F,E),h=M("#lb_tip_header_"+F,E),f=M("#lb_tip_article_"+F,E),b=M("#lb_tip_poweredBy_"+F,E);var n,i={};function o(){var t=i.url;if(t){var e=99;switch(i.ph){case"ph_en":e=4;break;case"ph_am":e=5}T(13,{value:e}),chrome.runtime.sendMessage({type:"play",key:i.key,url:t},function(t){i.url=""})}}f.on("mouseover",".lb_dic_sound_"+F,function(t){var e=t.target.getAttribute("sound");e&&i.url!==e&&(chrome.lego.clearTimeout(n),i.url=e,i.ph=t.target.getAttribute("ph"),i.key=t.target.getAttribute("key"),n=chrome.lego.setTimeout(o,500))});var m=0;w=function(d){var s,c=d.pageX,u=d.pageY;e&&(s=r())&&!/^(www\.|http:\/\/|https:\/\/|ftp:\/\/)/.test(s)&&(k.hide(E),k.settings.get(function(t){var o,e,r,n,i,a,l,p;!0===t.openSelected&&(C(),o=function(){var t,e,n,i=B.body,o=getComputedStyle(B.body);n=window.getComputedStyle?(e=parseInt(o.marginLeft,10)||0,parseInt(o.marginTop,10)||0):(e=(t=i.getBoundingClientRect()).left+B.documentElement.scrollLeft,t.top+B.documentElement.scrollTop);var r=i.clientWidth,a=i.clientHeight;return{left:e,top:n,right:e+r,bottom:n+a,width:r,height:a}}(),I.parentNode!==B.body&&B.body.appendChild(I),y?(e=A(s),k.text(h[0].getElementsByTagName("span")[0],k.cutString(e,30)),b.html(""),g[0].style.width="500px",i=c+10-(v?0:o.left),r=(a=u+18-(v?0:o.top))+50+100>o.height?a-40-100:a,n=Math.min(i,o.width-530),k.extend(E.style,{left:n+"px",top:r+"px"}),k.show(E),l=++m,p=!1,f.html("正在查询中..."),setTimeout(function(){l!==m||p||g.show()},500),k.query(s,function(t){var e,n,i;l===m&&(p=!0,f.html((e=s,null===(n=t.result)?"无释义":!1===n?"请求错误":"string"==typeof n?A(n):n.symbols?n.symbols.map(function(n){if(n.net_means&&n.net_means.length)return"【网络释义】"+n.net_means.join("; ");var i="";return["ph_am","ph_en"].forEach(function(t){var e;(e=n.pronounces[t])&&e.text&&(i+="ph_am"===t?"[美] ":"[英] ",i+='[<span class="lb_dic_ipa_'+F+'">'+A(e.text)+"</span>]",e.sound&&(i+='&emsp;<span style="display:none !important;" class="lb_dic_sound_'+F+'" ph="'+t+'" key="'+t+"_"+A(e.text)+'" sound="'+A(e.sound)+'">'+(v||x?"[音]":"")+"</span>&emsp;"))}),(i='<div class="lb_dic_pronounces_'+F+'">'+i+"</div>")+"<div>"+n.parts.map(function(t){return(t.part?A(t.part)+" ":"")+t.means.map(function(t){return A(t)}).join("; ")}).join("<br />")}).join("<br />")+'<br /><span class="lb_dic_details_'+F+'" query="'+A(e.replace(/\s+/g,"_"))+'" target="_blank">详细释义》</span></div>':"其他错误")),g.show(),t.poweredBy&&b.html("powered by "+t.poweredBy),i=g[0].scrollHeight,r!==a?k.extend(E.style,{top:r-i+100+"px"}):r+50+i>o.height&&k.extend(E.style,{top:a-40-i+"px"}),[].forEach.call(f.find(".lb_dic_sound_"+F),function(e){var t=e.getAttribute("sound");t&&chrome.runtime.sendMessage({type:"isPlayable",key:e.getAttribute("key"),url:t},function(t){t&&(e.style.display="")})}))})):(g.hide(),_.show(),i=c+10-(v?0:o.left),a=u-40-(v?0:o.top),k.extend(E.style,{left:Math.min(i,o.right-50)+"px",top:a+"px"}),k.show(E),_.off().on("click",function(){y=!0,w(d),_.hide(),_.off(),console.log("click",_[0],_[0].style.display)}).on("mousedown",function(t){t.stopPropagation()}).on("mouseup",function(t){t.stopPropagation()})))}))},p=function(){e=!1},d=function(t){S.start=!1,k.hide(E),e=!0,chrome.lego.setTimeout(function(){w(t)},50)}}(),t(B,"mousedown",p),kQuery(B).on("mouseup",d)})))}(document);
