<!DOCTYPE html><html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN"><head>
    <style>.login-box{position: fixed;display: none;left: 50%;top: 50%;z-index: 10000;-webkit-transform: translate(-50%, -50%);-ms-transform: translate(-50%, -50%);-o-transform: translate(-50%, -50%);-moz-transform: translate(-50%, -50%);transform: translate(-50%, -50%);background-color: #fff;}.login-mark{position: fixed;top: 0;left: 0;z-index: 9999;background-color: rgba(0, 0, 0, 0.5);width: 100%;height: 100%;display: none;}</style><meta charset="utf-8" />
    <link rel="canonical" href="https://blog.csdn.net/soilwork/article/details/1452437" />
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="renderer" content="webkit" />
    <meta name="force-rendering" content="webkit" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="report" content="{&quot;pid&quot;: &quot;blog&quot;, &quot;spm&quot;:&quot;1001.2101&quot;}" />
    <meta name="referrer" content="always" />
    <meta http-equiv="Cache-Control" content="no-siteapp" /><link rel="alternate" media="handheld" href="#" />
    <meta name="shenma-site-verification" content="5a59773ab8077d4a62bf469ab966a63b_1497598848" />
    <meta name="applicable-device" content="pc" />
    <link href="https://g.csdnimg.cn/static/logo/favicon32.ico" rel="shortcut icon" type="image/x-icon" />
    <title>Parallax Mapping_Clayman的专栏-CSDN博客</title>
    <script src="https://pagead2.googlesyndication.com/pagead/js/r20201203/r20190131/reactive_library_fy2019.js"></script><script src="https://www.googletagservices.com/activeview/js/current/osd.js?cb=%2Fr20100101"></script><script src="https://partner.googleadservices.com/gampad/cookie.js?domain=blog.csdn.net&amp;callback=_gfp_s_&amp;client=ca-pub-1076724771190722&amp;cookie=ID%3Dabae74b1af113cf7-2284b68a8cc5007c%3AT%3D1609924037%3ART%3D1609924037%3AS%3DALNI_MbISe9R06kOQTXvnUNRCBezpAp3bA"></script><script type="text/javascript" async="" src="https://pos.baidu.com/auto_dup?psi=6c1ea830d6cf902e8879b3801e1b75e8&amp;di=0&amp;dri=0&amp;dis=0&amp;dai=0&amp;ps=0x0&amp;enu=encoding&amp;exps=110011&amp;ant=0&amp;dcb=___baidu_union_callback&amp;dtm=AUTO_JSONP&amp;dvi=0.0&amp;dci=-1&amp;dpt=none&amp;tsr=0&amp;tpr=1609934090618&amp;ti=Parallax%20Mapping_Clayman%E7%9A%84%E4%B8%93%E6%A0%8F-CSDN%E5%8D%9A%E5%AE%A2&amp;ari=2&amp;ver=0105&amp;dbv=2&amp;drs=1&amp;pcs=929x932&amp;pss=929x932&amp;cfv=0&amp;cpl=3&amp;chi=2&amp;cce=true&amp;cec=UTF-8&amp;tlm=1609934090&amp;prot=2&amp;rw=929&amp;ltu=https%3A%2F%2Fblog.csdn.net%2Fsoilwork%2Farticle%2Fdetails%2F1452437&amp;ecd=1&amp;uc=1920x1040&amp;pis=-1x-1&amp;sr=1920x1080&amp;tcn=1609934091&amp;dc=4"></script><script type="text/javascript" charset="utf-8" async="" src="https://gsp0.baidu.com/yrwHcjSl0MgCo2Kml5_Y_D3/api/customsearch/apiaccept?sid=10742016945123576423&amp;v=2.0&amp;callback=csdn.afterBaiduSearchInit"></script><script type="text/javascript" async="" src="https://g.csdnimg.cn/user-login/2.3.1/js/??toast.script.js"></script><script src="https://pagead2.googlesyndication.com/pagead/js/r20201203/r20190131/show_ads_impl_fy2019.js" id="google_shimpl"></script><script src="https://zz.bdstatic.com/linksubmit/push.js"></script><script type="text/javascript" async="" src="https://g.csdnimg.cn/??asdf/1.1.3/trackad.js,iconfont/nav/iconfont-1.0.1.js,notification/1.3.8/notify.js,notification/1.3.8/main.js"></script><script src="https://hm.baidu.com/hm.js?6bcd52f51e9b3dce32bec4a3997715ac"></script><script src="https://s3a.pstatp.com/toutiao/push.js?1abfa13dfe74d72d41d83c86d240de427e7cac50c51ead53b2e79d40c7952a23ed7716d05b4a0f683a653eab3e214672511de2457e74e99286eb2c33f4428830" id="ttzz"></script><script>
      (function(){ 
        var el = document.createElement("script"); 
        el.src = "https://s3a.pstatp.com/toutiao/push.js?1abfa13dfe74d72d41d83c86d240de427e7cac50c51ead53b2e79d40c7952a23ed7716d05b4a0f683a653eab3e214672511de2457e74e99286eb2c33f4428830"; 
        el.id = "ttzz"; 
        var s = document.getElementsByTagName("script")[0]; 
        s.parentNode.insertBefore(el, s);
      })(window)
    </script>
        <meta name="keywords" content="Parallax Mapping" />
        <meta name="csdn-baidu-search" content="{&quot;autorun&quot;:true,&quot;install&quot;:true,&quot;keyword&quot;:&quot;Parallax Mapping&quot;}" />
    <meta name="description" content="请勿转载.claymanBlog：http://blog.csdn.net/soilworkclayman_joe@yahoo.com.cn       作为实现bump map的技术之一，Parallax Mapping（视差映射）的目的同样也是让平坦表面实现凹凸效果。和Normal Mapping相比，Parallax Mapping能实现更加真实和强烈的凹凸感。" />
    <script src="//g.csdnimg.cn/tingyun/1.8.3/blog.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="https://csdnimg.cn/release/blogv2/dist/pc/css/detail_enter-c1df374c89.min.css" />
    <script type="application/ld+json">{"@context":"https://ziyuan.baidu.com/contexts/cambrian.jsonld","@id":"https://blog.csdn.net/soilwork/article/details/1452437","appid":"1638831770136827","pubDate":"2006-12-22T01:48:00","title":"Parallax Mapping_Clayman的专栏-CSDN博客","upDate":"2006-12-22T01:48:00"}</script>
        <link rel="stylesheet" type="text/css" href="https://csdnimg.cn/release/blogv2/dist/pc/themesSkin/skin3-template/skin3-template-45808e735f.min.css" />
    <script src="https://csdnimg.cn/public/common/libs/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        var isCorporate = false;//注释删除enterprise
        var username =  "soilwork";
        var skinImg = "white";
        var blog_address = "https://blog.csdn.net/soilwork";
        var currentUserName = "";
        var isOwner = false;
        var loginUrl = "http://passport.csdn.net/account/login?from=https://blog.csdn.net/soilwork/article/details/1452437";
        var blogUrl = "https://blog.csdn.net/";
        var avatar = "https://profile.csdnimg.cn/7/D/F/3_soilwork";
        var articleTitle = "Parallax Mapping";
        var articleDesc = "请勿转载.claymanBlog：http://blog.csdn.net/soilworkclayman_joe@yahoo.com.cn       作为实现bump map的技术之一，Parallax Mapping（视差映射）的目的同样也是让平坦表面实现凹凸效果。和Normal Mapping相比，Parallax Mapping能实现更加真实和强烈的凹凸感。";
        var articleTitles = "Parallax Mapping_Clayman的专栏-CSDN博客";
        var nickName = "soilwork";
        var articleDetailUrl = "https://blog.csdn.net/soilwork/article/details/1452437";
        if(window.location.host.split('.').length == 3) {
            blog_address = blogUrl + username;
        }
        var skinStatus = "White";
        var blogStaticHost = "https://csdnimg.cn/release/blogv2/"
    </script>
    <script src="https://g.csdnimg.cn/??fixed-sidebar/1.1.6/fixed-sidebar.js" type="text/javascript"></script>
    <script src="//g.csdnimg.cn/common/csdn-report/report.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="https://csdnimg.cn/public/sandalstrap/1.4/css/sandalstrap.min.css" />
    <style>
        .MathJax, .MathJax_Message, .MathJax_Preview{
            display: none
        }
    </style>
    <script src="https://dup.baidustatic.com/js/ds.js"></script>
<link rel="stylesheet" type="text/css" href="https://g.csdnimg.cn/common/csdn-toolbar/csdn-toolbar-default.css" /><script type="text/javascript" src="https://csdnimg.cn/search/baidu_opensug-1.0.1.js"></script><link rel="stylesheet" type="text/css" href="https://g.csdnimg.cn/collection-box/2.0.3/collection-box.css" /><script type="text/javascript" src="https://g.csdnimg.cn/user-login/2.3.2/user-login.js"></script><style type="text/css"></style><style type="text/css"></style><style type="text/css"></style><style type="text/css"></style><style type="text/css"></style><style type="text/css"></style><style type="text/css"></style><style type="text/css"></style><style type="text/css"></style><style type="text/css"></style><style type="text/css"></style><meta http-equiv="origin-trial" content="A1H+PzQW00tt6dlReHFzfO4EtBaEtEImIF9ZNiF54JpDi1bO6/7PK96Q0qxy017wgzSy9ByDKoju2mo57DH+MwoAAAB7eyJvcmlnaW4iOiJodHRwczovL2RvdWJsZWNsaWNrLm5ldDo0NDMiLCJmZWF0dXJlIjoiVHJ1c3RUb2tlbnMiLCJleHBpcnkiOjE2MTAzOTg0NTIsImlzU3ViZG9tYWluIjp0cnVlLCJpc1RoaXJkUGFydHkiOnRydWV9" /><link rel="stylesheet" type="text/css" href="https://g.csdnimg.cn/user-login/2.3.1/css/??index.css,toast.style.css" /><link rel="stylesheet" type="text/css" href="https://g.csdnimg.cn/user-tooltip/2.4/user-tooltip.css" /><link rel="stylesheet" type="text/css" href="//g.csdnimg.cn/user-medal/1.0.6/user-medal.css" /><meta http-equiv="origin-trial" content="A1H+PzQW00tt6dlReHFzfO4EtBaEtEImIF9ZNiF54JpDi1bO6/7PK96Q0qxy017wgzSy9ByDKoju2mo57DH+MwoAAAB7eyJvcmlnaW4iOiJodHRwczovL2RvdWJsZWNsaWNrLm5ldDo0NDMiLCJmZWF0dXJlIjoiVHJ1c3RUb2tlbnMiLCJleHBpcnkiOjE2MTAzOTg0NTIsImlzU3ViZG9tYWluIjp0cnVlLCJpc1RoaXJkUGFydHkiOnRydWV9" /><meta http-equiv="origin-trial" content="A1H+PzQW00tt6dlReHFzfO4EtBaEtEImIF9ZNiF54JpDi1bO6/7PK96Q0qxy017wgzSy9ByDKoju2mo57DH+MwoAAAB7eyJvcmlnaW4iOiJodHRwczovL2RvdWJsZWNsaWNrLm5ldDo0NDMiLCJmZWF0dXJlIjoiVHJ1c3RUb2tlbnMiLCJleHBpcnkiOjE2MTAzOTg0NTIsImlzU3ViZG9tYWluIjp0cnVlLCJpc1RoaXJkUGFydHkiOnRydWV9" /><style type="text/css">pre{position: relative}pre:hover .hljs-button{display: block}.hljs-button{display: none;position: absolute;right: 4px;top: 4px;font-size: 12px;color: #4d4d4d;background-color: white;padding: 2px 8px;margin: 8px;border-radius: 4px;cursor: pointer; box-shadow: 0 2px 4px rgba(0,0,0,0.05), 0 2px 4px rgba(0,0,0,0.05);}.hljs-button:after{content: attr(data-title)}code .hljs-button{margin: 2px 8px;}</style><style type="text/css">.hljs-ln{border-collapse:collapse}            .hljs-ln td{padding:0}            .hljs-ln-n{text-align: right;padding-right: 8px;}            .hljs-ln-n:before{content:attr(data-line-number)}</style><link rel="stylesheet" type="text/css" href="https://g.csdnimg.cn/side-toolbar/2.8/side-toolbar.css" /><link rel="stylesheet" type="text/css" href="//g.csdnimg.cn/common/csdn-footer/csdn-footer.css" /><link rel="preload" href="https://adservice.google.com/adsid/integrator.js?domain=blog.csdn.net" as="script" /><script type="text/javascript" src="https://adservice.google.com/adsid/integrator.js?domain=blog.csdn.net"></script><style type="text/css">.MathJax_Hover_Frame {border-radius: .25em; -webkit-border-radius: .25em; -moz-border-radius: .25em; -khtml-border-radius: .25em; box-shadow: 0px 0px 15px #83A; -webkit-box-shadow: 0px 0px 15px #83A; -moz-box-shadow: 0px 0px 15px #83A; -khtml-box-shadow: 0px 0px 15px #83A; border: 1px solid #A6D ! important; display: inline-block; position: absolute}
.MathJax_Menu_Button .MathJax_Hover_Arrow {position: absolute; cursor: pointer; display: inline-block; border: 2px solid #AAA; border-radius: 4px; -webkit-border-radius: 4px; -moz-border-radius: 4px; -khtml-border-radius: 4px; font-family: 'Courier New',Courier; font-size: 9px; color: #F0F0F0}
.MathJax_Menu_Button .MathJax_Hover_Arrow span {display: block; background-color: #AAA; border: 1px solid; border-radius: 3px; line-height: 0; padding: 4px}
.MathJax_Hover_Arrow:hover {color: white!important; border: 2px solid #CCC!important}
.MathJax_Hover_Arrow:hover span {background-color: #CCC!important}
</style><style type="text/css">#MathJax_About {position: fixed; left: 50%; width: auto; text-align: center; border: 3px outset; padding: 1em 2em; background-color: #DDDDDD; color: black; cursor: default; font-family: message-box; font-size: 120%; font-style: normal; text-indent: 0; text-transform: none; line-height: normal; letter-spacing: normal; word-spacing: normal; word-wrap: normal; white-space: nowrap; float: none; z-index: 201; border-radius: 15px; -webkit-border-radius: 15px; -moz-border-radius: 15px; -khtml-border-radius: 15px; box-shadow: 0px 10px 20px #808080; -webkit-box-shadow: 0px 10px 20px #808080; -moz-box-shadow: 0px 10px 20px #808080; -khtml-box-shadow: 0px 10px 20px #808080; filter: progid:DXImageTransform.Microsoft.dropshadow(OffX=2, OffY=2, Color='gray', Positive='true')}
#MathJax_About.MathJax_MousePost {outline: none}
.MathJax_Menu {position: absolute; background-color: white; color: black; width: auto; padding: 2px; border: 1px solid #CCCCCC; margin: 0; cursor: default; font: menu; text-align: left; text-indent: 0; text-transform: none; line-height: normal; letter-spacing: normal; word-spacing: normal; word-wrap: normal; white-space: nowrap; float: none; z-index: 201; box-shadow: 0px 10px 20px #808080; -webkit-box-shadow: 0px 10px 20px #808080; -moz-box-shadow: 0px 10px 20px #808080; -khtml-box-shadow: 0px 10px 20px #808080; filter: progid:DXImageTransform.Microsoft.dropshadow(OffX=2, OffY=2, Color='gray', Positive='true')}
.MathJax_MenuItem {padding: 2px 2em; background: transparent}
.MathJax_MenuArrow {position: absolute; right: .5em; padding-top: .25em; color: #666666; font-size: .75em}
.MathJax_MenuActive .MathJax_MenuArrow {color: white}
.MathJax_MenuArrow.RTL {left: .5em; right: auto}
.MathJax_MenuCheck {position: absolute; left: .7em}
.MathJax_MenuCheck.RTL {right: .7em; left: auto}
.MathJax_MenuRadioCheck {position: absolute; left: 1em}
.MathJax_MenuRadioCheck.RTL {right: 1em; left: auto}
.MathJax_MenuLabel {padding: 2px 2em 4px 1.33em; font-style: italic}
.MathJax_MenuRule {border-top: 1px solid #CCCCCC; margin: 4px 1px 0px}
.MathJax_MenuDisabled {color: GrayText}
.MathJax_MenuActive {background-color: Highlight; color: HighlightText}
.MathJax_MenuDisabled:focus, .MathJax_MenuLabel:focus {background-color: #E8E8E8}
.MathJax_ContextMenu:focus {outline: none}
.MathJax_ContextMenu .MathJax_MenuItem:focus {outline: none}
#MathJax_AboutClose {top: .2em; right: .2em}
.MathJax_Menu .MathJax_MenuClose {top: -10px; left: -10px}
.MathJax_MenuClose {position: absolute; cursor: pointer; display: inline-block; border: 2px solid #AAA; border-radius: 18px; -webkit-border-radius: 18px; -moz-border-radius: 18px; -khtml-border-radius: 18px; font-family: 'Courier New',Courier; font-size: 24px; color: #F0F0F0}
.MathJax_MenuClose span {display: block; background-color: #AAA; border: 1.5px solid; border-radius: 18px; -webkit-border-radius: 18px; -moz-border-radius: 18px; -khtml-border-radius: 18px; line-height: 0; padding: 8px 0 6px}
.MathJax_MenuClose:hover {color: white!important; border: 2px solid #CCC!important}
.MathJax_MenuClose:hover span {background-color: #CCC!important}
.MathJax_MenuClose:hover:focus {outline: none}
</style><style type="text/css">.MathJax_Preview .MJXf-math {color: inherit!important}
</style><style type="text/css">.MJX_Assistive_MathML {position: absolute!important; top: 0; left: 0; clip: rect(1px, 1px, 1px, 1px); padding: 1px 0 0 0!important; border: 0!important; height: 1px!important; width: 1px!important; overflow: hidden!important; display: block!important; -webkit-touch-callout: none; -webkit-user-select: none; -khtml-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none}
.MJX_Assistive_MathML.MJX_Assistive_MathML_Block {width: 100%!important}
</style><style type="text/css">#MathJax_Zoom {position: absolute; background-color: #F0F0F0; overflow: auto; display: block; z-index: 301; padding: .5em; border: 1px solid black; margin: 0; font-weight: normal; font-style: normal; text-align: left; text-indent: 0; text-transform: none; line-height: normal; letter-spacing: normal; word-spacing: normal; word-wrap: normal; white-space: nowrap; float: none; -webkit-box-sizing: content-box; -moz-box-sizing: content-box; box-sizing: content-box; box-shadow: 5px 5px 15px #AAAAAA; -webkit-box-shadow: 5px 5px 15px #AAAAAA; -moz-box-shadow: 5px 5px 15px #AAAAAA; -khtml-box-shadow: 5px 5px 15px #AAAAAA; filter: progid:DXImageTransform.Microsoft.dropshadow(OffX=2, OffY=2, Color='gray', Positive='true')}
#MathJax_ZoomOverlay {position: absolute; left: 0; top: 0; z-index: 300; display: inline-block; width: 100%; height: 100%; border: 0; padding: 0; margin: 0; background-color: white; opacity: 0; filter: alpha(opacity=0)}
#MathJax_ZoomFrame {position: relative; display: inline-block; height: 0; width: 0}
#MathJax_ZoomEventTrap {position: absolute; left: 0; top: 0; z-index: 302; display: inline-block; border: 0; padding: 0; margin: 0; background-color: white; opacity: 0; filter: alpha(opacity=0)}
</style><style type="text/css">.MathJax_Preview {color: #888}
#MathJax_Message {position: fixed; left: 1em; bottom: 1.5em; background-color: #E6E6E6; border: 1px solid #959595; margin: 0px; padding: 2px 8px; z-index: 102; color: black; font-size: 80%; width: auto; white-space: nowrap}
#MathJax_MSIE_Frame {position: absolute; top: 0; left: 0; width: 0px; z-index: 101; border: 0px; margin: 0px; padding: 0px}
.MathJax_Error {color: #CC0000; font-style: italic}
</style><style type="text/css">.MJXp-script {font-size: .8em}
.MJXp-right {-webkit-transform-origin: right; -moz-transform-origin: right; -ms-transform-origin: right; -o-transform-origin: right; transform-origin: right}
.MJXp-bold {font-weight: bold}
.MJXp-italic {font-style: italic}
.MJXp-scr {font-family: MathJax_Script,'Times New Roman',Times,STIXGeneral,serif}
.MJXp-frak {font-family: MathJax_Fraktur,'Times New Roman',Times,STIXGeneral,serif}
.MJXp-sf {font-family: MathJax_SansSerif,'Times New Roman',Times,STIXGeneral,serif}
.MJXp-cal {font-family: MathJax_Caligraphic,'Times New Roman',Times,STIXGeneral,serif}
.MJXp-mono {font-family: MathJax_Typewriter,'Times New Roman',Times,STIXGeneral,serif}
.MJXp-largeop {font-size: 150%}
.MJXp-largeop.MJXp-int {vertical-align: -.2em}
.MJXp-math {display: inline-block; line-height: 1.2; text-indent: 0; font-family: 'Times New Roman',Times,STIXGeneral,serif; white-space: nowrap; border-collapse: collapse}
.MJXp-display {display: block; text-align: center; margin: 1em 0}
.MJXp-math span {display: inline-block}
.MJXp-box {display: block!important; text-align: center}
.MJXp-box:after {content: " "}
.MJXp-rule {display: block!important; margin-top: .1em}
.MJXp-char {display: block!important}
.MJXp-mo {margin: 0 .15em}
.MJXp-mfrac {margin: 0 .125em; vertical-align: .25em}
.MJXp-denom {display: inline-table!important; width: 100%}
.MJXp-denom &gt; * {display: table-row!important}
.MJXp-surd {vertical-align: top}
.MJXp-surd &gt; * {display: block!important}
.MJXp-script-box &gt; *  {display: table!important; height: 50%}
.MJXp-script-box &gt; * &gt; * {display: table-cell!important; vertical-align: top}
.MJXp-script-box &gt; *:last-child &gt; * {vertical-align: bottom}
.MJXp-script-box &gt; * &gt; * &gt; * {display: block!important}
.MJXp-mphantom {visibility: hidden}
.MJXp-munderover {display: inline-table!important}
.MJXp-over {display: inline-block!important; text-align: center}
.MJXp-over &gt; * {display: block!important}
.MJXp-munderover &gt; * {display: table-row!important}
.MJXp-mtable {vertical-align: .25em; margin: 0 .125em}
.MJXp-mtable &gt; * {display: inline-table!important; vertical-align: middle}
.MJXp-mtr {display: table-row!important}
.MJXp-mtd {display: table-cell!important; text-align: center; padding: .5em 0 0 .5em}
.MJXp-mtr &gt; .MJXp-mtd:first-child {padding-left: 0}
.MJXp-mtr:first-child &gt; .MJXp-mtd {padding-top: 0}
.MJXp-mlabeledtr {display: table-row!important}
.MJXp-mlabeledtr &gt; .MJXp-mtd:first-child {padding-left: 0}
.MJXp-mlabeledtr:first-child &gt; .MJXp-mtd {padding-top: 0}
.MJXp-merror {background-color: #FFFF88; color: #CC0000; border: 1px solid #CC0000; padding: 1px 3px; font-style: normal; font-size: 90%}
.MJXp-scale0 {-webkit-transform: scaleX(.0); -moz-transform: scaleX(.0); -ms-transform: scaleX(.0); -o-transform: scaleX(.0); transform: scaleX(.0)}
.MJXp-scale1 {-webkit-transform: scaleX(.1); -moz-transform: scaleX(.1); -ms-transform: scaleX(.1); -o-transform: scaleX(.1); transform: scaleX(.1)}
.MJXp-scale2 {-webkit-transform: scaleX(.2); -moz-transform: scaleX(.2); -ms-transform: scaleX(.2); -o-transform: scaleX(.2); transform: scaleX(.2)}
.MJXp-scale3 {-webkit-transform: scaleX(.3); -moz-transform: scaleX(.3); -ms-transform: scaleX(.3); -o-transform: scaleX(.3); transform: scaleX(.3)}
.MJXp-scale4 {-webkit-transform: scaleX(.4); -moz-transform: scaleX(.4); -ms-transform: scaleX(.4); -o-transform: scaleX(.4); transform: scaleX(.4)}
.MJXp-scale5 {-webkit-transform: scaleX(.5); -moz-transform: scaleX(.5); -ms-transform: scaleX(.5); -o-transform: scaleX(.5); transform: scaleX(.5)}
.MJXp-scale6 {-webkit-transform: scaleX(.6); -moz-transform: scaleX(.6); -ms-transform: scaleX(.6); -o-transform: scaleX(.6); transform: scaleX(.6)}
.MJXp-scale7 {-webkit-transform: scaleX(.7); -moz-transform: scaleX(.7); -ms-transform: scaleX(.7); -o-transform: scaleX(.7); transform: scaleX(.7)}
.MJXp-scale8 {-webkit-transform: scaleX(.8); -moz-transform: scaleX(.8); -ms-transform: scaleX(.8); -o-transform: scaleX(.8); transform: scaleX(.8)}
.MJXp-scale9 {-webkit-transform: scaleX(.9); -moz-transform: scaleX(.9); -ms-transform: scaleX(.9); -o-transform: scaleX(.9); transform: scaleX(.9)}
.MathJax_PHTML .noError {vertical-align: ; font-size: 90%; text-align: left; color: black; padding: 1px 3px; border: 1px solid}
</style></head>
<body class="nodata " style="" aria-hidden="false"><div id="BAIDU_DUP_fp_wrapper" style="position: absolute; left: -1px; bottom: -1px; z-index: 0; width: 0px; height: 0px; overflow: hidden; visibility: hidden; display: none;"><iframe id="BAIDU_DUP_fp_iframe" src="https://pos.baidu.com/wh/o.htm?ltr=" style="width: 0px; height: 0px; visibility: hidden; display: none;"></iframe></div><div id="MathJax_Message" style="display: none;"></div><div id="csdn-toolbar">
                    <div class="toolbar-inside">
                      <div class="toolbar-container">
                        <div class="toolbar-container-left">
                          <div class="toolbar-logo toolbar-subMenu-box csdn-toolbar-fl"><a data-report-click="{&quot;spm&quot;:&quot;3001.4476&quot;}" data-report-query="spm=3001.4476" href="https://www.csdn.net/"><img title="CSDN首页" src="https://img-home.csdnimg.cn/images/20201124032511.png" /></a>
                    <div class="toolbar-subMenu">
                    <img width="96" height="96" src="https://img-home.csdnimg.cn/images/20201120101655.png" />
                  </div></div>
                          <ul class="toolbar-menus csdn-toolbar-fl"><li class="">
                                <a data-report-click="{&quot;mod&quot;:&quot;popu_336&quot;,&quot;dest&quot;:&quot;https://www.csdn.net/&quot;,&quot;spm&quot;:&quot;3001.5359&quot;}" data-report-query="spm=3001.5359" href="https://www.csdn.net/">
                                  首页
                                  
                                </a>
                                
                              </li><li class="active ">
                                <a data-report-click="{&quot;mod&quot;:&quot;popu_336&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/&quot;,&quot;spm&quot;:&quot;3001.4477&quot;}" data-report-query="spm=3001.4477" href="https://blog.csdn.net/">
                                  博客
                                  
                                </a>
                                
                              </li><li class="">
                                <a data-report-click="{&quot;mod&quot;:&quot;popu_336&quot;,&quot;dest&quot;:&quot;https://edu.csdn.net/&quot;,&quot;spm&quot;:&quot;3001.4482&quot;}" data-report-query="spm=3001.4482" href="https://edu.csdn.net/">
                                  程序员学院
                                  
                                </a>
                                
                              </li><li class="">
                                <a data-report-click="{&quot;mod&quot;:&quot;popu_336&quot;,&quot;dest&quot;:&quot;https://download.csdn.net/&quot;,&quot;spm&quot;:&quot;3001.4483&quot;}" data-report-query="spm=3001.4483" href="https://download.csdn.net/">
                                  下载
                                  
                                </a>
                                
                              </li><li class="">
                                <a data-report-click="{&quot;mod&quot;:&quot;popu_336&quot;,&quot;dest&quot;:&quot;https://bbs.csdn.net/&quot;,&quot;spm&quot;:&quot;3001.4491&quot;}" data-report-query="spm=3001.4491" href="https://bbs.csdn.net/">
                                  论坛
                                  
                                </a>
                                
                              </li><li class="">
                                <a data-report-click="{&quot;mod&quot;:&quot;popu_336&quot;,&quot;dest&quot;:&quot;https://ask.csdn.net/&quot;,&quot;spm&quot;:&quot;3001.4492&quot;}" data-report-query="spm=3001.4492" href="https://ask.csdn.net/">
                                  问答
                                  
                                </a>
                                
                              </li><li class="">
                                <a data-report-click="{&quot;mod&quot;:&quot;popu_336&quot;,&quot;dest&quot;:&quot;https://codechina.csdn.net/?utm_source=csdn_toolbar&quot;,&quot;spm&quot;:&quot;3001.4493&quot;}" data-report-query="spm=3001.4493" href="https://codechina.csdn.net/?utm_source=csdn_toolbar">
                                  代码
                                  
                                </a>
                                
                              </li><li class="">
                                <a data-report-click="{&quot;mod&quot;:&quot;popu_336&quot;,&quot;dest&quot;:&quot;https://codechina.csdn.net/?utm_source=csdn_toolbar&quot;,&quot;spm&quot;:&quot;3001.5342&quot;}" data-report-query="spm=3001.5342" href="https://live.csdn.net/?utm_source=csdn_toolbar">
                                  直播
                                  
                                </a>
                                
                              </li><li class="">
                                <a data-report-click="{&quot;mod&quot;:&quot;popu_336&quot;,&quot;dest&quot;:&quot;https://book.csdn.net/&quot;,&quot;spm&quot;:&quot;3001.4495&quot;}" data-report-query="spm=3001.4495" href="https://book.csdn.net/">
                                  电子书
                                  
                                </a>
                                
                              </li></ul>
                        </div>
                        <div class="toolbar-container-middle">
                          <div class="toolbar-search onlySearch"><div class="toolbar-search-container">
                    <input id="toolbar-search-input" autocomplete="off" type="text" value="" placeholder="算法" />
                    <button id="toolbar-search-button"></button>
                    <input type="password" autocomplete="new-password" readonly="" disabled="true" style="display: none; position:absolute;left:-9999999px;width:0;height:0;" />
                  </div></div>
                        </div>
                        <div class="toolbar-container-right">
                          <div class="toolbar-btns onlyUser"><div class="toolbar-btn toolbar-btn-login csdn-toolbar-fl ">
                       <a data-report-click="{&quot;spm&quot;:&quot;3001.5105&quot;}" data-report-query="spm=3001.5105" href="https://passport.csdn.net/account/login">登录/注册</a>
                      </div>
                    <div class="toolbar-btn toolbar-btn-vip csdn-toolbar-fl">
                      <a data-report-click="{&quot;mod&quot;:&quot;popu_336&quot;,&quot;dest&quot;:&quot;https://mall.csdn.net/vip&quot;,&quot;spm&quot;:&quot;3001.4496&quot;}" data-report-query="spm=3001.4496" href="https://mall.csdn.net/vip">会员中心 </a>
                    </div>
                    <div class="toolbar-btn toolbar-btn-collect csdn-toolbar-fl">
                      <a data-report-click="{&quot;spm&quot;:&quot;3001.4506&quot;}" data-report-query="spm=3001.4506" href="https://i.csdn.net/#/uc/collection-list?type=1">收藏</a>
                    </div>
                    
                    <div class="toolbar-btn toolbar-btn-msg csdn-toolbar-fl">
                      <div class="toolbar-subMenu-box">
                        <a data-report-click="{&quot;spm&quot;:&quot;3001.4508&quot;}" data-report-query="spm=3001.4508" id="toolbar-remind" href="https://live.csdn.net/room/py_ai_326/9MUeZ9A7?utm_source=gonggao_1201">消息</a>
                      <div class="toolbar-subMenu">
                    <a id="toolbar-announcement" href="https://live.csdn.net/room/py_ai_326/9MUeZ9A7?utm_source=gonggao_1201">公告</a>
                         
                  </div></div>
                      <div class="toolbar-msg-box"></div>
                    </div>
                    <div class="toolbar-btn toolbar-btn-write csdn-toolbar-fl ">
                      <a data-report-click="{&quot;spm&quot;:&quot;3001.4503&quot;}" data-report-query="spm=3001.4503" href="https://mp.csdn.net"><i></i>创作中心</a>
                    </div></div>
                        </div>
                      </div>
                    </div>
                  </div>
        <script>
            var toolbarSearchExt = {"landingWord":[],"queryWord":"","tag":["算法","blog","生活"],"title":"Parallax Mapping"};
        </script>
    <script src="https://g.csdnimg.cn/common/csdn-toolbar/csdn-toolbar.js" type="text/javascript"></script>
    <script>
    (function(){
        var bp = document.createElement('script');
        var curProtocol = window.location.protocol.split(':')[0];
        if (curProtocol === 'https') {
            bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
        }
        else {
            bp.src = 'http://push.zhanzhang.baidu.com/push.js';
        }
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(bp, s);
    })();
    </script>
<link rel="stylesheet" href="https://csdnimg.cn/release/blogv2/dist/pc/css/blog_code-01256533b5.min.css" />
<link rel="stylesheet" href="https://csdnimg.cn/release/blogv2/dist/mdeditor/css/editerView/chart-3456820cac.css" />
<div class="main_father clearfix d-flex justify-content-center" style="height: auto !important;"> 
    <div class="container clearfix" id="mainBox" style="height: auto !important;">
        <main>
<script type="text/javascript">
    var blogSensitiveWords = "";
    function getQueryString(name) {   
      var reg = new RegExp("(^|&amp;)" + name + "=([^&amp;]*)(&amp;|$)"); //构造一个含有目标参数的正则表达式对象  
      var r = window.location.search.substr(1).match(reg);  //匹配目标参数
      if( r != null ) return decodeURIComponent( r[2] ); return '';   
    }
    function stripscript(s){ 
      var pattern = new RegExp("[`~!@#$^&amp;*()=|{}':;',\\[\\].&lt;&gt;/?~！@#￥……&amp;*（）——|{}【】‘；：”“'。，、？%]") 
      var rs = ""; 
      for (var i = 0; i &lt; s.length; i++) { 
        rs = rs+s.substr(i, 1).replace(pattern, ''); 
      } 
      return rs; 
    }
    var blogHotWords = stripscript(getQueryString('utm_term')).length &gt; 1 ? stripscript(getQueryString('utm_term')) : ''
</script>
<div class="blog-content-box">
    <div class="article-header-box">
        <div class="article-header">
            <div class="article-title-box">
                <h1 class="title-article" id="articleContentId">Parallax Mapping</h1>
            </div>
            <div class="article-info-box">
                <div class="article-bar-top">
                    <img class="article-type-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/original.png" alt="" />
                    <div class="bar-content">
                        <a class="follow-nickName " href="https://blog.csdn.net/soilwork" target="_blank" rel="noopener">soilwork</a>
                    <span class="time">2006-12-22 01:48:00</span>
                    <img class="article-read-img article-heard-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/articleReadEyes.png" alt="" />
                    <span class="read-count">9338</span>
                    <a id="blog_detail_zk_collection" class="un-collection" data-report-click="{&quot;mod&quot;:&quot;popu_823&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4232&quot;,&quot;ab&quot;:&quot;new&quot;}">
                        <img class="article-collect-img article-heard-img un-collect-status isdefault" style="display:inline-block" src="https://csdnimg.cn/release/blogv2/dist/pc/img/tobarCollect.png" alt="" />
                        <img class="article-collect-img article-heard-img collect-status isactive" style="display:none" src="https://csdnimg.cn/release/blogv2/dist/pc/img/tobarCollectionActive.png" alt="" />
                        <span class="name">收藏</span>
                        <span class="get-collection">
                        </span>
                    </a>
                    </div>
                </div>
                <div class="blog-tags-box">
                    <div class="tags-box artic-tag-box">
                            <span class="label">分类专栏：</span>
                                <a class="tag-link" href="https://blog.csdn.net/soilwork/category_172080.html" target="_blank" rel="noopener">GPU程序设计</a>
                            <span class="label">文章标签：</span>
                                <a data-report-click="{&quot;mod&quot;:&quot;popu_626&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4223&quot;,&quot;strategy&quot;:&quot;算法&quot;,&quot;ab&quot;:&quot;new&quot;}" class="tag-link" href="https://www.csdn.net/tags/MtTaEg0sMTE3MjUtYmxvZwO0O0OO0O0O.html" target="_blank" rel="noopener">算法</a>
                                <a data-report-click="{&quot;mod&quot;:&quot;popu_626&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4223&quot;,&quot;strategy&quot;:&quot;blog&quot;,&quot;ab&quot;:&quot;new&quot;}" class="tag-link" href="https://so.csdn.net/so/search/s.do?q=blog&amp;t=blog&amp;o=vip&amp;s=&amp;l=&amp;f=&amp;viparticle=" target="_blank" rel="noopener">blog</a>
                                <a data-report-click="{&quot;mod&quot;:&quot;popu_626&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4223&quot;,&quot;strategy&quot;:&quot;生活&quot;,&quot;ab&quot;:&quot;new&quot;}" class="tag-link" href="https://so.csdn.net/so/search/s.do?q=生活&amp;t=blog&amp;o=vip&amp;s=&amp;l=&amp;f=&amp;viparticle=" target="_blank" rel="noopener">生活</a>
                    </div>
                </div>
                <div class="up-time"><span>最后发布:2006-12-22 01:48:00</span><span>首次发布:2006-12-22 01:48:00</span></div>
                <div class="slide-content-box">
                    <div class="article-copyright">
                        <div class="creativecommons">
                            版权声明：本文为博主原创文章，遵循<a href="http://creativecommons.org/licenses/by-sa/4.0/" target="_blank" rel="noopener"> CC 4.0 BY-SA </a>版权协议，转载请附上原文出处链接和本声明。
                        </div>
                        <div class="article-source-link">
                            本文链接：<a href="https://blog.csdn.net/soilwork/article/details/1452437" target="_blank">https://blog.csdn.net/soilwork/article/details/1452437</a>
                        </div>
                    </div>
                </div>
                <div class="operating">
                    <a class="href-article-edit slide-toggle">版权</a>
                </div>
            </div>
        </div>
    </div>
    <article class="baidu_pl">
        <div id="article_content" class="article_content clearfix">
        <link rel="stylesheet" href="https://csdnimg.cn/release/blogv2/dist/mdeditor/css/editerView/ck_htmledit_views-b5506197d8.css" />
                <div id="content_views" class="htmledit_views">
                    <p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt"><font color="#000080" size="2"><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'"><strong><font face="Times New Roman" color="#ff0000">请勿转载.</font></strong></span></font></p> 
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt"><font color="#000080" size="2"><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'"><font face="Times New Roman" color="#0000ff" size="2">clayman<br />Blog：</font><a href="http://blog.csdn.net/soilwork"><font face="Times New Roman" color="#0000ff" size="2">http://blog.csdn.net/soilwork</font></a><br /><font face="Times New Roman" color="#0000ff" size="2">clayman_joe@yahoo.com.cn</font><font face="Times New Roman" color="#000000"> </font> </span></font></p> 
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt"><font color="#000080" size="2"><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'"></span></font></p> 
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt"><font color="#000080" size="2"><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'"></span></font></p> 
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt"><font color="#000080" size="2"><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">  </span></font></p> 
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt"><font color="#000080" size="2"><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'"></span></font></p> 
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt"><font size="2"><font color="#000080"><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">   作为实现</span><span lang="EN-US"><font face="Times New Roman">bump map</font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">的技术之一，</span><span lang="EN-US"><font face="Times New Roman">Parallax Mapping</font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">（视差映射）的目的同样也是让平坦表面实现凹凸效果。和</span><span lang="EN-US"><font face="Times New Roman">Normal Mapping</font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">相比，</span><span lang="EN-US"><font face="Times New Roman">Parallax Mapping</font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">能实现更加真实和强烈的凹凸感。</span></font></font></p> 
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt"><font size="2"><font color="#000080"><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'"></span></font></font></p> 
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt"><span lang="EN-US">
  
   <font face="Times New Roman" color="#000080" size="2"> </font>
  </span></p> 
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt"><strong><font size="3"><font color="#0000ff"><span lang="EN-US"><font face="Times New Roman">Parallax Mapping</font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">的思想：</span></font></font></strong></p> 
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt"><strong><font size="3"><font color="#0000ff"><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'"></span></font></font></strong></p> 
<p><font color="#000080" size="2"><strong><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'"><img alt="" src="http://farm1.static.flickr.com/144/329240546_2738968535.jpg?v=0" /></span></strong></font></p> 
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt; TEXT-ALIGN: center" align="center"><span lang="EN-US"><font size="2"><font color="#000080">
    
     
     
      
      
      
      
      
      
      
      
      
      
      
      
     
     
     
    
    
     
    </font></font></span></p> 
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt"><font size="2"><font color="#000080"><span lang="EN-US"><span style="mso-tab-count: 1"><font face="Times New Roman">       </font></span></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">对真正高度起伏不同的凹凸表面来说，当观察它时会出现视差效果，但用平坦面表来模拟这种凹凸效果时，这种视差效果就消失了。上图中，点</span><span lang="EN-US"><font face="Times New Roman">A</font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">对应的像素元为</span><span lang="EN-US"><font face="Times New Roman">Ta</font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">，点</span><span lang="EN-US"><font face="Times New Roman">B</font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">对应的为</span><span lang="EN-US"><font face="Times New Roman">Tb</font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">。假设我们从上图所示的</span><span lang="EN-US"><font face="Times New Roman">eye</font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">位置观察表明，对普通的纹理映射来说，应为观察矢量穿过了像素元</span><span lang="EN-US"><font face="Times New Roman">Ta</font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">，所以我们应该看到</span><span lang="EN-US"><font face="Times New Roman">A</font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">点。可是，观察矢量同样穿过了真实表面的</span><span lang="EN-US"><font face="Times New Roman">B</font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">点。在实际生活中，我们观察的结果应该是看到点</span><span lang="EN-US"><font face="Times New Roman">B</font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">，也就是看到像素元</span><span lang="EN-US"><font face="Times New Roman">Tb</font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">。因此，对平坦表明来说，为了正确的显示点</span><span lang="EN-US"><font face="Times New Roman">B</font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">，我们必须对</span><span lang="EN-US"><font face="Times New Roman">Ta</font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">处的纹理坐标进行偏移，使它等于</span><span lang="EN-US"><font face="Times New Roman">Tb</font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">。如果我们对多边形中的每个像素都进行这样的计算，视差效果也就出现了。</span></font></font></p> 
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt"><span lang="EN-US">
  
   <font face="Times New Roman" color="#000080" size="2"> </font>
  </span></p> 
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt"><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'"><strong><font color="#0000ff" size="3">需要的数据：</font></strong></span></p> 
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt"><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'"><font color="#000080" size="2"></font></span></p> 
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt"><font size="2"><font color="#000080"><span lang="EN-US"><span style="mso-tab-count: 1"><font face="Times New Roman">       </font></span></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">除了渲染表面所需的纹理，法线等贴图之外，为了计算像素的纹理坐标偏移值，还需要表面的高度图。当然，还需要从每个象素指向观察点的矢量。由于最终的结果是用来修改纹理坐标，所以所有的计算都在切线空间下计算。这里，需要把世界坐标下的观察矢量变换到切空间下，因此对每个顶点来说都要一个切空间坐标变换矩阵。</span></font></font></p> 
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt"><span lang="EN-US">
  
   <font face="Times New Roman" color="#000080" size="2"> </font>
  </span></p> 
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt"><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'"><font color="#0000ff" size="3"><strong>算法：</strong></font></span></p> 
<p><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'"><font color="#000080" size="2"><img alt="" src="http://farm1.static.flickr.com/135/329240547_39dedd9e06.jpg?v=0" /></font></span></p> 
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt"><font size="2"><font color="#000080"><span lang="EN-US"><span style="mso-tab-count: 1"><font face="Times New Roman">       </font></span></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">在一般的纹理映射中，每个顶点都包含一对纹理坐标。在</span><span lang="EN-US"><font face="Times New Roman">parallax mapping</font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">中，我们将用纹理坐标对高度图进行查找，根据所得结果对自身进行修改，最后再进行普通的纹理查找。</span></font></font><font size="2"><font color="#000080"><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">如上图所示，纹理坐标偏移值等于点</span><span lang="EN-US"><font face="Times New Roman">A</font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">到观察矢量的距离</span><span lang="EN-US"><font face="Times New Roman">offset</font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">。由于从点</span><span lang="EN-US"><font face="Times New Roman">A</font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">到观察矢量的射线和观察矢量的交点不一定在真正的几何体凹凸表面，所以</span><span lang="EN-US"><font face="Times New Roman">parallax mapping</font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">上只是一种近似实现视差的方法。当然，可以使用其它方法获得更精确的偏移值，但这通常需要许多额外的计算，实际上在大多数情况下，这种近似已经足够好了。为了计算偏移，先要对切空间下的观察矢量进行标准化（</span><span lang="EN-US"><font face="Times New Roman">normalized</font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">）。在切空间下，</span><span lang="EN-US"><font face="Times New Roman">x</font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">和</span><span lang="EN-US"><font face="Times New Roman">y</font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">轴都位于切平面上</span><span lang="EN-US"><font face="Times New Roman">V<sub>{x,y}</sub></font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">，</span><span lang="EN-US"><font face="Times New Roman">z</font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">轴于切平面正交</span><span lang="EN-US"><font face="Times New Roman">V<sub>{z}</sub></font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">。接下来需要对高度图中的值进行缩放和偏移。高度图中的值在</span><span lang="EN-US"><font face="Times New Roman">[0</font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">，</span><span lang="EN-US"><font face="Times New Roman">1]</font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">之间，一般来说，需要把这个值映射到一个合适的范围内。比如对边长为</span>
   
    <span lang="EN-US"><font face="Times New Roman">2m</font></span>
   <span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">的砖墙来说，假设表面水泥的厚度为</span>
   
    <span lang="EN-US"><font face="Times New Roman">0.02m</font></span>
   <span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">，那么相应的缩放值应该为</span><span lang="EN-US"><font face="Times New Roman"> 0.02 / 2 = 0.01</font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">。此外，偏移值为</span><span lang="EN-US"><font face="Times New Roman">0</font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">，那么水泥看起来是凸起的，如果为</span><span lang="EN-US"><font face="Times New Roman">-0.01</font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">，则看起来是凹陷的。用以下公式来计算高度：</span></font></font></p> 
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt"><font size="2"><font color="#000080"><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'"></span></font></font></p> 
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt"><font color="#000080" size="2"><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'"></span></font></p> 
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt; TEXT-ALIGN: center" align="center"><font size="3"><strong><font color="#0000ff"><span lang="EN-US"><font face="Times New Roman">H<sub>sb</sub> = </font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">（</span><span lang="EN-US"><font face="Times New Roman">h * s</font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">）</span><span lang="EN-US"><font face="Times New Roman">+ b</font></span></font></strong></font></p> 
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt; TEXT-ALIGN: center" align="center"><font face="Times New Roman" color="#000080" size="2"><span lang="EN-US"></span></font></p> 
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt"><font size="2"><font color="#000080"><span lang="EN-US"><span style="mso-tab-count: 1"><font face="Times New Roman">       </font></span></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">最终，修改之后的纹理坐标就为：</span></font></font></p> 
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt"><font size="2"><font color="#000080"><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'"></span></font></font></p> 
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt"><font color="#000080" size="2"><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'"></span></font></p> 
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt; TEXT-ALIGN: center" align="center"><font size="3"><font color="#0000ff"><strong><span lang="EN-US"><font face="Times New Roman">Tb = Ta + </font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">（</span><span lang="EN-US"><font face="Times New Roman">V<sub>{x,y}</sub> * H<sub>sb</sub></font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">）</span><span lang="EN-US"><font face="Times New Roman">/ V<sub>{z}</sub></font></span></strong></font></font></p> 
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt; TEXT-ALIGN: center" align="center"><font size="2"><span lang="EN-US"><font face="Times New Roman"><sub>
     </sub></font></span></font></p> 
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt"><font size="2"><font color="#000080"><span lang="EN-US"><span style="mso-tab-count: 1"><font face="Times New Roman">       </font></span></span></font></font></p> 
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt"><font size="2"><font color="#000080"><span lang="EN-US"><span style="mso-tab-count: 1"><font face="Times New Roman">    </font></span></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">上面的公式虽然看起来是很合理的，但却有一些重要缺陷。当观察矢量和平面间的角度趋近于</span><span lang="EN-US"><font face="Times New Roman">0</font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">时，</span><span lang="EN-US"><font face="Times New Roman">Vz</font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">也趋近于</span><span lang="EN-US"><font face="Times New Roman">0</font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">，结果将导致坐标偏移变的无限大，让</span><span lang="EN-US"><font face="Times New Roman">parallax mapping</font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">方法崩溃。为了避免这种效果，只需要丢弃公式中的</span><span lang="EN-US"><font face="Times New Roman">Vz</font></span><span style="FONT-FAMILY: 宋体; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">项就可以了。当然，这同样会在精度上带来一些损失，不过实际情况下，一般不容易察觉出这些效果。</span></font></font></p> 
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt; TEXT-ALIGN: center" align="center"><span lang="EN-US"><font face="Times New Roman" color="#0000ff" size="3"><strong>Tb = Ta + (V<sub>{x,y} </sub>* H<sub>sb</sub>)</strong></font></span></p> 
<p class="MsoNormal" style="MARGIN: 0cm 0cm 0pt; TEXT-ALIGN: center" align="left"><span lang="EN-US"><font face="Times New Roman" color="#000080" size="2"></font></span></p> 
<p><span lang="EN-US"><font face="Times New Roman" color="#000080" size="2"><img alt="" src="http://farm1.static.flickr.com/147/329253703_d5d1bc2236.jpg?v=0" /></font></span></p> 
<p><span lang="EN-US"><font face="Times New Roman" color="#000080" size="2"></font></span></p> 
<font color="#000080" size="2"> </font>
                </div><div data-report-view="{&quot;mod&quot;:&quot;1585297308_001&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/article/details/1452437&quot;,&quot;extend1&quot;:&quot;pc&quot;,&quot;ab&quot;:&quot;new&quot;}"><div></div></div>
        </div>
    </article>
</div>
<script>
    // 敏感词替换
    // replaceArticleContentWords(blogSensitiveWords,'sensitiveWords')
    // 高亮词
    // replaceArticleContentWords(blogHotWords,'hotWords')
    // 公共方法
    function replaceArticleContentWords(words,type){
      if(words){   
        var getContentViews = document.getElementById("content_views");
        var getContentTitle = document.getElementById("articleContentId");
        var contentViewsInnerHTML = getContentViews.innerHTML;
        var contentTitleInnerHTML = getContentTitle.innerHTML;
        var keyWordsJsonArr = [];
        var keyWordsArr = words.split(',');
        function repeatTimes(str, num){
            return num &gt; 1 ? str += repeatTimes(str, --num): str;
        }
        for(var i = 0; i &lt; keyWordsArr.length; i++){
            var keyWordsJson = {} ;
            keyWordsJson.key = keyWordsArr[i];
            if(type == 'hotWords'){
              keyWordsJson.value = '&lt;span class="hot-words-highlight"&gt;'+keyWordsArr[i]+'&lt;/span&gt;'
            }else if(type == 'sensitiveWords'){
              keyWordsJson.value = repeatTimes("*",keyWordsArr[i].length);
            }else {
              keyWordsJson.value = keyWordsArr[i]
            }
            keyWordsJsonArr.push(keyWordsJson);
        }
        var reg;
        for(var i = 0; i &lt; keyWordsJsonArr.length; i++){
            var item = keyWordsJsonArr[i]; 
            if(type == 'hotWords'){
              reg = new RegExp(item.key,"ig");
            }
            if(type == 'sensitiveWords'){
              reg = new RegExp(item.key+"(?!([^&lt;]*&gt;)|([^&lt;]*&lt;\/a&gt;))","ig");  
            }
            contentViewsInnerHTML = contentViewsInnerHTML.replace(reg,item.value);
            contentTitleInnerHTML = contentTitleInnerHTML.replace(reg,item.value);
        }
        getContentViews.innerHTML=contentViewsInnerHTML;
        getContentTitle.innerHTML=contentTitleInnerHTML;
      }
    }
</script>
<div class="more-toolbox more-toolbox-active" id="toolBarBox">
    <span id="fixedBar"></span>
    <div class="left-toolbox" style="position: fixed; left: 378px; bottom: 0px; width: 760px;">
        <ul class="toolbox-list">
            <li class="tool-item tool-item-size tool-active is-like" id="is-like"><a>
            <img style="display:none;" id="is-like-imgactive-animation-like" class="animation-dom active-animation" src="https://csdnimg.cn/release/blogv2/dist/pc/img/tobarThumbUpactive.png" alt="" />
            <img class="isactive" style="display:none" id="is-like-imgactive" src="https://csdnimg.cn/release/blogv2/dist/pc/img/tobarThumbUpactive.png" alt="" />
            <img class="isdefault" style="display:block" id="is-like-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/tobarThumbUp.png" alt="" />   
            <span class="name" id="is-like-span">点赞</span>
            <span id="spanCount" class="count">
            </span>
            </a></li>
            <li class="tool-item tool-item-size tool-active tool-item-comment">
                <a href="#commentBox">
                    <img class="isdefault" src="https://csdnimg.cn/release/blogv2/dist/pc/img/tobarComment.png" alt="" />
                    <img class="isactive" src="https://csdnimg.cn/release/blogv2/dist/pc/img/tobarCommentactive.png" style="display:none;" alt="" />
                    <span class="name">评论</span>
                    <span class="count">
                        3
                    </span>
                </a>
            </li>
            <li class="tool-item tool-item-size tool-active tool-QRcode" id="tool-share">
                <a href="javascript:;" data-report-click="{&quot;mod&quot;:&quot;1582594662_002&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4129&quot;,&quot;ab&quot;:&quot;new&quot;}">
                    <img class="isdefault" src="https://csdnimg.cn/release/blogv2/dist/pc/img/tobarShare.png" alt="" />
                    <img class="isactive" src="https://csdnimg.cn/release/blogv2/dist/pc/img/tobarShareactive.png" style="display:none;" alt="" />
                    <span class="name">分享</span>
                </a>
                <div class="QRcode" id="tool-QRcode" style="left:-92%;">
                    <span id="QRcode-close">x</span>
                    <p class="title">
                    海报分享
                    </p>
                    <div id="shareCode" title="https://blog.csdn.net/soilwork/article/shareArticleCardPage?article_id=1452437&amp;utm_source=po_popup"><canvas width="144" height="144"></canvas><img style="display: none;" /></div>
                    <p>
                    扫一扫，分享海报
                    </p>
                </div>
            </li>
            <li class="tool-item tool-item-size tool-active is-collection ">
                <a href="javascript:;" data-report-click="{&quot;mod&quot;:&quot;popu_824&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4130&quot;,&quot;ab&quot;:&quot;new&quot;}">
                    <img style="display:none" id="is-collection-img-collection" class="animation-dom active-animation" src="https://csdnimg.cn/release/blogv2/dist/pc/img/tobarCollectionActive.png" alt="" />
                    <img class="isdefault" id="is-collection-img" style="display:block" src="https://csdnimg.cn/release/blogv2/dist/pc/img/tobarCollect.png" alt="" />
                    <img class="isactive" id="is-collection-imgactive" style="display:none" src="https://csdnimg.cn/release/blogv2/dist/pc/img/tobarCollectionActive.png" alt="" />
                    <span class="name" id="is-collection">收藏</span>
                    <span class="count get-collection" id="get-collection">
                    </span>
                </a>
            </li>
            <li class="tool-item tool-item-size tool-active tool-reward">
                <a id="toolreward" data-report-click="{&quot;mod&quot;:&quot;popu_830&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4237&quot;,&quot;dest&quot;:&quot;&quot;,&quot;ab&quot;:&quot;new&quot;}">
                    <img class="isdefault" src="https://csdnimg.cn/release/blogv2/dist/pc/img/tobarReward.png" alt="" />
                    <img class="isactive" src="https://csdnimg.cn/release/blogv2/dist/pc/img/tobarRewardactive.png" style="display:none;" alt="" />
                    <span class="name">打赏</span>
                </a>
<div id="reward" class="reward-box">
	<p class="rewad-title">打赏<span class="reward-close"><svg t="1567152543821" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="10924" xmlns:xlink="http://www.w3.org/1999/xlink" width="12" height="12"><defs><style type="text/css"/></defs><path d="M512 438.378667L806.506667 143.893333a52.032 52.032 0 1 1 73.6 73.621334L585.621333 512l294.485334 294.485333a52.074667 52.074667 0 0 1-73.6 73.642667L512 585.621333 217.514667 880.128a52.053333 52.053333 0 1 1-73.621334-73.642667L438.378667 512 143.893333 217.514667a52.053333 52.053333 0 1 1 73.621334-73.621334L512 438.378667z" fill="" p-id="10925"/></svg></span></p>
	<dl>
		<dd>
		<a href="https://blog.csdn.net/soilwork" data-report-click="{&quot;mod&quot;:&quot;popu_379&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork&quot;,&quot;ab&quot;:&quot;new&quot;}">
			<img src="https://profile.csdnimg.cn/7/D/F/3_soilwork" class="avatar_pic" />
		</a>
		</dd>
		<dt>
			<p class="blog-name">soilwork</p>
			<p class="blog-discript">你的鼓励将是我创作的最大动力</p>
		</dt>
	</dl>
	<div class="change-bt-box">
		<span class="reward-bt reward-bt-coin">C币</span>
		<span class="reward-bt-space"></span>
		<span class="reward-bt reward-bt-money reward-bt-active">余额</span>
	</div>
	<div class="money-box">
			<span class="choose_money choosed" data-id="2">¥2</span>
			<span class="choose_money " data-id="4">¥4</span>
			<span class="choose_money " data-id="6">¥6</span>
			<span class="choose_money " data-id="10">¥10</span>
			<span class="choose_money " data-id="20">¥20</span>
			<span class="choose_money " data-id="50">¥50</span>
	</div>
	<div class="sure-box">
		<p class="is-have-money"><span class="tip">您的余额不足，请先充值哦～</span><a class="bt-go" data-report-click="{&quot;mod&quot;:&quot;1597646289_003&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4302&quot;}" target="_blank" href="https://i.csdn.net/#/wallet/balance/recharge" data-report-query="utm_source=RewardVip">去充值</a></p>
	</div>
</div>
            </li>
            <li class="tool-item tool-item-size tool-active tool-more">
              <a class="article-report">
                <img class="isdefault" src="https://csdnimg.cn/release/blogv2/dist/pc/img/tobarReport.png" alt="" />
                <img class="isactive" src="https://csdnimg.cn/release/blogv2/dist/pc/img/tobarReportactive.png" style="display:none;" alt="" />
                <span class="name">举报</span>
              </a>
            </li>
            <li class="tool-item">
                    <a class="tool-attend tool-bt-button tool-bt-attend" href="javascript:;">关注</a>
                <a class="tool-item-follow active-animation" style="display:none;">关注</a>
            </li>
            <li class="tool-item">
                    <p class="company active" id="health-companies" href="javascript:;">一键三连</p>
                <span class="triplet-prompt" style="display: inline;">点赞Mark关注该博主, 随时了解TA的最新博文<img class="close-prompt" src="https://csdnimg.cn/release/blogv2/dist/pc/img/closePrompt.png" /></span>
            </li>
        </ul>
        <div style="display:flex">
         </div>
         <div class="hot-word-tip-box">
          <span class="hot-word-text">已标记关键词</span>
          <span class="hot-word-count"></span> 
          <span class="hot-word-bar"></span>
          <span class="hot-word-clear">清除标记</span>
        </div>
    </div>  
</div>
<script type="text/javascript" crossorigin="" src="https://csdnimg.cn/release/phoenix/production/qrcode-7c90a92189.min.js"></script>
<script src="//g.csdnimg.cn/??sharewx/1.2.1/sharewx.js" type="text/javascript"></script>
<script type="text/javascript" crossorigin="" src="https://g.csdnimg.cn/collection-box/2.0.3/collection-box.js"></script>
                <div class="first-recommend-box recommend-box">
<div class="recommend-item-box type_download clearfix" data-url="https://download.csdn.net/download/e295166319/10427436" data-report-view="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_871&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant_t0.none-task-download-BlogCommendFromMachineLearnPai2-1.control\&quot;}&quot;,&quot;index&quot;:&quot;1&quot;,&quot;strategy&quot;:&quot;BlogCommendFromMachineLearnPai2&quot;,&quot;dest&quot;:&quot;https://download.csdn.net/download/e295166319/10427436&quot;}">
	<div class="content-box">
		<div class="content-blog display-flex">
			<div class="title-box">
				<a href="https://download.csdn.net/download/e295166319/10427436" class="tit ellipsis-online ellipsis-online-1" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_871&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant_t0.none-task-download-BlogCommendFromMachineLearnPai2-1.control\&quot;}&quot;,&quot;index&quot;:&quot;1&quot;,&quot;strategy&quot;:&quot;BlogCommendFromMachineLearnPai2&quot;,&quot;dest&quot;:&quot;https://download.csdn.net/download/e295166319/10427436&quot;}" data-report-query="utm_medium=distribute.pc_relevant_t0.none-task-download-BlogCommendFromMachineLearnPai2-1.control&amp;depth_1-utm_source=distribute.pc_relevant_t0.none-task-download-BlogCommendFromMachineLearnPai2-1.control">
					UnityShader 法线贴图（Normal Map）与视差贴图（<em>Parallax</em> Map）
				</a>
			</div>
			<div class="info-box display-flex">
				<div class="info display-flex">
					<span class="info-block">05-21</span>
				</div>
			</div>
		</div>
		<div class="desc-box">
			<a href="https://download.csdn.net/download/e295166319/10427436" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_871&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant_t0.none-task-download-BlogCommendFromMachineLearnPai2-1.control\&quot;}&quot;,&quot;index&quot;:&quot;1&quot;,&quot;strategy&quot;:&quot;BlogCommendFromMachineLearnPai2&quot;,&quot;dest&quot;:&quot;https://download.csdn.net/download/e295166319/10427436&quot;}" data-report-query="utm_medium=distribute.pc_relevant_t0.none-task-download-BlogCommendFromMachineLearnPai2-1.control&amp;depth_1-utm_source=distribute.pc_relevant_t0.none-task-download-BlogCommendFromMachineLearnPai2-1.control">
				<div class="desc ellipsis-online ellipsis-online-1">主要研究一下怎样增强法线贴图的效果，法线贴图的进阶版-视差贴图（<em>Parallax</em> Map）。</div>
			</a>
		</div>
	</div>
</div>
                </div>
            <div class="second-recommend-box recommend-box">
<div class="recommend-item-box type_blog clearfix" data-url="https://blog.csdn.net/weixin_30920091/article/details/96251306" data-report-view="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-1.control\&quot;}&quot;,&quot;index&quot;:&quot;1&quot;,&quot;strategy&quot;:&quot;BlogCommendFromMachineLearnPai2&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/weixin_30920091/article/details/96251306&quot;}">
	<div class="content-box">
		<div class="content-blog display-flex">
			<div class="title-box">
				<a href="https://blog.csdn.net/weixin_30920091/article/details/96251306" class="tit ellipsis-online ellipsis-online-1" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-1.control\&quot;}&quot;,&quot;index&quot;:&quot;1&quot;,&quot;strategy&quot;:&quot;BlogCommendFromMachineLearnPai2&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/weixin_30920091/article/details/96251306&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-1.control&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-1.control">
					视差贴图（<em>Parallax</em> <em>Mapping</em>）
				</a>
			</div>
			<div class="info-box display-flex">
				<div class="info">
					<a href="https://blog.csdn.net/weixin_30920091" target="_blank"><span class="blog-title">weixin_30920091的博客</span></a>
				</div>
				<div class="info display-flex">
					<span class="info-block time">04-19</span>
					<span class="info-block read"><img class="read-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png" alt="" />
					54
					</span>
				</div>
			</div>
		</div>
		<div class="desc-box">
			<a href="https://blog.csdn.net/weixin_30920091/article/details/96251306" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-1.control\&quot;}&quot;,&quot;index&quot;:&quot;1&quot;,&quot;strategy&quot;:&quot;BlogCommendFromMachineLearnPai2&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/weixin_30920091/article/details/96251306&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-1.control&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-1.control">
				<div class="desc ellipsis-online ellipsis-online-1">使用顶点光照的模型，当模型的面数很少的时候，光照效果会显得很奇怪，因为只有顶点上的光照是正确计算出来的，三角面上的光照都是通过硬件插值得到，所以难免会出现问题。基于像素的光照可以很好的改善这个问题。如果想要表现出模型表面凹凸不平，那就需要很高的面数制作出凹凸的模型。

然后就出现法线贴图。法线贴图可以在低面数的模型上表现出高面数模型的很多细节。法线贴图并不是把模型的面数提高了，而是使用法线贴图中的...</div>
			</a>
		</div>
	</div>
</div>
            </div>
<a id="commentBox" name="commentBox"></a>
<div class="comment-box">
	<div class="comment-edit-box d-flex">
		<a id="commentsedit"></a>
		<div class="user-img">
			<a href="javascript:void(0);">
				<img class="show_loginbox" src="https://g.csdnimg.cn/static/user-img/anonymous-User-img.png" />
			</a>
		</div>
		<form id="commentform">
			
      <textarea class="comment-content" name="comment_content" id="comment_content" placeholder="优质评论可以帮助作者获得更高权重" maxlength="1000"></textarea>
			<div class="comment-emoticon"><img class="comment-emoticon-img" data-url="https://csdnimg.cn/release/blogv2/dist/pc/img/" src="https://csdnimg.cn/release/blogv2/dist/pc/img/emoticon.png" alt="表情包" /></div> 
      <span class="comment-emoticon-tip">插入表情</span>
      <div class="comment-emoticon-box">
        <div class="comment-emoticon-img-box">
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:001.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/001.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:002.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/002.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:003.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/003.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:004.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/004.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:005.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/005.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:006.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/006.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:007.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/007.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:008.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/008.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:009.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/009.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:010.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/010.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:011.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/011.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:012.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/012.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:013.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/013.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:014.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/014.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:015.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/015.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:016.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/016.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:017.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/017.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:018.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/018.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:019.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/019.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:020.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/020.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:021.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/021.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:022.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/022.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:023.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/023.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:024.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/024.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:025.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/025.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:026.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/026.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:027.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/027.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:028.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/028.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:029.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/029.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:030.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/030.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:031.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/031.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:032.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/032.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:033.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/033.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:034.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/034.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:035.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/035.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:036.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/036.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:037.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/037.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:038.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/038.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:039.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/039.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:040.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/040.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:041.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/041.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:042.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/042.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:043.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/043.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:044.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/044.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:045.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/045.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:046.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/046.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:047.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/047.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:048.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/048.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:049.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/049.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:050.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/050.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:051.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/051.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:052.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/052.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:053.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/053.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:054.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/054.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:055.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/055.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:056.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/056.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:057.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/057.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:058.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/058.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:059.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/059.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:060.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/060.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:061.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/061.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:062.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/062.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:063.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/063.png" />
            <img class="emoticon-monkey-img" data-emoticon="[face]monkey2:064.png[/face]" src="https://g.csdnimg.cn/static/face/monkey2/064.png" />
        </div>
      </div>
      <div class="opt-box">
				<div id="ubbtools" class="add_code">
					<a href="#insertcode" code="code" target="_self"><i class="icon iconfont icon-daima"></i></a>
				</div>
				<input type="hidden" id="comment_replyId" name="comment_replyId" />
				<input type="hidden" id="article_id" name="article_id" value="1452437" />
				<input type="hidden" id="comment_userId" name="comment_userId" value="" />
				<input type="hidden" id="commentId" name="commentId" value="" />
				<div class="dropdown" id="myDrap">
					<a class="dropdown-face d-flex align-items-center" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
						<div class="txt-selected text-truncate">添加代码片</div>
						<svg class="icon d-block" width="200px" height="100.00px" viewBox="0 0 2048 1024" version="1.1" xmlns="http://www.w3.org/2000/svg"><path d="M597.33333292 298.666667h853.333334L1023.99999992 725.333333 597.33333292 298.666667z"/></svg>
					</a>
					<ul class="dropdown-menu" id="commentCode" aria-labelledby="drop4">
						<li><a data-code="html">HTML/XML</a></li>
						<li><a data-code="objc">objective-c</a></li>
						<li><a data-code="ruby">Ruby</a></li>
						<li><a data-code="php">PHP</a></li>
						<li><a data-code="csharp">C</a></li>
						<li><a data-code="cpp">C++</a></li>
						<li><a data-code="javascript">JavaScript</a></li>
						<li><a data-code="python">Python</a></li>
						<li><a data-code="java">Java</a></li>
						<li><a data-code="css">CSS</a></li>
						<li><a data-code="sql">SQL</a></li>
						<li><a data-code="plain">其它</a></li>
					</ul>
				</div>
				<div class="right-box" id="rightBox" data-type="2">
							<span id="tip_comment" class="tip">还能输入<em>1000</em>个字符</span>
							<a data-report-click="{&quot;spm&quot;:&quot;3001.4374&quot;}" class="btn btn-sm btn-quick-comment" id="quickComment">“速评一下”</a>
							<a data-report-click="{&quot;mod&quot;:&quot;1582594662_003&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4227&quot;,&quot;ab&quot;:&quot;new&quot;}"><input type="submit" class="btn btn-sm btn-comment" value="发表评论" /></a>
				</div>
			</div>
		</form>
		<input type="button" class="bt-comment-show" value="评论" />
	</div>
	<div class="comment-list-container" style="display: block;">
		<a id="comments"></a>
		<div class="comment-list-box" style="overflow: hidden; max-height: none;"><ul class="comment-list"><li class="comment-line-box d-flex" data-commentid="2930643" data-replyname="cgwolver"><div style="display: flex;width: 100%;">      <a target="_blank" href="https://blog.csdn.net/cgwolver"><img src="https://profile.csdnimg.cn/5/1/6/3_cgwolver" username="cgwolver" alt="cgwolver" class="avatar" /></a>        <div class="right-box ">          <div class="new-info-box clearfix">            <a target="_blank" href="https://blog.csdn.net/cgwolver"><span class="name ">cgwolver</span></a><span class="colon">:</span><span class="floor-num"></span><span class="new-comment">s = scale b = bias?</span><span class="date" title="2013-09-21 21:14:31">8年前</span><span class="new-opt-floating"><a class="btn-bt  btn-reply" data-type="reply" data-flag="true">回复</a><a class="btn-bt  btn-report"><img class="btn-report-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/commentMore.png" title="" /><span data-type="report" class="hide-report">举报</span></a></span></div><div class="comment-like " data-commentid="2930643"><img class="comment-like-img unclickImg" src="https://csdnimg.cn/release/blogv2/dist/pc/img/commentUnHeart.png" title="点赞" /><img class="comment-like-img comment-like-img-hover" style="display:none" src="https://csdnimg.cn/release/blogv2/dist/pc/img/commentActiveHeart.png" title="点赞" /><img class="comment-like-img clickedImg" src="https://csdnimg.cn/release/blogv2/dist/pc/img/commentActiveHeart.png" title="点赞" /><span></span></div></div></div></li></ul><ul class="comment-list"><li class="comment-line-box d-flex" data-commentid="2291157" data-replyname="lonelyrains"><div style="display: flex;width: 100%;">      <a target="_blank" href="https://blog.csdn.net/lonelyrains"><img src="https://profile.csdnimg.cn/3/A/C/3_lonelyrains" username="lonelyrains" alt="lonelyrains" class="avatar" /></a>        <div class="right-box ">          <div class="new-info-box clearfix">            <a target="_blank" href="https://blog.csdn.net/lonelyrains"><span class="name ">lonelyrains</span></a><span class="colon">:</span><span class="floor-num"></span><span class="new-comment">原理大概理解了，很有启发意义。但是Ta---&gt;Ta‘的替换过程中，代表的点应该与eye的位置有关吧？为什么量化计算里没有这个参数？</span><span class="date" title="2012-07-19 16:56:04">9年前</span><span class="new-opt-floating"><a class="btn-bt  btn-reply" data-type="reply" data-flag="true">回复</a><a class="btn-bt  btn-report"><img class="btn-report-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/commentMore.png" title="" /><span data-type="report" class="hide-report">举报</span></a></span></div><div class="comment-like " data-commentid="2291157"><img class="comment-like-img unclickImg" src="https://csdnimg.cn/release/blogv2/dist/pc/img/commentUnHeart.png" title="点赞" /><img class="comment-like-img comment-like-img-hover" style="display:none" src="https://csdnimg.cn/release/blogv2/dist/pc/img/commentActiveHeart.png" title="点赞" /><img class="comment-like-img clickedImg" src="https://csdnimg.cn/release/blogv2/dist/pc/img/commentActiveHeart.png" title="点赞" /><span></span></div></div></div></li></ul><ul class="comment-list"><li class="comment-line-box d-flex" data-commentid="548330" data-replyname="dongxue.gpp"><div style="display: flex;width: 100%;">      <a target="_blank" href="https://blog.csdn.net/dongxue.gpp"><img src="https://profile.csdnimg.cn/6/2/E/3_dongxue.gpp" username="dongxue.gpp" alt="dongxue.gpp" class="avatar" /></a>        <div class="right-box ">          <div class="new-info-box clearfix">            <a target="_blank" href="https://blog.csdn.net/dongxue.gpp"><span class="name ">dongxue.gpp</span></a><span class="colon">:</span><span class="floor-num"></span><span class="new-comment">到是种好的方法。而且正确。
就是公式中的符号，不知道表示什么？
有点影响理解。
谢了</span><span class="date" title="2007-03-28 21:28:19">14年前</span><span class="new-opt-floating"><a class="btn-bt  btn-reply" data-type="reply" data-flag="true">回复</a><a class="btn-bt  btn-report"><img class="btn-report-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/commentMore.png" title="" /><span data-type="report" class="hide-report">举报</span></a></span></div><div class="comment-like " data-commentid="548330"><img class="comment-like-img unclickImg" src="https://csdnimg.cn/release/blogv2/dist/pc/img/commentUnHeart.png" title="点赞" /><img class="comment-like-img comment-like-img-hover" style="display:none" src="https://csdnimg.cn/release/blogv2/dist/pc/img/commentActiveHeart.png" title="点赞" /><img class="comment-like-img clickedImg" src="https://csdnimg.cn/release/blogv2/dist/pc/img/commentActiveHeart.png" title="点赞" /><span></span></div></div></div></li></ul></div>
		<div id="commentPage" class="pagination-box d-none" style="display: block;"><div id="Paging_01106798951637411" class="ui-paging-container"><ul><li class="js-page-first js-page-action ui-pager ui-pager-disabled"></li><li class="js-page-prev js-page-action ui-pager ui-pager-disabled">&lt;</li><li data-page="1" class="ui-pager focus">1</li><li class="js-page-next js-page-action ui-pager ui-pager-disabled">&gt;</li><li class="js-page-last js-page-action ui-pager ui-pager-disabled"></li></ul></div></div>
		
	</div>
</div>            <div class="recommend-box insert-baidu-box">

<div class="recommend-item-box type_blog clearfix" data-url="https://blog.csdn.net/DoomGT/article/details/79212587" data-report-view="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-2.control\&quot;}&quot;,&quot;index&quot;:&quot;2&quot;,&quot;strategy&quot;:&quot;BlogCommendFromMachineLearnPai2&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/DoomGT/article/details/79212587&quot;}">
	<div class="content-box">
		<div class="content-blog display-flex">
			<div class="title-box">
				<a href="https://blog.csdn.net/DoomGT/article/details/79212587" class="tit ellipsis-online ellipsis-online-1" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-2.control\&quot;}&quot;,&quot;index&quot;:&quot;2&quot;,&quot;strategy&quot;:&quot;BlogCommendFromMachineLearnPai2&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/DoomGT/article/details/79212587&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-2.control&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-2.control">
					Materials - UE4中的<em>Parallax</em> Occlusion <em>Mapping</em>
				</a>
			</div>
			<div class="info-box display-flex">
				<div class="info">
					<a href="https://blog.csdn.net/DoomGT" target="_blank"><span class="blog-title">GT的虚幻引擎文档</span></a>
				</div>
				<div class="info display-flex">
					<span class="info-block time">01-31</span>
					<span class="info-block read"><img class="read-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png" alt="" />
					2135
					</span>
				</div>
			</div>
		</div>
		<div class="desc-box">
			<a href="https://blog.csdn.net/DoomGT/article/details/79212587" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-2.control\&quot;}&quot;,&quot;index&quot;:&quot;2&quot;,&quot;strategy&quot;:&quot;BlogCommendFromMachineLearnPai2&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/DoomGT/article/details/79212587&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-2.control&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-2.control">
				<div class="desc ellipsis-online ellipsis-online-1">本人的一篇学习笔记，总结Content Example中的<em>Parallax</em> Occlusion <em>Mapping</em>教学关卡：</div>
			</a>
		</div>
	</div>
</div>
<div class="recommend-item-box type_blog clearfix" data-url="https://blog.csdn.net/weixin_30640769/article/details/95708811" data-report-view="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-3.control\&quot;}&quot;,&quot;index&quot;:&quot;3&quot;,&quot;strategy&quot;:&quot;BlogCommendFromMachineLearnPai2&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/weixin_30640769/article/details/95708811&quot;}">
	<div class="content-box">
		<div class="content-blog display-flex">
			<div class="title-box">
				<a href="https://blog.csdn.net/weixin_30640769/article/details/95708811" class="tit ellipsis-online ellipsis-online-1" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-3.control\&quot;}&quot;,&quot;index&quot;:&quot;3&quot;,&quot;strategy&quot;:&quot;BlogCommendFromMachineLearnPai2&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/weixin_30640769/article/details/95708811&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-3.control&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-3.control">
					UE4 <em>Parallax</em><em>Mapping</em>
				</a>
			</div>
			<div class="info-box display-flex">
				<div class="info">
					<a href="https://blog.csdn.net/weixin_30640769" target="_blank"><span class="blog-title">weixin_30640769的博客</span></a>
				</div>
				<div class="info display-flex">
					<span class="info-block time">06-14</span>
					<span class="info-block read"><img class="read-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png" alt="" />
					96
					</span>
				</div>
			</div>
		</div>
		<div class="desc-box">
			<a href="https://blog.csdn.net/weixin_30640769/article/details/95708811" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-3.control\&quot;}&quot;,&quot;index&quot;:&quot;3&quot;,&quot;strategy&quot;:&quot;BlogCommendFromMachineLearnPai2&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/weixin_30640769/article/details/95708811&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-3.control&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-3.control">
				<div class="desc ellipsis-online ellipsis-online-1">啊
转载于:https://www.cnblogs.com/litmin/p/7010615.html</div>
			</a>
		</div>
	</div>
</div>
		<div id="recommend-item-box-tow" class="recommend-item-box type_blog clearfix">
			<div id="kp_box_59" data-pid="59"><script async="" src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle" style="display: block; height: 0px;" data-ad-format="fluid" data-ad-layout-key="-hk-b+1w-4q+5k" data-ad-client="ca-pub-1076724771190722" data-ad-slot="3967051353" data-adsbygoogle-status="done"><ins id="aswift_0_expand" style="display: inline-table; border: none; height: 0px; margin: 0px; padding: 0px; position: relative; visibility: visible; width: 712px; background-color: transparent;" tabindex="0" title="Advertisement" aria-label="Advertisement"><ins id="aswift_0_anchor" style="display: block; border: none; height: 0px; margin: 0px; padding: 0px; position: relative; visibility: visible; width: 712px; background-color: transparent; overflow: hidden; opacity: 0;"><iframe id="aswift_0" name="aswift_0" style="left:0;position:absolute;top:0;border:0;width:712px;height:104px;" sandbox="allow-forms allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" width="712" height="104" frameborder="0" src="https://googleads.g.doubleclick.net/pagead/ads?guci=2.2.0.0.2.2.0.0&amp;client=ca-pub-1076724771190722&amp;output=html&amp;h=104&amp;slotname=3967051353&amp;adk=974570331&amp;adf=1647849771&amp;pi=t.ma~as.3967051353&amp;w=712&amp;lmt=1609934091&amp;rafmt=11&amp;psa=1&amp;format=712x104&amp;url=https%3A%2F%2Fblog.csdn.net%2Fsoilwork%2Farticle%2Fdetails%2F1452437&amp;flash=0&amp;wgl=1&amp;dt=1609934091217&amp;bpp=31&amp;bdt=954&amp;idt=674&amp;shv=r20201203&amp;cbv=r20190131&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3Dabae74b1af113cf7-2284b68a8cc5007c%3AT%3D1609924037%3ART%3D1609924037%3AS%3DALNI_MbISe9R06kOQTXvnUNRCBezpAp3bA&amp;correlator=3157332682838&amp;frm=20&amp;pv=2&amp;ga_vid=1355739629.1609934092&amp;ga_sid=1609934092&amp;ga_hid=176432530&amp;ga_fc=0&amp;u_tz=480&amp;u_his=2&amp;u_java=0&amp;u_h=1080&amp;u_w=1920&amp;u_ah=1040&amp;u_aw=1920&amp;u_cd=24&amp;u_nplug=3&amp;u_nmime=4&amp;adx=402&amp;ady=1774&amp;biw=912&amp;bih=872&amp;scr_x=0&amp;scr_y=0&amp;eid=21067982%2C21068084%2C21068769&amp;oid=3&amp;pvsid=1491051520445906&amp;pem=508&amp;rx=0&amp;eae=0&amp;fc=896&amp;brdim=10%2C10%2C10%2C10%2C1920%2C0%2C945%2C1020%2C929%2C889&amp;vis=1&amp;rsz=%7C%7CpeEbr%7C&amp;abl=CS&amp;pfx=0&amp;fu=9352&amp;bc=31&amp;ifi=1&amp;uci=a!1&amp;btvi=1&amp;fsb=1&amp;xpc=6onxQDxdUM&amp;p=https%3A//blog.csdn.net&amp;dtd=702" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no" allowfullscreen="true" data-google-container-id="a!1" data-google-query-id="COisgO6fh-4CFU2TlgodoJwHFg" data-load-complete="true"></iframe></ins></ins></ins>
<script>
     (adsbygoogle = window.adsbygoogle || []).push({});
</script><img class="pre-img-lasy" data-src="https://kunyu.csdn.net/1.png?p=59&amp;a=944&amp;c=0&amp;k=&amp;spm=1001.2101.3001.5003&amp;d=1&amp;t=3&amp;u=2bdeee5d83fe4e29bfe123c756840b52" style="display: block;width: 0px;height: 0px;" /></div>
		</div><div class="recommend-item-box baiduSearch clearfix" data-report-view="{&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-baidujs_title-2\&quot;}&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4242&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/happykocola/article/details/72812081&quot;,&quot;strategy&quot;:&quot;baidujs_title&quot;,&quot;ab&quot;:&quot;new&quot;,&quot;index&quot;:&quot;2&quot;}" data-flg="true">	                <div class="content-box">		                <div class="content-blog display-flex">			                  <div class="title-box">				                  <a href="https://blog.csdn.net/happykocola/article/details/72812081" target="_blank" data-report-click="{&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-baidujs_title-2\&quot;}&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4242&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/happykocola/article/details/72812081&quot;,&quot;strategy&quot;:&quot;baidujs_title&quot;,&quot;ab&quot;:&quot;new&quot;,&quot;index&quot;:&quot;2&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-blog-baidujs_title-2&amp;spm=1001.2101.3001.4242">					                <div class="tit ellipsis-online ellipsis-online-1">视差贴图(<em>Parallax</em> <em>Mapping</em>)_HappyKocola的博客</div>				                  </a>			                  </div>                    <div class="info-box display-flex">                      <div class="info display-flex">                        <span class="info-block">1-3</span>                      </div>                    </div>                  </div>                  <div class="desc-box">                    <a href="https://blog.csdn.net/happykocola/article/details/72812081" target="_blank" data-report-click="{&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-baidujs_title-2\&quot;}&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4242&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/happykocola/article/details/72812081&quot;,&quot;strategy&quot;:&quot;baidujs_title&quot;,&quot;ab&quot;:&quot;new&quot;,&quot;index&quot;:&quot;2&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-blog-baidujs_title-2&amp;spm=1001.2101.3001.4242">                      <div class="desc ellipsis-online ellipsis-online-1">视差贴图(<em>Parallax</em> <em>Mapping</em>),自己在月初就看了教程,开始看了很久都没有看明白,上周看时感觉自己弄明白了,在昨天和今天真正用代码去实现时,发现子所谓的”明白”...</div>                    </a>                  </div>                </div>              </div><div class="recommend-item-box baiduSearch clearfix" data-report-view="{&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-baidujs_title-3\&quot;}&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4242&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/anypkv/article/details/7313997&quot;,&quot;strategy&quot;:&quot;baidujs_title&quot;,&quot;ab&quot;:&quot;new&quot;,&quot;index&quot;:&quot;3&quot;}" data-flg="true">	                <div class="content-box">		                <div class="content-blog display-flex">			                  <div class="title-box">				                  <a href="https://blog.csdn.net/anypkv/article/details/7313997" target="_blank" data-report-click="{&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-baidujs_title-3\&quot;}&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4242&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/anypkv/article/details/7313997&quot;,&quot;strategy&quot;:&quot;baidujs_title&quot;,&quot;ab&quot;:&quot;new&quot;,&quot;index&quot;:&quot;3&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-blog-baidujs_title-3&amp;spm=1001.2101.3001.4242">					                <div class="tit ellipsis-online ellipsis-online-1"><em>Parallax</em> <em>Mapping</em>效果_any</div>				                  </a>			                  </div>                    <div class="info-box display-flex">                      <div class="info display-flex">                        <span class="info-block">12-25</span>                      </div>                    </div>                  </div>                  <div class="desc-box">                    <a href="https://blog.csdn.net/anypkv/article/details/7313997" target="_blank" data-report-click="{&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-baidujs_title-3\&quot;}&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4242&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/anypkv/article/details/7313997&quot;,&quot;strategy&quot;:&quot;baidujs_title&quot;,&quot;ab&quot;:&quot;new&quot;,&quot;index&quot;:&quot;3&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-blog-baidujs_title-3&amp;spm=1001.2101.3001.4242">                      <div class="desc ellipsis-online ellipsis-online-1">前几天在shadertech网站上看到一个获金牌的效果,叫relief <em>mapping</em>,其中包含relief texture <em>mapping</em>和steep <em>parallax</em> <em>mapping</em>,效果很好,于是开始琢磨着如何来实现其效果,...</div>                    </a>                  </div>                </div>              </div>
<div class="recommend-item-box type_blog clearfix" data-url="https://blog.csdn.net/terryzin1985/article/details/5619481" data-report-view="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-searchFromBaidu-4.control\&quot;}&quot;,&quot;index&quot;:&quot;4&quot;,&quot;strategy&quot;:&quot;searchFromBaidu&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/terryzin1985/article/details/5619481&quot;}">
	<div class="content-box">
		<div class="content-blog display-flex">
			<div class="title-box">
				<a href="https://blog.csdn.net/terryzin1985/article/details/5619481" class="tit ellipsis-online ellipsis-online-1" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-searchFromBaidu-4.control\&quot;}&quot;,&quot;index&quot;:&quot;4&quot;,&quot;strategy&quot;:&quot;searchFromBaidu&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/terryzin1985/article/details/5619481&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-blog-searchFromBaidu-4.control&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-searchFromBaidu-4.control">
					写给美术朋友们的凹凸贴图白皮书
				</a>
			</div>
			<div class="info-box display-flex">
				<div class="info">
					<a href="https://blog.csdn.net/terryzin1985" target="_blank"><span class="blog-title">terryzin1985的专栏</span></a>
				</div>
				<div class="info display-flex">
					<span class="info-block time">05-24</span>
					<span class="info-block read"><img class="read-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png" alt="" />
					597
					</span>
				</div>
			</div>
		</div>
		<div class="desc-box">
			<a href="https://blog.csdn.net/terryzin1985/article/details/5619481" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-searchFromBaidu-4.control\&quot;}&quot;,&quot;index&quot;:&quot;4&quot;,&quot;strategy&quot;:&quot;searchFromBaidu&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/terryzin1985/article/details/5619481&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-blog-searchFromBaidu-4.control&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-searchFromBaidu-4.control">
				<div class="desc ellipsis-online ellipsis-online-1">先自我介绍……你要是说这是自我炒作我也认了。首先说明，FXCarl是一个对3D美术一窍不同的家伙。虽然很想往技术美工方向发展了。因为是学程序出身，眼下能做的也就是写写Shaders。等到手上的项目做完，会公开始用的实时光照模型……不过那是后话了。现在只是想配合一下这两天大家讨论的热火朝天的NormalMap，在这里和占大多数的美术人员从另外一个角度来谈谈“凹凸贴图技术”首先我想说，对于凹凸贴图在计</div>
			</a>
		</div>
	</div>
</div>
<div class="recommend-item-box type_blog clearfix" data-url="https://blog.csdn.net/CSDNedu/article/details/112229692" data-report-view="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.479645.control\&quot;}&quot;,&quot;index&quot;:&quot;5&quot;,&quot;strategy&quot;:&quot;11_479645_RCMD&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/CSDNedu/article/details/112229692&quot;}">
	<div class="content-box">
		<div class="content-blog display-flex">
			<div class="title-box">
				<a href="https://blog.csdn.net/CSDNedu/article/details/112229692" class="tit ellipsis-online ellipsis-online-1" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.479645.control\&quot;}&quot;,&quot;index&quot;:&quot;5&quot;,&quot;strategy&quot;:&quot;11_479645_RCMD&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/CSDNedu/article/details/112229692&quot;}" data-report-query="utm_medium=distribute.pc_relevant.479645.control&amp;depth_1-utm_source=distribute.pc_relevant.479645.control">
					神操作！一行代码搞定一款游戏？厉害了程序员！
				</a>
			</div>
			<div class="info-box display-flex">
				<div class="info">
					<a href="https://blog.csdn.net/CSDNedu" target="_blank"><span class="blog-title">CSDN学院</span></a>
				</div>
				<div class="info display-flex">
					<span class="info-block time">01-05</span>
					<span class="info-block read"><img class="read-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png" alt="" />
					968
					</span>
				</div>
			</div>
		</div>
		<div class="desc-box">
			<a href="https://blog.csdn.net/CSDNedu/article/details/112229692" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.479645.control\&quot;}&quot;,&quot;index&quot;:&quot;5&quot;,&quot;strategy&quot;:&quot;11_479645_RCMD&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/CSDNedu/article/details/112229692&quot;}" data-report-query="utm_medium=distribute.pc_relevant.479645.control&amp;depth_1-utm_source=distribute.pc_relevant.479645.control">
				<div class="desc ellipsis-online ellipsis-online-1">一行代码能干啥？

这一款的迷宫游戏厉害了

迷宫游戏，不知道大家有没有玩过，以前非常风靡，各种大小的迷宫设计，尤其是Web版的迷宫早些年的时候非常流行，但是Python一行代码就能搞定，真的是酷毙了！



来看一下效果：



(盯住看5秒）

代码非常非常的简洁，用短单线创建无限迷宫，虽然跟真正的迷宫比还差一些，但是也算是有点感觉了。算法其实很好理解，用一个while来无限循环，整个程序设计的亮点就在虽然 import 语句在循环内移动，但是Python 并不需要每次重新导入它。代码从迷宫绘图字符之一</div>
			</a>
		</div>
	</div>
</div><div class="recommend-item-box baiduSearch clearfix" data-report-view="{&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-baidujs_title-6\&quot;}&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4242&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/w450468524/article/details/51649487&quot;,&quot;strategy&quot;:&quot;baidujs_title&quot;,&quot;ab&quot;:&quot;new&quot;,&quot;index&quot;:&quot;6&quot;}" data-flg="true">	                <div class="content-box">		                <div class="content-blog display-flex">			                  <div class="title-box">				                  <a href="https://blog.csdn.net/w450468524/article/details/51649487" target="_blank" data-report-click="{&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-baidujs_title-6\&quot;}&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4242&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/w450468524/article/details/51649487&quot;,&quot;strategy&quot;:&quot;baidujs_title&quot;,&quot;ab&quot;:&quot;new&quot;,&quot;index&quot;:&quot;6&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-blog-baidujs_title-6&amp;spm=1001.2101.3001.4242">					                <div class="tit ellipsis-online ellipsis-online-1">视差贴图(<em>parallax</em> <em>mapping</em>)学习笔记_w450468524的专栏</div>				                  </a>			                  </div>                    <div class="info-box display-flex">                      <div class="info display-flex">                        <span class="info-block">1-2</span>                      </div>                    </div>                  </div>                  <div class="desc-box">                    <a href="https://blog.csdn.net/w450468524/article/details/51649487" target="_blank" data-report-click="{&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-baidujs_title-6\&quot;}&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4242&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/w450468524/article/details/51649487&quot;,&quot;strategy&quot;:&quot;baidujs_title&quot;,&quot;ab&quot;:&quot;new&quot;,&quot;index&quot;:&quot;6&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-blog-baidujs_title-6&amp;spm=1001.2101.3001.4242">                      <div class="desc ellipsis-online ellipsis-online-1">steep <em>parallax</em> <em>mapping</em> 这次我们将深度纹理分层,每层的间隔相同,然后用一种类似于raymarch的算法,沿着视线方向往下探,每次高度下降一层,当视线与某一层的交点的高度...</div>                    </a>                  </div>                </div>              </div>
<div class="recommend-item-box type_blog clearfix" data-url="https://blog.csdn.net/zwlstc/article/details/86600762" data-report-view="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-searchFromBaidu-6.control\&quot;}&quot;,&quot;index&quot;:&quot;6&quot;,&quot;strategy&quot;:&quot;searchFromBaidu&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/zwlstc/article/details/86600762&quot;}">
	<div class="content-box">
		<div class="content-blog display-flex">
			<div class="title-box">
				<a href="https://blog.csdn.net/zwlstc/article/details/86600762" class="tit ellipsis-online ellipsis-online-1" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-searchFromBaidu-6.control\&quot;}&quot;,&quot;index&quot;:&quot;6&quot;,&quot;strategy&quot;:&quot;searchFromBaidu&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/zwlstc/article/details/86600762&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-blog-searchFromBaidu-6.control&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-searchFromBaidu-6.control">
					视差映射   <em>Parallax</em> <em>Mapping</em>
				</a>
			</div>
			<div class="info-box display-flex">
				<div class="info">
					<a href="https://blog.csdn.net/zwlstc" target="_blank"><span class="blog-title">zwlstc的博客</span></a>
				</div>
				<div class="info display-flex">
					<span class="info-block time">01-22</span>
					<span class="info-block read"><img class="read-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png" alt="" />
					587
					</span>
				</div>
			</div>
		</div>
		<div class="desc-box">
			<a href="https://blog.csdn.net/zwlstc/article/details/86600762" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-searchFromBaidu-6.control\&quot;}&quot;,&quot;index&quot;:&quot;6&quot;,&quot;strategy&quot;:&quot;searchFromBaidu&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/zwlstc/article/details/86600762&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-blog-searchFromBaidu-6.control&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-searchFromBaidu-6.control">
				<div class="desc ellipsis-online ellipsis-online-1">这种技术和法线贴图结合使用，可以给物体表面增加惊人的细节，这边只谈实现上的注意点。

首先是最简单的一种，一般不会采用的那种，但用来理解最核心的思想是极好的。



（视差映射在实现时，通常采用的是深度图而非高度图，储存的信息是当前像素凹下去的程度）

如图所示，A点即是当前片元着色器正在处理的片元位置。如果不应用任何视差映射技术，则此时应该用A的uv值去相关贴图里采样。但，现在为了体现这个点的位...</div>
			</a>
		</div>
	</div>
</div>
<div class="recommend-item-box type_download clearfix" data-url="https://download.csdn.net/download/i4053/10855430" data-report-view="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-download-searchFromBaidu-7.control\&quot;}&quot;,&quot;index&quot;:&quot;7&quot;,&quot;strategy&quot;:&quot;searchFromBaidu&quot;,&quot;dest&quot;:&quot;https://download.csdn.net/download/i4053/10855430&quot;}">
	<div class="content-box">
		<div class="content-blog display-flex">
			<div class="title-box">
				<a href="https://download.csdn.net/download/i4053/10855430" class="tit ellipsis-online ellipsis-online-1" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-download-searchFromBaidu-7.control\&quot;}&quot;,&quot;index&quot;:&quot;7&quot;,&quot;strategy&quot;:&quot;searchFromBaidu&quot;,&quot;dest&quot;:&quot;https://download.csdn.net/download/i4053/10855430&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-download-searchFromBaidu-7.control&amp;depth_1-utm_source=distribute.pc_relevant.none-task-download-searchFromBaidu-7.control">
					南邮计算机图形学skybox&amp;&amp;<em>parallax</em>; <em>mapping</em>
				</a>
			</div>
			<div class="info-box display-flex">
				<div class="info display-flex">
					<span class="info-block">12-17</span>
				</div>
			</div>
		</div>
		<div class="desc-box">
			<a href="https://download.csdn.net/download/i4053/10855430" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-download-searchFromBaidu-7.control\&quot;}&quot;,&quot;index&quot;:&quot;7&quot;,&quot;strategy&quot;:&quot;searchFromBaidu&quot;,&quot;dest&quot;:&quot;https://download.csdn.net/download/i4053/10855430&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-download-searchFromBaidu-7.control&amp;depth_1-utm_source=distribute.pc_relevant.none-task-download-searchFromBaidu-7.control">
				<div class="desc ellipsis-online ellipsis-online-1">文件内容是南邮计算机图形学的实验报告和相关代码，代码包括相关的头文件、shader文件和cpp文件。 实现内容是skybox和<em>parallax</em> <em>mapping</em>，即天空盒以及视差贴图部分。其中，在天空盒</div>
			</a>
		</div>
	</div>
</div>
<div class="recommend-item-box type_blog clearfix" data-url="https://blog.csdn.net/sck5711/article/details/4036333" data-report-view="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-searchFromBaidu-8.control\&quot;}&quot;,&quot;index&quot;:&quot;8&quot;,&quot;strategy&quot;:&quot;searchFromBaidu&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/sck5711/article/details/4036333&quot;}">
	<div class="content-box">
		<div class="content-blog display-flex">
			<div class="title-box">
				<a href="https://blog.csdn.net/sck5711/article/details/4036333" class="tit ellipsis-online ellipsis-online-1" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-searchFromBaidu-8.control\&quot;}&quot;,&quot;index&quot;:&quot;8&quot;,&quot;strategy&quot;:&quot;searchFromBaidu&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/sck5711/article/details/4036333&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-blog-searchFromBaidu-8.control&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-searchFromBaidu-8.control">
					<em>Parallax</em> <em>Mapping</em>效果
				</a>
			</div>
			<div class="info-box display-flex">
				<div class="info">
					<a href="https://blog.csdn.net/sck5711" target="_blank"><span class="blog-title">球场混混的专栏</span></a>
				</div>
				<div class="info display-flex">
					<span class="info-block time">03-30</span>
					<span class="info-block read"><img class="read-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png" alt="" />
					590
					</span>
				</div>
			</div>
		</div>
		<div class="desc-box">
			<a href="https://blog.csdn.net/sck5711/article/details/4036333" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-searchFromBaidu-8.control\&quot;}&quot;,&quot;index&quot;:&quot;8&quot;,&quot;strategy&quot;:&quot;searchFromBaidu&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/sck5711/article/details/4036333&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-blog-searchFromBaidu-8.control&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-searchFromBaidu-8.control">
				<div class="desc ellipsis-online ellipsis-online-1"> 前几天在shadertech网站上看到一个获金牌的效果，叫relief <em>mapping</em>，其中包含relief texture <em>mapping</em>和steep <em>parallax</em> <em>mapping</em>，效果很好，于是开始琢磨着如何来实现其效果，由于steep <em>parallax</em> <em>mapping</em>需要ps3.0的支持，relief texture <em>mapping</em>需要二叉树的搜索，都对资源需要比较高，所以暂时实现</div>
			</a>
		</div>
	</div>
</div>
<div class="recommend-item-box type_blog clearfix" data-url="https://blog.csdn.net/cuckon/article/details/6347244" data-report-view="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-9.control\&quot;}&quot;,&quot;index&quot;:&quot;9&quot;,&quot;strategy&quot;:&quot;BlogCommendFromMachineLearnPai2&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/cuckon/article/details/6347244&quot;}">
	<div class="content-box">
		<div class="content-blog display-flex">
			<div class="title-box">
				<a href="https://blog.csdn.net/cuckon/article/details/6347244" class="tit ellipsis-online ellipsis-online-1" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-9.control\&quot;}&quot;,&quot;index&quot;:&quot;9&quot;,&quot;strategy&quot;:&quot;BlogCommendFromMachineLearnPai2&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/cuckon/article/details/6347244&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-9.control&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-9.control">
					Steep <em>Parallax</em> <em>Mapping</em>
				</a>
			</div>
			<div class="info-box display-flex">
				<div class="info">
					<a href="https://blog.csdn.net/cuckon" target="_blank"><span class="blog-title">机器猫的CG空间</span></a>
				</div>
				<div class="info display-flex">
					<span class="info-block time">04-23</span>
					<span class="info-block read"><img class="read-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png" alt="" />
					1252
					</span>
				</div>
			</div>
		</div>
		<div class="desc-box">
			<a href="https://blog.csdn.net/cuckon/article/details/6347244" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-9.control\&quot;}&quot;,&quot;index&quot;:&quot;9&quot;,&quot;strategy&quot;:&quot;BlogCommendFromMachineLearnPai2&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/cuckon/article/details/6347244&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-9.control&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-9.control">
				<div class="desc ellipsis-online ellipsis-online-1">&lt;br /&gt;&lt;br /&gt; &lt;br /&gt;今儿个终于实现.&lt;br /&gt; &lt;br /&gt;现在做出的是一个非常简单的雏形，至于Fake AO和Shadow都还没有做&lt;br /&gt; &lt;br /&gt;diannao huai le buneng dahanzile. ruguo xuyao xuandaima gaosu wo. =.=</div>
			</a>
		</div>
	</div>
</div>
<div class="recommend-item-box type_blog clearfix" data-url="https://blog.csdn.net/wodownload2/article/details/100121445" data-report-view="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-10.control\&quot;}&quot;,&quot;index&quot;:&quot;10&quot;,&quot;strategy&quot;:&quot;BlogCommendFromMachineLearnPai2&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/wodownload2/article/details/100121445&quot;}">
	<div class="content-box">
		<div class="content-blog display-flex">
			<div class="title-box">
				<a href="https://blog.csdn.net/wodownload2/article/details/100121445" class="tit ellipsis-online ellipsis-online-1" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-10.control\&quot;}&quot;,&quot;index&quot;:&quot;10&quot;,&quot;strategy&quot;:&quot;BlogCommendFromMachineLearnPai2&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/wodownload2/article/details/100121445&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-10.control&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-10.control">
					learnopengl——<em>Parallax</em> <em>Mapping</em>
				</a>
			</div>
			<div class="info-box display-flex">
				<div class="info">
					<a href="https://blog.csdn.net/wodownload2" target="_blank"><span class="blog-title">小孔明的专栏</span></a>
				</div>
				<div class="info display-flex">
					<span class="info-block time">08-28</span>
					<span class="info-block read"><img class="read-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png" alt="" />
					77
					</span>
				</div>
			</div>
		</div>
		<div class="desc-box">
			<a href="https://blog.csdn.net/wodownload2/article/details/100121445" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-10.control\&quot;}&quot;,&quot;index&quot;:&quot;10&quot;,&quot;strategy&quot;:&quot;BlogCommendFromMachineLearnPai2&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/wodownload2/article/details/100121445&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-10.control&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-10.control">
				<div class="desc ellipsis-online ellipsis-online-1">https://learnopengl.com/Advanced-Lighting/<em>Parallax</em>-<em>Mapping</em>

</div>
			</a>
		</div>
	</div>
</div>
<div class="recommend-item-box type_blog clearfix" data-url="https://blog.csdn.net/puppet_master/article/details/57125379" data-report-view="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-11.control\&quot;}&quot;,&quot;index&quot;:&quot;11&quot;,&quot;strategy&quot;:&quot;BlogCommendFromMachineLearnPai2&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/puppet_master/article/details/57125379&quot;}">
	<div class="content-box">
		<div class="content-blog display-flex">
			<div class="title-box">
				<a href="https://blog.csdn.net/puppet_master/article/details/57125379" class="tit ellipsis-online ellipsis-online-1" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-11.control\&quot;}&quot;,&quot;index&quot;:&quot;11&quot;,&quot;strategy&quot;:&quot;BlogCommendFromMachineLearnPai2&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/puppet_master/article/details/57125379&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-11.control&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-11.control">
					Unity Shader-法线贴图（Normal Map）与视差贴图（<em>Parallax</em> Map）
				</a>
			</div>
			<div class="info-box display-flex">
				<div class="info">
					<a href="https://blog.csdn.net/puppet_master" target="_blank"><span class="blog-title">puppet_master的专栏</span></a>
				</div>
				<div class="info display-flex">
					<span class="info-block time">03-15</span>
					<span class="info-block read"><img class="read-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png" alt="" />
					1万+
					</span>
				</div>
			</div>
		</div>
		<div class="desc-box">
			<a href="https://blog.csdn.net/puppet_master/article/details/57125379" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-11.control\&quot;}&quot;,&quot;index&quot;:&quot;11&quot;,&quot;strategy&quot;:&quot;BlogCommendFromMachineLearnPai2&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/puppet_master/article/details/57125379&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-11.control&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-11.control">
				<div class="desc ellipsis-online ellipsis-online-1">简介


法线贴图技术至今一直是游戏增强画面效果的利器之一。随着移动设备的性能越来越好，曾经的在PC平台的各种高级技术在移动平台也都开始大规模使用了。最近印象最深刻的就是《镇魔曲》，场景地形全部都加了法线，可以说是无所不用其极了....之前还没见过哪个游戏在移动平台敢这么大规模地使用法线。而且人模的渲染也是走的次时代的流程。不得不说大厂就是牛，本屌丝只能望别人家的游戏兴叹啊。本篇文章主要是研</div>
			</a>
		</div>
	</div>
</div>
<div class="recommend-item-box type_blog clearfix" data-url="https://blog.csdn.net/tarkey/article/details/357912" data-report-view="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-searchFromBaidu-12.control\&quot;}&quot;,&quot;index&quot;:&quot;12&quot;,&quot;strategy&quot;:&quot;searchFromBaidu&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/tarkey/article/details/357912&quot;}">
	<div class="content-box">
		<div class="content-blog display-flex">
			<div class="title-box">
				<a href="https://blog.csdn.net/tarkey/article/details/357912" class="tit ellipsis-online ellipsis-online-1" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-searchFromBaidu-12.control\&quot;}&quot;,&quot;index&quot;:&quot;12&quot;,&quot;strategy&quot;:&quot;searchFromBaidu&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/tarkey/article/details/357912&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-blog-searchFromBaidu-12.control&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-searchFromBaidu-12.control">
					初探<em>Parallax</em> <em>Mapping</em>效果。
				</a>
			</div>
			<div class="info-box display-flex">
				<div class="info">
					<a href="https://blog.csdn.net/tarkey" target="_blank"><span class="blog-title">tarkey的专栏</span></a>
				</div>
				<div class="info display-flex">
					<span class="info-block time">04-22</span>
					<span class="info-block read"><img class="read-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png" alt="" />
					3422
					</span>
				</div>
			</div>
		</div>
		<div class="desc-box">
			<a href="https://blog.csdn.net/tarkey/article/details/357912" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-searchFromBaidu-12.control\&quot;}&quot;,&quot;index&quot;:&quot;12&quot;,&quot;strategy&quot;:&quot;searchFromBaidu&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/tarkey/article/details/357912&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-blog-searchFromBaidu-12.control&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-searchFromBaidu-12.control">
				<div class="desc ellipsis-online ellipsis-online-1">前几天在shadertech网站上看到一个获金牌的效果，叫relief <em>mapping</em>，其中包含relief texture <em>mapping</em>和steep <em>parallax</em> <em>mapping</em>，效果非常好，于是开始琢磨着如何来实现其效果，由于steep <em>parallax</em> <em>mapping</em>需要ps3.0的支持，relief texture <em>mapping</em>需要二叉树的搜索，都对资源要求比较高，所以暂时实现了p</div>
			</a>
		</div>
	</div>
</div>
<div class="recommend-item-box type_blog clearfix" data-url="https://blog.csdn.net/CSDNedu/article/details/112229231" data-report-view="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.479648.control\&quot;}&quot;,&quot;index&quot;:&quot;13&quot;,&quot;strategy&quot;:&quot;11_479648_RCMD&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/CSDNedu/article/details/112229231&quot;}">
	<div class="content-box">
		<div class="content-blog display-flex">
			<div class="title-box">
				<a href="https://blog.csdn.net/CSDNedu/article/details/112229231" class="tit ellipsis-online ellipsis-online-1" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.479648.control\&quot;}&quot;,&quot;index&quot;:&quot;13&quot;,&quot;strategy&quot;:&quot;11_479648_RCMD&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/CSDNedu/article/details/112229231&quot;}" data-report-query="utm_medium=distribute.pc_relevant.479648.control&amp;depth_1-utm_source=distribute.pc_relevant.479648.control">
					技术破局：AI程序员2021如何跳出舒适圈？！
				</a>
			</div>
			<div class="info-box display-flex">
				<div class="info">
					<a href="https://blog.csdn.net/CSDNedu" target="_blank"><span class="blog-title">CSDN学院</span></a>
				</div>
				<div class="info display-flex">
					<span class="info-block time">01-05</span>
					<span class="info-block read"><img class="read-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png" alt="" />
					1296
					</span>
				</div>
			</div>
		</div>
		<div class="desc-box">
			<a href="https://blog.csdn.net/CSDNedu/article/details/112229231" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.479648.control\&quot;}&quot;,&quot;index&quot;:&quot;13&quot;,&quot;strategy&quot;:&quot;11_479648_RCMD&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/CSDNedu/article/details/112229231&quot;}" data-report-query="utm_medium=distribute.pc_relevant.479648.control&amp;depth_1-utm_source=distribute.pc_relevant.479648.control">
				<div class="desc ellipsis-online ellipsis-online-1">近日，IDC调研机构与浪潮联合发布《2020-2021 中国人工智能计算力发展评估报告 》。报告显示，预计2020 年中国AI市场规模将达到 62.7亿美元，2019~2024 年的年复合增长率为 30.4%，中国成为全球各个区域里面AI的投资发展最快的一个国家。

报告从AI算力产业发展趋势、市场规模、区域算力分布和行业AI算力保有程度等多个角度进行全面综合评估，旨在评估中国人工智能发展的现状，为推动产业AI化发展提供极具价值的参考依据和行动建议。

同时小编注意到据 BOSS直聘发布的《2020人才资.</div>
			</a>
		</div>
	</div>
</div>
<div class="recommend-item-box type_blog clearfix" data-url="https://blog.csdn.net/a3070173/article/details/4169331" data-report-view="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-searchFromBaidu-14.control\&quot;}&quot;,&quot;index&quot;:&quot;14&quot;,&quot;strategy&quot;:&quot;searchFromBaidu&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/a3070173/article/details/4169331&quot;}">
	<div class="content-box">
		<div class="content-blog display-flex">
			<div class="title-box">
				<a href="https://blog.csdn.net/a3070173/article/details/4169331" class="tit ellipsis-online ellipsis-online-1" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-searchFromBaidu-14.control\&quot;}&quot;,&quot;index&quot;:&quot;14&quot;,&quot;strategy&quot;:&quot;searchFromBaidu&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/a3070173/article/details/4169331&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-blog-searchFromBaidu-14.control&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-searchFromBaidu-14.control">
					<em>Parallax</em><em>Mapping</em>
				</a>
			</div>
			<div class="info-box display-flex">
				<div class="info">
					<a href="https://blog.csdn.net/a3070173" target="_blank"><span class="blog-title">red woft的专栏</span></a>
				</div>
				<div class="info display-flex">
					<span class="info-block time">05-11</span>
					<span class="info-block read"><img class="read-img" src="https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png" alt="" />
					1149
					</span>
				</div>
			</div>
		</div>
		<div class="desc-box">
			<a href="https://blog.csdn.net/a3070173/article/details/4169331" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-blog-searchFromBaidu-14.control\&quot;}&quot;,&quot;index&quot;:&quot;14&quot;,&quot;strategy&quot;:&quot;searchFromBaidu&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/a3070173/article/details/4169331&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-blog-searchFromBaidu-14.control&amp;depth_1-utm_source=distribute.pc_relevant.none-task-blog-searchFromBaidu-14.control">
				<div class="desc ellipsis-online ellipsis-online-1"><em>Parallax</em><em>Mapping</em>是传统Bump<em>Mapping</em>的一个变种,其原理是根据表面高度纹理和当前视点朝向对纹理坐标进行偏移,以为凹凸表面添加视差效果.优点:相对于更为复杂而开销巨大的技术(Relief <em>Mapping</em>和Displacement <em>Mapping</em>),<em>Parallax</em> <em>Mapping</em>以较少的开销完全对视差效果的良好近似.避免了Relef<em>Mapping</em>庞大计算量和Displ</div>
			</a>
		</div>
	</div>
</div>
<div class="recommend-item-box type_download clearfix" data-url="https://download.csdn.net/download/dijkstra_cloud/8561291" data-report-view="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-download-searchFromBaidu-15.control\&quot;}&quot;,&quot;index&quot;:&quot;15&quot;,&quot;strategy&quot;:&quot;searchFromBaidu&quot;,&quot;dest&quot;:&quot;https://download.csdn.net/download/dijkstra_cloud/8561291&quot;}">
	<div class="content-box">
		<div class="content-blog display-flex">
			<div class="title-box">
				<a href="https://download.csdn.net/download/dijkstra_cloud/8561291" class="tit ellipsis-online ellipsis-online-1" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-download-searchFromBaidu-15.control\&quot;}&quot;,&quot;index&quot;:&quot;15&quot;,&quot;strategy&quot;:&quot;searchFromBaidu&quot;,&quot;dest&quot;:&quot;https://download.csdn.net/download/dijkstra_cloud/8561291&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-download-searchFromBaidu-15.control&amp;depth_1-utm_source=distribute.pc_relevant.none-task-download-searchFromBaidu-15.control">
					视差贴图<em>Parallax</em> <em>Mapping</em>
				</a>
			</div>
			<div class="info-box display-flex">
				<div class="info display-flex">
					<span class="info-block">04-03</span>
				</div>
			</div>
		</div>
		<div class="desc-box">
			<a href="https://download.csdn.net/download/dijkstra_cloud/8561291" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-download-searchFromBaidu-15.control\&quot;}&quot;,&quot;index&quot;:&quot;15&quot;,&quot;strategy&quot;:&quot;searchFromBaidu&quot;,&quot;dest&quot;:&quot;https://download.csdn.net/download/dijkstra_cloud/8561291&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-download-searchFromBaidu-15.control&amp;depth_1-utm_source=distribute.pc_relevant.none-task-download-searchFromBaidu-15.control">
				<div class="desc ellipsis-online ellipsis-online-1">一个简单的视差贴图实现，使用了opengl。在codeblocks+gcc环境下编译的</div>
			</a>
		</div>
	</div>
</div>
<div class="recommend-item-box type_download clearfix" data-url="https://download.csdn.net/download/dllglvzhenfeng/13699547" data-report-view="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-download-BlogCommendHotData-16.control\&quot;}&quot;,&quot;index&quot;:&quot;16&quot;,&quot;strategy&quot;:&quot;BlogCommendHotData&quot;,&quot;dest&quot;:&quot;https://download.csdn.net/download/dllglvzhenfeng/13699547&quot;}">
	<div class="content-box">
		<div class="content-blog display-flex">
			<div class="title-box">
				<a href="https://download.csdn.net/download/dllglvzhenfeng/13699547" class="tit ellipsis-online ellipsis-online-1" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-download-BlogCommendHotData-16.control\&quot;}&quot;,&quot;index&quot;:&quot;16&quot;,&quot;strategy&quot;:&quot;BlogCommendHotData&quot;,&quot;dest&quot;:&quot;https://download.csdn.net/download/dllglvzhenfeng/13699547&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-download-BlogCommendHotData-16.control&amp;depth_1-utm_source=distribute.pc_relevant.none-task-download-BlogCommendHotData-16.control">
					三级Linux应用与开发技术考试大纲（2021年版）.pdf
				</a>
			</div>
			<div class="info-box display-flex">
				<div class="info display-flex">
					<span class="info-block">12-16</span>
				</div>
			</div>
		</div>
		<div class="desc-box">
			<a href="https://download.csdn.net/download/dllglvzhenfeng/13699547" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-download-BlogCommendHotData-16.control\&quot;}&quot;,&quot;index&quot;:&quot;16&quot;,&quot;strategy&quot;:&quot;BlogCommendHotData&quot;,&quot;dest&quot;:&quot;https://download.csdn.net/download/dllglvzhenfeng/13699547&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-download-BlogCommendHotData-16.control&amp;depth_1-utm_source=distribute.pc_relevant.none-task-download-BlogCommendHotData-16.control">
				<div class="desc ellipsis-online ellipsis-online-1">三级Linux应用与开发技术考试大纲（2021年版）.pdf</div>
			</a>
		</div>
	</div>
</div>
<div class="recommend-item-box type_download clearfix" data-url="https://download.csdn.net/download/weixin_43960044/12533382" data-report-view="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-download-BlogCommendHotData-17.control\&quot;}&quot;,&quot;index&quot;:&quot;17&quot;,&quot;strategy&quot;:&quot;BlogCommendHotData&quot;,&quot;dest&quot;:&quot;https://download.csdn.net/download/weixin_43960044/12533382&quot;}">
	<div class="content-box">
		<div class="content-blog display-flex">
			<div class="title-box">
				<a href="https://download.csdn.net/download/weixin_43960044/12533382" class="tit ellipsis-online ellipsis-online-1" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-download-BlogCommendHotData-17.control\&quot;}&quot;,&quot;index&quot;:&quot;17&quot;,&quot;strategy&quot;:&quot;BlogCommendHotData&quot;,&quot;dest&quot;:&quot;https://download.csdn.net/download/weixin_43960044/12533382&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-download-BlogCommendHotData-17.control&amp;depth_1-utm_source=distribute.pc_relevant.none-task-download-BlogCommendHotData-17.control">
					python大作业--爬虫（完美应付大作业）.zip
				</a>
			</div>
			<div class="info-box display-flex">
				<div class="info display-flex">
					<span class="info-block">06-18</span>
				</div>
			</div>
		</div>
		<div class="desc-box">
			<a href="https://download.csdn.net/download/weixin_43960044/12533382" target="_blank" data-report-click="{&quot;ab&quot;:&quot;new&quot;,&quot;mod&quot;:&quot;popu_387&quot;,&quot;extra&quot;:&quot;{\&quot;utm_medium\&quot;:\&quot;distribute.pc_relevant.none-task-download-BlogCommendHotData-17.control\&quot;}&quot;,&quot;index&quot;:&quot;17&quot;,&quot;strategy&quot;:&quot;BlogCommendHotData&quot;,&quot;dest&quot;:&quot;https://download.csdn.net/download/weixin_43960044/12533382&quot;}" data-report-query="utm_medium=distribute.pc_relevant.none-task-download-BlogCommendHotData-17.control&amp;depth_1-utm_source=distribute.pc_relevant.none-task-download-BlogCommendHotData-17.control">
				<div class="desc ellipsis-online ellipsis-online-1">python大作业分享--30多个项目任你选（由于上传大小限制分多个文件上传。爬虫：https://download.csdn.net/download/weixin_43960044/1253338</div>
			</a>
		</div>
	</div>
</div>
            </div>
            <div class="template-box">
                <span>©️2020 CSDN</span>
                <span>皮肤主题: 大白</span>
                <span> 设计师:CSDN官方博客</span>
                <span>
                    <a href="https://blog.csdn.net/" class="back-home c-blue c-blue-hover c-blue-focus">返回首页</a>
                </span>
            </div>
<div class="blog-footer-bottom" style="margin-top:10px;">
        <div id="copyright-box" class="">
          <div id="csdn-copyright-footer" class="column small">
            <ul class="footer-column-t">
            <li>
              <a href="//www.csdn.net/company/index.html#about" target="_blank">关于我们</a>
            </li>
            <li>
              <a href="//www.csdn.net/company/index.html#recruit" target="_blank">招贤纳士</a>
            </li>
            <li>
              <a href="//www.csdn.net/company/index.html#advertisement" target="_blank">广告服务</a>
            </li>
            <li>
              <a href="https://plugin.csdn.net/" target="_blank">开发助手</a>
            </li>
            <li>
              <img src="//g.csdnimg.cn/common/csdn-footer/images/tel.png" alt="" />
              <span>400-660-0108</span>
            </li>
            <li>
              <img src="//g.csdnimg.cn/common/csdn-footer/images/email.png" alt="" />
              <a href="mailto:webmaster@csdn.net" target="_blank">kefu@csdn.net</a>
            </li>
            <li>
              <img src="//g.csdnimg.cn/common/csdn-footer/images/cs.png" alt="" />
              <a href="https://csdn.s2.udesk.cn/im_client/?web_plugin_id=29181" target="_blank">在线客服</a>
            </li>
            <li>
              工作时间 8:30-22:00
            </li>
          </ul>
            <ul class="footer-column-b">
            <li><img src="//g.csdnimg.cn/common/csdn-footer/images/badge.png" alt="" /><a href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=11010502030143" rel="noreferrer" target="_blank">公安备案号11010502030143</a></li>
            <li><a href="http://beian.miit.gov.cn/publish/query/indexFirst.action" rel="noreferrer" target="_blank">京ICP备19004658号</a></li>
            <li><a href="https://csdnimg.cn/release/live_fe/culture_license.png" rel="noreferrer" target="_blank">京网文〔2020〕1039-165号</a></li>
            <li><a href="https://csdnimg.cn/cdn/content-toolbar/csdn-ICP.png" target="_blank">经营性网站备案信息</a></li>
            <li><a href="http://www.bjjubao.org/" target="_blank">北京互联网违法和不良信息举报中心</a></li>
            <li><a href="http://www.cyberpolice.cn/" target="_blank">网络110报警服务</a></li>
            <li><a href="http://www.12377.cn/" target="_blank">中国互联网举报中心</a></li>
            <li><a href="https://download.csdn.net/index.php/tutelage/" target="_blank">家长监护</a></li>
            <li><a href="https://chrome.google.com/webstore/detail/csdn%E5%BC%80%E5%8F%91%E8%80%85%E5%8A%A9%E6%89%8B/kfkdboecolemdjodhmhmcibjocfopejo?hl=zh-CN" target="_blank">Chrome商店下载</a></li>
            <li>©1999-2021北京创新乐知网络技术有限公司</li>
            <li><a href="https://www.csdn.net/company/index.html#statement" target="_blank">版权与免责声明</a></li>
            <li><a href="https://blog.csdn.net/blogdevteam/article/details/90369522" target="_blank">版权申诉</a></li>
          </ul>
          </div>
        </div>
      </div>
<script src="https://g.csdnimg.cn/common/csdn-footer/csdn-footer.js" data-isfootertrack="false" type="text/javascript"></script>
<script type="text/javascript">
    window.csdn.csdnFooter.options = {
        el: '.blog-footer-bottom',
        type: 2
    }
</script>        </main>
<aside class="blog_container_aside" style="height: auto !important;">
    <div id="asideProfile" class="aside-box">
    <div class="profile-intro d-flex">
        <div class="avatar-box d-flex justify-content-center flex-column">
            <a href="https://blog.csdn.net/soilwork" data-report-click="{&quot;mod&quot;:&quot;popu_379&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4121&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork&quot;,&quot;ab&quot;:&quot;new&quot;}">
                <img src="https://profile.csdnimg.cn/7/D/F/3_soilwork" class="avatar_pic" />
            </a>
        </div>
        <div class="user-info d-flex flex-column profile-intro-name-box">
            <div class="profile-intro-name-boxTop">
                <a href="https://blog.csdn.net/soilwork" class="" id="uid" title="soilwork" data-report-click="{&quot;mod&quot;:&quot;popu_379&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4122&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork&quot;,&quot;ab&quot;:&quot;new&quot;}">
                    <span class="name " username="soilwork">soilwork</span>
                </a>
                <span>
                </span>
                <span class="flag expert-blog">
                <span class="bubble">CSDN认证博客专家</span>
                </span>
                <span class="flag company-blog">
                <span class="bubble">CSDN认证企业博客</span>
                </span>
            </div>
            <div class="profile-intro-name-boxFooter">
                <span class="personal-home-page personal-home-years">码龄17年</span>
                    <span class="personal-home-page">
                    <a class="personal-home-certification" href="https://blog.csdn.net/soilwork?utm_source=14998968" target="_blank" title="暂无认证">
                    <img src="https://csdnimg.cn/identity/nocErtification.png" alt="" />
                    暂无认证
                    </a>
                    </span>
            </div>
        </div>
    </div>
    <div class="data-info d-flex item-tiling">
        <dl class="text-center" title="116">
            <a href="https://blog.csdn.net/soilwork" data-report-click="{&quot;mod&quot;:&quot;1598321000_001&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4310&quot;}" data-report-query="t=1">  
                <dt><span class="count">116</span></dt>
                <dd class="font">原创</dd>
            </a>
        </dl>
        <dl class="text-center" data-report-click="{&quot;mod&quot;:&quot;1598321000_002&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4311&quot;}" title="186968">
            <a href="https://blog.csdn.net/rank/writing_rank" target="_blank">
                <dt><span class="count">18万+</span></dt>
                <dd class="font">周排名</dd>
            </a>
        </dl>
        <dl class="text-center" title="6539">
            <a href="https://blog.csdn.net/rank/writing_rank_total" data-report-click="{&quot;mod&quot;:&quot;1598321000_003&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4312&quot;}" target="_blank">
                <dt><span class="count">6539</span></dt>
                <dd class="font">总排名</dd>
            </a>
        </dl>
        <dl class="text-center" style="min-width:58px" title="710646">  
            <dt><span class="count">71万+</span></dt>
            <dd>访问</dd>
        </dl>
        <dl class="text-center" title="6级,点击查看等级说明">
            <dt><a href="https://blog.csdn.net/home/help.html#level" target="_blank">
                <img class="level" src="https://csdnimg.cn/identity/blog6.png" />
            </a>
            </dt>
            <dd>等级</dd>
        </dl>
    </div>
    <div class="item-rank"></div>
    <div class="data-info d-flex item-tiling">
        <dl class="text-center" title="8573">
            <dt><span class="count">8573</span></dt>
            <dd>积分</dd>
        </dl>
         <dl class="text-center" id="fanBox" title="266">
            <dt><span class="count" id="fan">266</span></dt>
            <dd>粉丝</dd>
        </dl>
        <dl class="text-center" title="15">
            <dt><span class="count">15</span></dt>
            <dd>获赞</dd>
        </dl>
        <dl class="text-center" title="520">
            <dt><span class="count">520</span></dt>
            <dd>评论</dd>
        </dl>
        <dl class="text-center" title="10">
            <dt><span class="count">10</span></dt>
            <dd>收藏</dd>
        </dl>
    </div>
    <div class="profile-intro-name-boxOpration">
        <div class="opt-letter-watch-box">
        <a class="bt-button personal-letter" href="https://im.csdn.net/chat/soilwork" target="_blank" rel="noopener">私信</a>
        </div>
        <div class="opt-letter-watch-box"> 
            <a class="personal-watch bt-button" id="btnAttent">关注</a>  
        </div>
    </div>
</div>
<div id="asideSearchArticle" class="aside-box">
	<div class="aside-content search-comter">
    <div class="aside-search aside-search-blog">         
        <input type="text" class="input-serch-blog" name="" autocomplete="off" value="" id="search-blog-words" placeholder="搜博主文章" />
        <a class="btn-search-blog">
                    <img src="//csdnimg.cn/cdn/content-toolbar/csdn-sou.png?v=1587021042" />
        </a>
    </div>
    </div>
</div>


<div id="asideHotArticle" class="aside-box">
	<h3 class="aside-title">热门文章</h3>
	<div class="aside-content">
		<ul class="hotArticle-list">
			<li>
				<a href="https://blog.csdn.net/soilwork/article/details/1447346" target="_blank" data-report-click="{&quot;mod&quot;:&quot;popu_541&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4139&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/article/details/1447346&quot;,&quot;ab&quot;:&quot;new&quot;}">
				学习quaternion的一点点笔记
					<img src="https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png" alt="" />
					<span class="read">27333</span>
                </a>
			</li>
			<li>
				<a href="https://blog.csdn.net/soilwork/article/details/1223830" target="_blank" data-report-click="{&quot;mod&quot;:&quot;popu_541&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4139&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/article/details/1223830&quot;,&quot;ab&quot;:&quot;new&quot;}">
				XNA教程（一）
					<img src="https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png" alt="" />
					<span class="read">26451</span>
                </a>
			</li>
			<li>
				<a href="https://blog.csdn.net/soilwork/article/details/1548490" target="_blank" data-report-click="{&quot;mod&quot;:&quot;popu_541&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4139&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/article/details/1548490&quot;,&quot;ab&quot;:&quot;new&quot;}">
				水面渲染小结
					<img src="https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png" alt="" />
					<span class="read">19428</span>
                </a>
			</li>
			<li>
				<a href="https://blog.csdn.net/soilwork/article/details/3731645" target="_blank" data-report-click="{&quot;mod&quot;:&quot;popu_541&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4139&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/article/details/3731645&quot;,&quot;ab&quot;:&quot;new&quot;}">
				游戏程序员养成计划
					<img src="https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png" alt="" />
					<span class="read">19013</span>
                </a>
			</li>
			<li>
				<a href="https://blog.csdn.net/soilwork/article/details/1408299" target="_blank" data-report-click="{&quot;mod&quot;:&quot;popu_541&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4139&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/article/details/1408299&quot;,&quot;ab&quot;:&quot;new&quot;}">
				《The Complete Effect and HLSL Guide》翻译连载（二）
					<img src="https://csdnimg.cn/release/blogv2/dist/pc/img/readCountWhite.png" alt="" />
					<span class="read">14132</span>
                </a>
			</li>
		</ul>
	</div>
</div>
<div id="asideCategory" class="aside-box flexible-box">
    <h3 class="aside-title">分类专栏</h3>
    <div class="aside-content">
        <ul>
            <li class="">
                <a class="clearfix" target="_blank" href="https://blog.csdn.net/soilwork/category_207496.html" data-report-click="{&quot;mod&quot;:&quot;popu_537&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4137&quot;,&quot;strategy&quot;:&quot;pc付费专栏左侧入口&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/category_207496.html&quot;,&quot;ab&quot;:&quot;new&quot;}">
                    <img src="https://img-blog.csdnimg.cn/20201014180756757.png?x-oss-process=image/resize,m_fixed,h_64,w_64" alt="" onerror="this.src='https://img-blog.csdnimg.cn/20201014180756922.png?x-oss-process=image/resize,m_fixed,h_64,w_64'" />
                    <span class="title oneline">
                        <span class="text"> XNA &amp; MDX</span>
                    </span>
                    <span class="count float-right">17篇</span>
                </a>
            </li>
            <li class="">
                <a class="clearfix" target="_blank" href="https://blog.csdn.net/soilwork/category_489902.html" data-report-click="{&quot;mod&quot;:&quot;popu_537&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4137&quot;,&quot;strategy&quot;:&quot;pc付费专栏左侧入口&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/category_489902.html&quot;,&quot;ab&quot;:&quot;new&quot;}">
                    <img src="https://img-blog.csdnimg.cn/20201014180756927.png?x-oss-process=image/resize,m_fixed,h_64,w_64" alt="" onerror="this.src='https://img-blog.csdnimg.cn/20201014180756922.png?x-oss-process=image/resize,m_fixed,h_64,w_64'" />
                    <span class="title oneline">
                        <span class="text">c#</span>
                    </span>
                    <span class="count float-right">6篇</span>
                </a>
            </li>
            <li class="">
                <a class="clearfix" target="_blank" href="https://blog.csdn.net/soilwork/category_216383.html" data-report-click="{&quot;mod&quot;:&quot;popu_537&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4137&quot;,&quot;strategy&quot;:&quot;pc付费专栏左侧入口&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/category_216383.html&quot;,&quot;ab&quot;:&quot;new&quot;}">
                    <img src="https://img-blog.csdnimg.cn/20201014180756927.png?x-oss-process=image/resize,m_fixed,h_64,w_64" alt="" onerror="this.src='https://img-blog.csdnimg.cn/20201014180756922.png?x-oss-process=image/resize,m_fixed,h_64,w_64'" />
                    <span class="title oneline">
                        <span class="text">DirectX 10</span>
                    </span>
                    <span class="count float-right">6篇</span>
                </a>
            </li>
            <li class="">
                <a class="clearfix" target="_blank" href="https://blog.csdn.net/soilwork/category_522906.html" data-report-click="{&quot;mod&quot;:&quot;popu_537&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4137&quot;,&quot;strategy&quot;:&quot;pc付费专栏左侧入口&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/category_522906.html&quot;,&quot;ab&quot;:&quot;new&quot;}">
                    <img src="https://img-blog.csdnimg.cn/20201014180756918.png?x-oss-process=image/resize,m_fixed,h_64,w_64" alt="" onerror="this.src='https://img-blog.csdnimg.cn/20201014180756922.png?x-oss-process=image/resize,m_fixed,h_64,w_64'" />
                    <span class="title oneline">
                        <span class="text">Engine Design</span>
                    </span>
                    <span class="count float-right">11篇</span>
                </a>
            </li>
            <li class="">
                <a class="clearfix" target="_blank" href="https://blog.csdn.net/soilwork/category_172080.html" data-report-click="{&quot;mod&quot;:&quot;popu_537&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4137&quot;,&quot;strategy&quot;:&quot;pc付费专栏左侧入口&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/category_172080.html&quot;,&quot;ab&quot;:&quot;new&quot;}">
                    <img src="https://img-blog.csdnimg.cn/20201014180756922.png?x-oss-process=image/resize,m_fixed,h_64,w_64" alt="" onerror="this.src='https://img-blog.csdnimg.cn/20201014180756922.png?x-oss-process=image/resize,m_fixed,h_64,w_64'" />
                    <span class="title oneline">
                        <span class="text">GPU程序设计</span>
                    </span>
                    <span class="count float-right">19篇</span>
                </a>
            </li>
            <li class="">
                <a class="clearfix" target="_blank" href="https://blog.csdn.net/soilwork/category_155687.html" data-report-click="{&quot;mod&quot;:&quot;popu_537&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4137&quot;,&quot;strategy&quot;:&quot;pc付费专栏左侧入口&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/category_155687.html&quot;,&quot;ab&quot;:&quot;new&quot;}">
                    <img src="https://img-blog.csdnimg.cn/20201014180756930.png?x-oss-process=image/resize,m_fixed,h_64,w_64" alt="" onerror="this.src='https://img-blog.csdnimg.cn/20201014180756922.png?x-oss-process=image/resize,m_fixed,h_64,w_64'" />
                    <span class="title oneline">
                        <span class="text">Managed DirectX Kick Start翻译</span>
                    </span>
                    <span class="count float-right">18篇</span>
                </a>
            </li>
            <li class="">
                <a class="clearfix" target="_blank" href="https://blog.csdn.net/soilwork/category_257400.html" data-report-click="{&quot;mod&quot;:&quot;popu_537&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4137&quot;,&quot;strategy&quot;:&quot;pc付费专栏左侧入口&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/category_257400.html&quot;,&quot;ab&quot;:&quot;new&quot;}">
                    <img src="https://img-blog.csdnimg.cn/20201014180756922.png?x-oss-process=image/resize,m_fixed,h_64,w_64" alt="" onerror="this.src='https://img-blog.csdnimg.cn/20201014180756922.png?x-oss-process=image/resize,m_fixed,h_64,w_64'" />
                    <span class="title oneline">
                        <span class="text">The Complete Effect and HLSL Guide连载</span>
                    </span>
                    <span class="count float-right">14篇</span>
                </a>
            </li>
            <li class="">
                <a class="clearfix" target="_blank" href="https://blog.csdn.net/soilwork/category_263700.html" data-report-click="{&quot;mod&quot;:&quot;popu_537&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4137&quot;,&quot;strategy&quot;:&quot;pc付费专栏左侧入口&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/category_263700.html&quot;,&quot;ab&quot;:&quot;new&quot;}">
                    <img src="https://img-blog.csdnimg.cn/20201014180756922.png?x-oss-process=image/resize,m_fixed,h_64,w_64" alt="" onerror="this.src='https://img-blog.csdnimg.cn/20201014180756922.png?x-oss-process=image/resize,m_fixed,h_64,w_64'" />
                    <span class="title oneline">
                        <span class="text">图形学、几何</span>
                    </span>
                    <span class="count float-right">7篇</span>
                </a>
            </li>
            <li class="">
                <a class="clearfix" target="_blank" href="https://blog.csdn.net/soilwork/category_159453.html" data-report-click="{&quot;mod&quot;:&quot;popu_537&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4137&quot;,&quot;strategy&quot;:&quot;pc付费专栏左侧入口&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/category_159453.html&quot;,&quot;ab&quot;:&quot;new&quot;}">
                    <img src="https://img-blog.csdnimg.cn/20201014180756916.png?x-oss-process=image/resize,m_fixed,h_64,w_64" alt="" onerror="this.src='https://img-blog.csdnimg.cn/20201014180756922.png?x-oss-process=image/resize,m_fixed,h_64,w_64'" />
                    <span class="title oneline">
                        <span class="text">我的涂鸦</span>
                    </span>
                    <span class="count float-right">27篇</span>
                </a>
            </li>
        </ul>
    </div>
    <p class="text-center">
        <a class="flexible-btn" data-fbox="aside-archive"><img class="look-more" src="https://csdnimg.cn/release/blogv2/dist/pc/img/arrowDownWhite.png" alt="" /></a>
    </p>
</div>
<div id="asideNewComments" class="aside-box">
    <h3 class="aside-title">最新评论</h3>
    <div class="aside-content">
        <ul class="newcomment-list">
            <li>
                <a class="title text-truncate" target="_blank" href="https://blog.csdn.net/soilwork/article/details/3986028#comments_8361762" data-report-click="{&quot;mod&quot;:&quot;popu_542&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4231&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/article/details/3986028#comments_8361762&quot;,&quot;ab&quot;:&quot;new&quot;}" data-report-view="{&quot;mod&quot;:&quot;popu_542&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4231&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/article/details/3986028#comments_8361762&quot;,&quot;ab&quot;:&quot;new&quot;}">Shaders for Game</a>
                <p class="comment ellipsis">
                    <a href="https://blog.csdn.net/Roadlun" class="user-name" target="_blank">天朝炼药大师·休: </a>
                    <span class="code-comments">远古大神~~</span>
                </p>
            </li>
            <li>
                <a class="title text-truncate" target="_blank" href="https://blog.csdn.net/soilwork/article/details/4048361#comments_7809011" data-report-click="{&quot;mod&quot;:&quot;popu_542&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4231&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/article/details/4048361#comments_7809011&quot;,&quot;ab&quot;:&quot;new&quot;}" data-report-view="{&quot;mod&quot;:&quot;popu_542&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4231&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/article/details/4048361#comments_7809011&quot;,&quot;ab&quot;:&quot;new&quot;}">Book Review: ShaderX 7</a>
                <p class="comment ellipsis">
                    <a href="https://blog.csdn.net/aihuanhuan_0823" class="user-name" target="_blank">aihuanhuan_0823: </a>
                    <span class="code-comments">请问可以分享一下CD源码么？</span>
                </p>
            </li>
            <li>
                <a class="title text-truncate" target="_blank" href="https://blog.csdn.net/soilwork/article/details/744986#comments_7780991" data-report-click="{&quot;mod&quot;:&quot;popu_542&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4231&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/article/details/744986#comments_7780991&quot;,&quot;ab&quot;:&quot;new&quot;}" data-report-view="{&quot;mod&quot;:&quot;popu_542&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4231&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/article/details/744986#comments_7780991&quot;,&quot;ab&quot;:&quot;new&quot;}">水面渲染</a>
                <p class="comment ellipsis">
                    <a href="https://blog.csdn.net/cyril123" class="user-name" target="_blank">cyril123: </a>
                    <span class="code-comments">你好，请问可以把水面模拟的源码发我一份吗。2826745890@qq.com</span>
                </p>
            </li>
            <li>
                <a class="title text-truncate" target="_blank" href="https://blog.csdn.net/soilwork/article/details/1447346#comments_7516942" data-report-click="{&quot;mod&quot;:&quot;popu_542&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4231&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/article/details/1447346#comments_7516942&quot;,&quot;ab&quot;:&quot;new&quot;}" data-report-view="{&quot;mod&quot;:&quot;popu_542&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4231&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/article/details/1447346#comments_7516942&quot;,&quot;ab&quot;:&quot;new&quot;}">学习quaternion的一点点笔记</a>
                <p class="comment ellipsis">
                    <a href="https://blog.csdn.net/weixin_40336438" class="user-name" target="_blank">张小丰: </a>
                    <span class="code-comments">十二年。。。</span>
                </p>
            </li>
            <li>
                <a class="title text-truncate" target="_blank" href="https://blog.csdn.net/soilwork/article/details/1468860#comments_7273492" data-report-click="{&quot;mod&quot;:&quot;popu_542&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4231&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/article/details/1468860#comments_7273492&quot;,&quot;ab&quot;:&quot;new&quot;}" data-report-view="{&quot;mod&quot;:&quot;popu_542&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4231&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/article/details/1468860#comments_7273492&quot;,&quot;ab&quot;:&quot;new&quot;}">计算三角形网格的tangent space （Part 1）</a>
                <p class="comment ellipsis">
                    <a href="https://blog.csdn.net/pickItUpPlease" class="user-name" target="_blank">pickItUpPlease</a>
                    <span class="reply"> 回复 </span>
                    <span class="code-comments">暴熊: 
因为T轴和U轴平行所以 U10 * T 跟U10 *U 本身应该是一致的</span>
                </p>
            </li>
        </ul>
    </div>
</div>
<div id="asideArchive" class="aside-box" style="display:block!important; width:300px;">
    <h3 class="aside-title">最新文章</h3>
    <div class="aside-content">
        <ul class="inf_list clearfix">
            <li class="clearfix">
            <a href="https://blog.csdn.net/soilwork/article/details/4196168" target="_blank" data-report-click="{&quot;mod&quot;:&quot;popu_382&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4136&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/article/details/4196168&quot;,&quot;ab&quot;:&quot;new&quot;}" data-report-view="{&quot;mod&quot;:&quot;popu_382&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/article/details/4196168&quot;,&quot;ab&quot;:&quot;new&quot;}">搬家了，新地址http://www.cnblogs.com/clayman/</a>
            </li>
            <li class="clearfix">
            <a href="https://blog.csdn.net/soilwork/article/details/4187236" target="_blank" data-report-click="{&quot;mod&quot;:&quot;popu_382&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4136&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/article/details/4187236&quot;,&quot;ab&quot;:&quot;new&quot;}" data-report-view="{&quot;mod&quot;:&quot;popu_382&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/article/details/4187236&quot;,&quot;ab&quot;:&quot;new&quot;}">Geometry Clipmap Limits</a>
            </li>
            <li class="clearfix">
            <a href="https://blog.csdn.net/soilwork/article/details/4164579" target="_blank" data-report-click="{&quot;mod&quot;:&quot;popu_382&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4136&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/article/details/4164579&quot;,&quot;ab&quot;:&quot;new&quot;}" data-report-view="{&quot;mod&quot;:&quot;popu_382&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/article/details/4164579&quot;,&quot;ab&quot;:&quot;new&quot;}">InputManager Update Frequency</a>
            </li>
        </ul>
        <div class="archive-bar"></div>
        <div class="archive-box">
                <div class="archive-list-item"><a href="https://blog.csdn.net/soilwork/article/month/2009/05" target="_blank" data-report-click="{&quot;mod&quot;:&quot;popu_538&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4138&quot;,&quot;ab&quot;:&quot;new&quot;,&quot;dest&quot;:&quot;&quot;}"><span class="year">2009年</span><span class="num">22篇</span></a></div>
                <div class="archive-list-item"><a href="https://blog.csdn.net/soilwork/article/month/2008/12" target="_blank" data-report-click="{&quot;mod&quot;:&quot;popu_538&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4138&quot;,&quot;ab&quot;:&quot;new&quot;,&quot;dest&quot;:&quot;&quot;}"><span class="year">2008年</span><span class="num">11篇</span></a></div>
                <div class="archive-list-item"><a href="https://blog.csdn.net/soilwork/article/month/2007/11" target="_blank" data-report-click="{&quot;mod&quot;:&quot;popu_538&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4138&quot;,&quot;ab&quot;:&quot;new&quot;,&quot;dest&quot;:&quot;&quot;}"><span class="year">2007年</span><span class="num">33篇</span></a></div>
                <div class="archive-list-item"><a href="https://blog.csdn.net/soilwork/article/month/2006/12" target="_blank" data-report-click="{&quot;mod&quot;:&quot;popu_538&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4138&quot;,&quot;ab&quot;:&quot;new&quot;,&quot;dest&quot;:&quot;&quot;}"><span class="year">2006年</span><span class="num">46篇</span></a></div>
                <div class="archive-list-item"><a href="https://blog.csdn.net/soilwork/article/month/2005/11" target="_blank" data-report-click="{&quot;mod&quot;:&quot;popu_538&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4138&quot;,&quot;ab&quot;:&quot;new&quot;,&quot;dest&quot;:&quot;&quot;}"><span class="year">2005年</span><span class="num">19篇</span></a></div>
        </div>
    </div>
</div>
	<div id="footerRightAds" class="isShowFooterAds" style="width: 300px; height: 250px;">
		<div class="aside-box" style="width: 300px; height: 250px;">
			<div id="kp_box_57" data-pid="57" style="width: 300px; height: 250px;"><script async="" src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- PC-博客详情页-左下视窗（300*600） -->
<ins class="adsbygoogle" style="display: block; height: 250px; width: 300px;" data-ad-client="ca-pub-1076724771190722" data-ad-slot="1173711872" data-ad-format="auto" data-full-width-responsive="true" data-adsbygoogle-status="done"><ins id="aswift_1_expand" style="display:inline-table;border:none;height:250px;margin:0;padding:0;position:relative;visibility:visible;width:300px;background-color:transparent;" tabindex="0" title="Advertisement" aria-label="Advertisement"><ins id="aswift_1_anchor" style="display: block; border: none; height: 250px; margin: 0px; padding: 0px; position: relative; visibility: visible; width: 300px; background-color: transparent; overflow: hidden;"><iframe id="aswift_1" name="aswift_1" style="left:0;position:absolute;top:0;border:0;width:300px;height:250px;" sandbox="allow-forms allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" width="300" height="250" frameborder="0" src="https://googleads.g.doubleclick.net/pagead/ads?guci=2.2.0.0.2.2.0.0&amp;client=ca-pub-1076724771190722&amp;output=html&amp;h=250&amp;slotname=1173711872&amp;adk=3044458519&amp;adf=351202336&amp;pi=t.ma~as.1173711872&amp;w=300&amp;fwrn=4&amp;fwrnh=100&amp;lmt=1609934092&amp;rafmt=1&amp;psa=1&amp;format=300x250&amp;url=https%3A%2F%2Fblog.csdn.net%2Fsoilwork%2Farticle%2Fdetails%2F1452437&amp;flash=0&amp;fwr=0&amp;fwrattr=true&amp;rpe=1&amp;resp_fmts=3&amp;wgl=1&amp;dt=1609934091342&amp;bpp=5&amp;bdt=1079&amp;idt=690&amp;shv=r20201203&amp;cbv=r20190131&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3Dabae74b1af113cf7-2284b68a8cc5007c%3AT%3D1609924037%3ART%3D1609924037%3AS%3DALNI_MbISe9R06kOQTXvnUNRCBezpAp3bA&amp;prev_fmts=712x104&amp;correlator=3157332682838&amp;frm=20&amp;pv=1&amp;ga_vid=1355739629.1609934092&amp;ga_sid=1609934092&amp;ga_hid=176432530&amp;ga_fc=0&amp;u_tz=480&amp;u_his=2&amp;u_java=0&amp;u_h=1080&amp;u_w=1920&amp;u_ah=1040&amp;u_aw=1920&amp;u_cd=24&amp;u_nplug=3&amp;u_nmime=4&amp;adx=70&amp;ady=1668&amp;biw=912&amp;bih=872&amp;scr_x=0&amp;scr_y=0&amp;eid=21067982%2C21068084%2C21068769&amp;oid=3&amp;pvsid=1491051520445906&amp;pem=508&amp;rx=0&amp;eae=0&amp;fc=896&amp;brdim=10%2C10%2C10%2C10%2C1920%2C0%2C945%2C1020%2C929%2C889&amp;vis=1&amp;rsz=%7C%7CpeEbr%7C&amp;abl=CS&amp;pfx=0&amp;fu=9352&amp;bc=31&amp;ifi=2&amp;uci=a!2&amp;btvi=2&amp;fsb=1&amp;xpc=iqFGBFwhLF&amp;p=https%3A//blog.csdn.net&amp;dtd=699" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no" allowfullscreen="true" data-google-container-id="a!2" data-google-query-id="CM7oje6fh-4CFU_X3godtSgBcQ" data-load-complete="true"></iframe></ins></ins></ins>
<script>
     (adsbygoogle = window.adsbygoogle || []).push({});
</script><img class="pre-img-lasy" data-src="https://kunyu.csdn.net/1.png?p=57&amp;a=2488&amp;c=0&amp;k=&amp;spm=1001.2101.3001.5001&amp;d=1&amp;t=3&amp;u=6805c80b43614c2eb022f66b952b0c24" style="display: block;width: 0px;height: 0px;" /></div>
		</div>
	</div>
    <!-- 详情页显示目录 -->
<!--文章目录-->

</aside>
<script>
	$("a.flexible-btn").click(function(){
		$(this).parents('div.aside-box').removeClass('flexible-box');
		$(this).parents("p.text-center").remove();
	})
</script>
<script type="text/javascript" src="https://g.csdnimg.cn/user-tooltip/2.4/user-tooltip.js"></script>
<script type="text/javascript" src="https://g.csdnimg.cn/user-medal/1.0.6/user-medal.js"></script>    </div>
<div class="recommend-right  align-items-stretch clearfix" id="rightAside" data-type="recommend">
    <aside class="recommend-right_aside">
        <div id="recommend-right">
                        
                <div id="recommendAdBox">
                    <div id="kp_box_479" data-pid="479"><script async="" src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- PC-博客详情页-右侧视窗300*600 -->
<ins class="adsbygoogle" style="display:block" data-ad-client="ca-pub-1076724771190722" data-ad-slot="8441704093" data-ad-format="auto" data-full-width-responsive="true" data-adsbygoogle-status="done"></ins>
<script>
     (adsbygoogle = window.adsbygoogle || []).push({});
</script><img class="pre-img-lasy" data-src="https://kunyu.csdn.net/1.png?p=479&amp;a=2487&amp;c=0&amp;k=&amp;spm=1001.2101.3001.4834&amp;d=1&amp;t=3&amp;u=f8542bd5c4624580bbc1ac8fffc46f51" style="display: block;width: 0px;height: 0px;" /></div>
                </div>
            <div class="aside-box kind_person d-flex flex-column">
                    <h3 class="aside-title">分类专栏</h3>
                    <div class="align-items-stretch kindof_item" id="kind_person_column">
                        <div class="aside-content">
                            <ul>
                                <li class="">
                                    <a class="clearfix" target="_blank" href="https://blog.csdn.net/soilwork/category_207496.html" data-report-click="{&quot;mod&quot;:&quot;popu_537&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4137&quot;,&quot;strategy&quot;:&quot;pc付费专栏左侧入口&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/category_207496.html&quot;,&quot;ab&quot;:&quot;new&quot;}">
                                        <img src="https://img-blog.csdnimg.cn/20201014180756757.png?x-oss-process=image/resize,m_fixed,h_64,w_64" alt="" onerror="this.src='https://img-blog.csdnimg.cn/20201014180756922.png?x-oss-process=image/resize,m_fixed,h_64,w_64'" />
                                        <span class="title oneline">
                                            <span class="text"> XNA &amp; MDX</span>
                                        </span>
                                        <span class="count float-right">17篇</span>
                                    </a>
                                </li>
                                <li class="">
                                    <a class="clearfix" target="_blank" href="https://blog.csdn.net/soilwork/category_489902.html" data-report-click="{&quot;mod&quot;:&quot;popu_537&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4137&quot;,&quot;strategy&quot;:&quot;pc付费专栏左侧入口&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/category_489902.html&quot;,&quot;ab&quot;:&quot;new&quot;}">
                                        <img src="https://img-blog.csdnimg.cn/20201014180756927.png?x-oss-process=image/resize,m_fixed,h_64,w_64" alt="" onerror="this.src='https://img-blog.csdnimg.cn/20201014180756922.png?x-oss-process=image/resize,m_fixed,h_64,w_64'" />
                                        <span class="title oneline">
                                            <span class="text">c#</span>
                                        </span>
                                        <span class="count float-right">6篇</span>
                                    </a>
                                </li>
                                <li class="">
                                    <a class="clearfix" target="_blank" href="https://blog.csdn.net/soilwork/category_216383.html" data-report-click="{&quot;mod&quot;:&quot;popu_537&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4137&quot;,&quot;strategy&quot;:&quot;pc付费专栏左侧入口&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/category_216383.html&quot;,&quot;ab&quot;:&quot;new&quot;}">
                                        <img src="https://img-blog.csdnimg.cn/20201014180756927.png?x-oss-process=image/resize,m_fixed,h_64,w_64" alt="" onerror="this.src='https://img-blog.csdnimg.cn/20201014180756922.png?x-oss-process=image/resize,m_fixed,h_64,w_64'" />
                                        <span class="title oneline">
                                            <span class="text">DirectX 10</span>
                                        </span>
                                        <span class="count float-right">6篇</span>
                                    </a>
                                </li>
                                <li class="">
                                    <a class="clearfix" target="_blank" href="https://blog.csdn.net/soilwork/category_522906.html" data-report-click="{&quot;mod&quot;:&quot;popu_537&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4137&quot;,&quot;strategy&quot;:&quot;pc付费专栏左侧入口&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/category_522906.html&quot;,&quot;ab&quot;:&quot;new&quot;}">
                                        <img src="https://img-blog.csdnimg.cn/20201014180756918.png?x-oss-process=image/resize,m_fixed,h_64,w_64" alt="" onerror="this.src='https://img-blog.csdnimg.cn/20201014180756922.png?x-oss-process=image/resize,m_fixed,h_64,w_64'" />
                                        <span class="title oneline">
                                            <span class="text">Engine Design</span>
                                        </span>
                                        <span class="count float-right">11篇</span>
                                    </a>
                                </li>
                                <li class="">
                                    <a class="clearfix" target="_blank" href="https://blog.csdn.net/soilwork/category_172080.html" data-report-click="{&quot;mod&quot;:&quot;popu_537&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4137&quot;,&quot;strategy&quot;:&quot;pc付费专栏左侧入口&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/category_172080.html&quot;,&quot;ab&quot;:&quot;new&quot;}">
                                        <img src="https://img-blog.csdnimg.cn/20201014180756922.png?x-oss-process=image/resize,m_fixed,h_64,w_64" alt="" onerror="this.src='https://img-blog.csdnimg.cn/20201014180756922.png?x-oss-process=image/resize,m_fixed,h_64,w_64'" />
                                        <span class="title oneline">
                                            <span class="text">GPU程序设计</span>
                                        </span>
                                        <span class="count float-right">19篇</span>
                                    </a>
                                </li>
                                <li class="">
                                    <a class="clearfix" target="_blank" href="https://blog.csdn.net/soilwork/category_155687.html" data-report-click="{&quot;mod&quot;:&quot;popu_537&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4137&quot;,&quot;strategy&quot;:&quot;pc付费专栏左侧入口&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/category_155687.html&quot;,&quot;ab&quot;:&quot;new&quot;}">
                                        <img src="https://img-blog.csdnimg.cn/20201014180756930.png?x-oss-process=image/resize,m_fixed,h_64,w_64" alt="" onerror="this.src='https://img-blog.csdnimg.cn/20201014180756922.png?x-oss-process=image/resize,m_fixed,h_64,w_64'" />
                                        <span class="title oneline">
                                            <span class="text">Managed DirectX Kick Start翻译</span>
                                        </span>
                                        <span class="count float-right">18篇</span>
                                    </a>
                                </li>
                                <li class="">
                                    <a class="clearfix" target="_blank" href="https://blog.csdn.net/soilwork/category_257400.html" data-report-click="{&quot;mod&quot;:&quot;popu_537&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4137&quot;,&quot;strategy&quot;:&quot;pc付费专栏左侧入口&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/category_257400.html&quot;,&quot;ab&quot;:&quot;new&quot;}">
                                        <img src="https://img-blog.csdnimg.cn/20201014180756922.png?x-oss-process=image/resize,m_fixed,h_64,w_64" alt="" onerror="this.src='https://img-blog.csdnimg.cn/20201014180756922.png?x-oss-process=image/resize,m_fixed,h_64,w_64'" />
                                        <span class="title oneline">
                                            <span class="text">The Complete Effect and HLSL Guide连载</span>
                                        </span>
                                        <span class="count float-right">14篇</span>
                                    </a>
                                </li>
                                <li class="">
                                    <a class="clearfix" target="_blank" href="https://blog.csdn.net/soilwork/category_263700.html" data-report-click="{&quot;mod&quot;:&quot;popu_537&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4137&quot;,&quot;strategy&quot;:&quot;pc付费专栏左侧入口&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/category_263700.html&quot;,&quot;ab&quot;:&quot;new&quot;}">
                                        <img src="https://img-blog.csdnimg.cn/20201014180756922.png?x-oss-process=image/resize,m_fixed,h_64,w_64" alt="" onerror="this.src='https://img-blog.csdnimg.cn/20201014180756922.png?x-oss-process=image/resize,m_fixed,h_64,w_64'" />
                                        <span class="title oneline">
                                            <span class="text">图形学、几何</span>
                                        </span>
                                        <span class="count float-right">7篇</span>
                                    </a>
                                </li>
                                <li class="">
                                    <a class="clearfix" target="_blank" href="https://blog.csdn.net/soilwork/category_159453.html" data-report-click="{&quot;mod&quot;:&quot;popu_537&quot;,&quot;spm&quot;:&quot;1001.2101.3001.4137&quot;,&quot;strategy&quot;:&quot;pc付费专栏左侧入口&quot;,&quot;dest&quot;:&quot;https://blog.csdn.net/soilwork/category_159453.html&quot;,&quot;ab&quot;:&quot;new&quot;}">
                                        <img src="https://img-blog.csdnimg.cn/20201014180756916.png?x-oss-process=image/resize,m_fixed,h_64,w_64" alt="" onerror="this.src='https://img-blog.csdnimg.cn/20201014180756922.png?x-oss-process=image/resize,m_fixed,h_64,w_64'" />
                                        <span class="title oneline">
                                            <span class="text">我的涂鸦</span>
                                        </span>
                                        <span class="count float-right">27篇</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
            </div>
        </div>
    </aside>
</div>

</div><iframe class="bdSug_sd" style="display: none; position: absolute; border-width: 0px;"></iframe><div id="bdSug_1609934091191" class="bdSug_wpr" style="display: none;"></div>
<div class="mask-dark"></div>
<script type="text/javascript">
    var timert = setInterval(function(){
      sideToolbar = $(".csdn-side-toolbar");
      if (sideToolbar.length &gt; 0) {
        sideToolbar.css('cssText','bottom:64px !important;')
        clearInterval(timert);
      }
    }, 200);
</script>
<script>
    var articleId = 1452437;
    var commentscount = 3;
    var curentUrl = "https://blog.csdn.net/soilwork/article/details/1452437";
    var myUrl = "https://my.csdn.net/";
    var highlight = ["Parallax","Mapping"];//高亮数组
    var share_card_url = "https://blog.csdn.net/soilwork/article/shareArticleCardPage?article_id=1452437"
	var articleType = 1;
    var baiduKey = "Parallax Mapping";
    var needInsertBaidu = true;
    var recommendRegularDomainArr = ["blog.csdn.net/.+/article/details/","download.csdn.net/download/","edu.csdn.net/course/detail/","ask.csdn.net/questions/","bbs.csdn.net/topics/","www.csdn.net/gather_.+/"]
    var codeStyle = "";
    var baiduSearchType = "title";
    var canRead = true;
    var blogMoveHomeArticle = false;
    var showPcWindowAd = false;
    var linkPage = true;
</script>
<script src="https://csdnimg.cn/public/sandalstrap/1.4/js/sandalstrap.min.js"></script>
<div class="skin-boxshadow"></div>
<div style="display:none;">
	<img src="" onerror="setTimeout(function(){if(!/(csdn.net|iteye.com|baiducontent.com|googleusercontent.com|360webcache.com|sogoucdn.com|bingj.com|baidu.com)$/.test(window.location.hostname)){window.location.href=&quot;\x68\x74\x74\x70\x73\x3a\x2f\x2f\x77\x77\x77\x2e\x63\x73\x64\x6e\x2e\x6e\x65\x74&quot;}},3000);" />
</div>

    <!-- 富文本柱状图  -->
	<link rel="stylesheet" href="https://csdnimg.cn/release/blog_editor_html/release1.6.12/ckeditor/plugins/chart/chart.css" />
	<script type="text/javascript" src="https://csdnimg.cn/release/blog_editor_html/release1.6.12/ckeditor/plugins/chart/lib/chart.min.js"></script>
    <script type="text/javascript" src="https://csdnimg.cn/release/blog_editor_html/release1.6.12/ckeditor/plugins/chart/widget2chart.js"></script>
<script src="https://csdnimg.cn/release/blogv2/dist/components/js/pc_wap_highlight-db1e81323a.min.js" type="text/javascript"></script>
<script src="https://csdnimg.cn/release/blogv2/dist/components/js/pc_wap_common-906586e915.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://csdnimg.cn/release/blog_editor_html/release1.6.12/ckeditor/plugins/codesnippet/lib/highlight/styles/atom-one-light.css" />
<script>
 // 全局声明
 if (window.csdn === undefined) {
      window.csdn = {};
    }
    window.csdn.sideToolbar = {
        options: {
            report:{
                isShow: true,
            },
            qr: {
                isShow: false,
            },
            guide: {
                isShow: true
            }
        }
    }
    $(function(){
        $(document).on('click',"a.option-box[data-type='report']",function() {
            window.csdn.userLogin.loadAjax(function(res){
                showReport(false,articleTitles);
            })
        });
    })
</script>
    <script src="https://g.csdnimg.cn/baidu-search/1.0.9/baidu-search.js" type="text/javascript"></script>
<script src="https://csdnimg.cn/release/download/old_static/js/qrcode.js"></script>
<script src="https://csdnimg.cn/release/blogv2/dist/pc/js/common-b286f966c8.min.js" type="text/javascript"></script>
<script src="https://csdnimg.cn/release/blogv2/dist/pc/js/detail-d46519fea9.min.js" type="text/javascript"></script>
<script src="https://g.csdnimg.cn/user-ordercart/1.0.6/user-ordercart.js" type="text/javascript"></script>
<script src="https://csdnimg.cn/release/blogv2/dist/pc/js/column-78261cfea6.min.js" type="text/javascript"></script>
<script src="https://g.csdnimg.cn/side-toolbar/2.8/side-toolbar.js" type="text/javascript"></script>
<script src="https://g.csdnimg.cn/copyright/1.0.3/copyright.js" type="text/javascript"></script>
<script>
    $(".MathJax").remove();
    if ($('div.markdown_views pre.prettyprint code.hljs').length &gt; 0) {
        $('div.markdown_views')[0].className = 'markdown_views';
    }
</script>
<script type="text/javascript" src="https://csdnimg.cn/release/blog_mathjax/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
<script type="text/x-mathjax-config;executed=true">
    MathJax.Hub.Config({
            "HTML-CSS": {
                    linebreaks: { automatic: true, width: "94%container" },
                    imageFont: null
            },
            tex2jax: {
                preview: "none"
            },
            mml2jax: {
                preview: 'none'
            }
    });
</script>
<script type="text/javascript" crossorigin="" src="https://g.csdnimg.cn/user-login/2.3.2/user-login.js"></script>
<script type="text/javascript" crossorigin="" src="https://g.csdnimg.cn/login-box/1.1.4/login-box.js"></script>
<div id="pointDivs"><div class="point-outer point-pre"><div class="point-inner"></div></div><div class="point-outer point-pre"><div class="point-inner"></div></div><div class="point-outer point-pre"><div class="point-inner"></div></div><div class="point-outer point-pre"><div class="point-inner"></div></div><div class="point-outer point-pre"><div class="point-inner"></div></div></div><div id="st_mask" onclick="closeMask()" style="width: 100%; height: 100%; background: rgba(0, 0, 0, 0.4); position: fixed; left: 0px; top: 0px; display: none; z-index: 1;"></div><div id="st_confirmBox" style="width: 100%; position: fixed; left: 0px; top: 34%; text-align: center; display: none; z-index: 2;"><div id="st_confirm" style="width: 80%; margin: 0px auto; background: rgb(255, 255, 255); border-radius: 3px; overflow: hidden; padding-top: 20px; text-align: center;"><span id="st_confirm_text" style="background: rgb(255, 255, 255); overflow: hidden; padding: 15px 8px 30px; text-align: center; display: block;"></span><span class="st_confirm_btn cancel" style="background: rgb(255, 255, 255); color: rgb(141, 141, 141); padding: 8px; text-align: center; display: block; width: 50%; margin: 0px auto; float: left; box-sizing: border-box; border-top: 1px solid rgb(207, 207, 207); overflow: hidden; text-overflow: ellipsis; white-space: nowrap;"></span><span class="st_confirm_btn success" style="background: rgb(27, 121, 248); color: rgb(255, 255, 255); padding: 8px; text-align: center; display: block; width: 50%; margin: 0px auto; float: left; box-sizing: border-box; border-top: 1px solid rgb(27, 121, 248); overflow: hidden; text-overflow: ellipsis; white-space: nowrap;"></span><div style="clear: both; display: block;"></div></div></div><div id="st_alertBox" style="width: 100%; position: fixed; left: 0px; top: 34%; text-align: center; display: none; z-index: 2;"><div id="st_alert" style="width: 80%; margin: 0px auto; background: rgb(255, 255, 255); border-radius: 2px; overflow: hidden; padding-top: 20px; text-align: center;"><span id="st_alert_text" style="background: rgb(255, 255, 255); overflow: hidden; padding: 15px 8px 30px; text-align: center; display: block;"></span><span id="st_alert_btn" onclick="closeMask()" style="background: rgb(27, 121, 248); color: rgb(255, 255, 255); padding: 8px; text-align: center; display: block; width: 72%; margin: 0px auto 20px; border-radius: 2px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;"></span></div></div><div id="st_toastBox" style="width: 100%; position: fixed; left: 0px; bottom: 10%; text-align: center; display: none;"><span id="st_toastContent" style="color: rgb(255, 255, 255); background: rgba(0, 0, 0, 0.8); padding: 8px 24px; border-radius: 4px; max-width: 80%; display: inline-block; font-size: 16px;"></span></div> <div class="report-box">  <div class="pos-boxer">      <div class="pos-content">          <div class="box-title">              <p>举报</p>              <svg xmlns="http://www.w3.org/2000/svg" class="icon btn-close" aria-hidden="true">                    <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#csdnc-times"/>              </svg>          </div>          <div class="box-header">              <div class="box-top"><span>选择你想要举报的内容（必选）</span></div>              <div class="box-botoom">                  <ul>                      <li data="1" type="nei">内容涉黄</li>                      <li data="2" type="nei">政治相关</li>                      <li data="3" type="nei">内容抄袭</li>                      <li data="4" type="nei">涉嫌广告</li>                      <li data="5" type="nei">内容侵权</li>                      <li data="6" type="nei">侮辱谩骂</li>                      <li data="8" type="nei">样式问题</li>                      <li data="7" type="nei">其他</li>                  </ul>              </div>          </div>          <div>          <div class="box-content">          </div>          <div class="box-content">          </div>                    <div class="box-content" style="display:none;">                  <div class="box-content-top">                          <span>原文链接（必填）</span>                      </div>                      <div class="box-content-bottom" style="padding-bottom: 16px;">                        <div class="box-input" style="height: 32px;line-height: 32px;">                        <input class="content-input" type="text" id="originalurl" name="originalurl" placeholder="请输入被侵权原文链接" />                        </div>                      </div>          </div>          <div class="box-content">          </div>          <div class="box-content" style="display:none;">                  <div class="box-content-top">                          <span>请选择具体原因（必选）</span>                      </div>                  <div class="box-content-bottom">                          <ul>                              <li sub_type="1">包含不实信息</li>                              <li sub_type="2">涉及个人隐私</li>                          </ul>                      </div>          </div>          <div class="box-content" style="display:none;">                  <div class="box-content-top">                          <span>请选择具体原因（必选）</span>                      </div>                  <div class="box-content-bottom">                          <ul>                              <li sub_type="1">侮辱谩骂</li>                              <li sub_type="2">诽谤</li>                          </ul>                  </div>          </div>          <div class="box-content" style="display:none;">                <div class="box-content-top">                        <span>请选择具体原因（必选）</span>                    </div>                <div class="box-content-bottom">                        <ul>                            <li sub_type="1">搬家样式</li>                            <li sub_type="2">博文样式</li>                        </ul>                </div>          </div>          <div class="box-content" style="display:none;">          </div>          </div>            <div id="cllcont" style="display:none;">            <div class="box-content-top">              <span class="box-content-span">补充说明（选填）</span>            </div>                <div class="box-content-bottom">                  <div class="box-input">                    <textarea class="ipt ipt-textarea" style="padding:0;" name="description" placeholder="请详细描述您的举报内容"></textarea>                  </div>                </div>            </div>            </div>      <div class="pos-footer">          <p class="btn-close">取消</p>          <p class="box-active">确定</p>      </div>  </div></div><div class="imgViewDom disnone" style="display: none;"><img src="" /></div><style>.imgViewDom{display:none;position:fixed;top:0;left:0;height:100%;width:100%;z-index:99999999;background: rgba(255, 255, 255,0.8);overflow: auto;display:-webkit-box;-webkit-box-align:center;-webkit-box-pack:center;display:-moz-box;-moz-box-align:center;-moz-box-pack:center;display:-o-box;-o-box-align:center;-o-box-pack:center;display:-ms-box;-ms-box-align:center;-ms-box-pack:center; display:box;box-align:center;box-pack:center;}.imgViewDom img{cursor: zoom-out;}</style><svg xmlns="http://www.w3.org/2000/svg" aria-hidden="true" style="position: absolute; width: 0px; height: 0px; overflow: hidden;"><symbol id="sousuo" viewBox="0 0 1024 1024"><path d="M719.6779726 653.55865555l0.71080936 0.70145709 191.77828505 191.77828506c18.25658185 18.25658185 18.25658185 47.86273439 0 66.12399318-18.26593493 18.26125798-47.87208744 18.26125798-66.13334544 0l-191.77828505-191.77828506c-0.2338193-0.2338193-0.4676378-0.4676378-0.69678097-0.71081014-58.13206223 44.25257003-130.69075187 70.51978897-209.38952657 70.51978894C253.06424184 790.19776156 98.14049639 635.27869225 98.14049639 444.17380511S253.06424184 98.14049639 444.16912898 98.14049639c191.10488633 0 346.02863258 154.92374545 346.02863259 346.02863259 0 78.6987747-26.27189505 151.25746514-70.51978897 209.38952657z m-275.50884362 43.11621045c139.45428506 0 252.50573702-113.05145197 252.50573702-252.50573702s-113.05145197-252.50573702-252.50573702-252.50573783-252.50573702 113.05145197-252.50573783 252.50573783 113.05145197 252.50573702 252.50573783 252.50573702z"/></symbol><symbol id="gonggong_csdnlogo_" viewBox="0 0 4096 1024"><path d="M1234.16069807 690.46341551c62.96962316 23.02318413 194.30703694 45.91141406 300.51598128 45.91141406 114.44114969 0 178.13952547-31.68724287 183.2407937-80.86454822 4.642424-44.8587714-42.21366937-50.93170978-171.44579784-81.53931916-178.57137886-43.77913792-292.49970264-111.55313011-281.32549604-219.86735976 12.9825927-125.75031047 181.27046257-220.78504823 439.49180199-220.78504822 125.88526465 0 247.93783044 8.87998544 311.17736197 29.60894839l-21.7006331 158.57116851c-41.05306337-14.27815288-198.1937175-34.11641822-304.48363435-34.11641822-107.7744129 0-163.56447339 33.90049151-167.42416309 71.06687432-4.85835069 47.04502922 51.14763648 49.23128703 191.14910897 86.50563321 189.58364043 48.09767188 272.47250144 115.81768239 261.6221849 220.81203906-12.71268432 123.51007099-164.13128096 228.53141851-466.48263918 228.53141851-125.85827383 0-234.33444849-22.96920244-294.09216204-45.93840492l19.730302-157.86940672zM3010.8325562 172.75216735c688.40130256-129.79893606 747.80813523 103.42888812 726.53935551 309.80082928l-40.08139323 381.78539207h-218.51781789l36.57258439-348.20879061c7.90831529-76.68096846 57.13960232-226.66905073-180.54170997-221.05495659-82.26807176 1.99732195-123.05122675 13.2794919-123.05122677 13.27949188s-7.15257186 92.65954408-15.81663059 161.13529804l-41.43093509 394.84895728h-214.3072473l42.53755943-389.15389062 28.09746151-302.43233073z m-869.48282929-18.05687008c49.12332368-5.34418577 124.58970448-10.76934404 228.45044598-10.76934405 173.38913812 0 313.57954648 30.17575597 400.38207891 93.63121421 77.94953781 59.16391512 129.82592689 154.95439631 115.4668015 293.74128117-13.25250106 129.15115596-80.405704 219.57046055-178.16651631 275.4954752-89.44763445 52.74009587-202.16137055 75.27744492-371.66382812 75.27744493-99.94707012 0-195.27870708-5.39816743-267.77609576-16.14052064L2141.37671774 154.69529727z m143.26736381 569.85754561c16.70732823 3.23890047 38.67786969 6.45081009 81.99816339 6.45081009 173.44311979 0 295.7386031-85.23706385 308.01943403-205.07638097 17.84094339-173.2271931-90.63523129-233.79463176-273.39018992-232.74198912-23.67096422 0-56.57279475 0-73.98188473 3.1849188l-42.6725136 428.15565036z" fill="#262626"/><path d="M1109.8678928 870.30336371c-41.10704503 14.25116203-126.26313639 23.96786342-245.23874671 23.96786342-342.13585224 0-526.8071603-160.59548129-504.97157302-372.90540663C385.78470347 268.40769434 659.36382925 126.08500985 958.9081404 126.08500985c116.00661824 0 184.32042718 9.33882968 248.31570215 24.99351522l-20.5400271 170.42014604c-42.56455024-14.33213455-142.32268451-27.50366309-223.07926938-27.50366311-176.25016686 0-325.94134993 52.49717834-343.10752238 218.57179958-15.30380469 148.50358623 89.7715245 219.48948804 288.04621451 219.48948804 69.0155707 0 170.77102691-9.8786464 217.81605614-24.15679928l-16.49140154 162.40386737z" fill="#CA0C16"/></symbol><symbol id="gonggong_csdnlogodanse_" viewBox="0 0 4096 1024"><path d="M1229.41995733 690.46341551c62.96962316 23.02318413 194.30703694 45.91141406 300.51598128 45.91141406 114.44114969 0 178.13952547-31.68724287 183.2407937-80.86454822 4.642424-44.8587714-42.21366937-50.93170978-171.44579784-81.53931916-178.57137886-43.77913792-292.49970264-111.55313011-281.32549604-219.86735976 12.9825927-125.75031047 181.27046257-220.78504823 439.49180199-220.78504822 125.88526465 0 247.93783044 8.87998544 311.17736197 29.60894839l-21.7006331 158.57116851c-41.05306337-14.27815288-198.1937175-34.11641822-304.48363435-34.11641822-107.7744129 0-163.56447339 33.90049151-167.42416309 71.06687432-4.85835069 47.04502922 51.14763648 49.23128703 191.14910897 86.50563321 189.58364043 48.09767188 272.47250144 115.81768239 261.6221849 220.81203906-12.71268432 123.51007099-164.13128096 228.53141851-466.48263918 228.53141851-125.85827383 0-234.33444849-22.96920244-294.09216204-45.93840492l19.730302-157.86940672zM3006.09181546 172.75216735c688.40130256-129.79893606 747.80813523 103.42888812 726.53935551 309.80082928l-40.08139323 381.78539207h-218.51781789l36.57258439-348.20879061c7.90831529-76.68096846 57.13960232-226.66905073-180.54170997-221.05495659-82.26807176 1.99732195-123.05122675 13.2794919-123.05122677 13.27949188s-7.15257186 92.65954408-15.81663059 161.13529804l-41.43093509 394.84895728h-214.3072473l42.53755943-389.15389062 28.09746151-302.43233073z m-869.48282929-18.05687008c49.12332368-5.34418577 124.58970448-10.76934404 228.45044598-10.76934405 173.38913812 0 313.57954648 30.17575597 400.38207891 93.63121421 77.94953781 59.16391512 129.82592689 154.95439631 115.4668015 293.74128117-13.25250106 129.15115596-80.405704 219.57046055-178.16651631 275.4954752-89.44763445 52.74009587-202.16137055 75.27744492-371.66382812 75.27744493-99.94707012 0-195.27870708-5.39816743-267.77609576-16.14052064L2136.635977 154.69529727z m143.26736381 569.85754561c16.70732823 3.23890047 38.67786969 6.45081009 81.99816339 6.45081009 173.44311979 0 295.7386031-85.23706385 308.01943403-205.07638097 17.84094339-173.2271931-90.63523129-233.79463176-273.39018992-232.74198912-23.67096422 0-56.57279475 0-73.98188473 3.1849188l-42.6725136 428.15565036z m-1174.74919792 145.75052083c-41.10704503 14.25116203-126.26313639 23.96786342-245.23874671 23.96786342-342.13585224 0-526.8071603-160.59548129-504.97157303-372.90540663C381.04396273 268.40769434 654.62308851 126.08500985 954.16739966 126.08500985c116.00661824 0 184.32042718 9.33882968 248.31570215 24.99351522l-20.5400271 170.42014604c-42.56455024-14.33213455-142.32268451-27.50366309-223.07926938-27.50366311-176.25016686 0-325.94134993 52.49717834-343.10752238 218.57179958-15.30380469 148.50358623 89.7715245 219.48948804 288.04621451 219.48948804 69.0155707 0 170.77102691-9.8786464 217.81605614-24.15679928l-16.49140154 162.40386737z"/></symbol><symbol id="xieboke1" viewBox="0 0 1024 1024"><path d="M204.70021457 751.89799169h657.99199211a33.6932867 33.6932867 0 0 1 0 67.33536736H163.68452703a33.53966977 33.53966977 0 0 1-18.74125054-5.68382181c-18.63883902-9.4218307-18.17798882-29.44322156-15.20806401-39.17228615C199.0675982 570.27171976 309.41567149 409.58853908 435.38145354 290.12586836A243.22661203 243.22661203 0 0 1 536.97336934 234.20935065c138.10150976-33.79569759 228.3257813-29.95527721 318.60125827-28.52152054-17.15387692 20.48224105-36.20236071 41.6301547-57.29906892 62.93168529-3.1747472 3.22595323-164.67721739 19.91897936-187.97576692 47.05794871-23.29854894 27.13896932 129.60138005 7.37360691 125.19769798 11.11161576-21.6599699 18.33160576-44.90731339 36.4071831-69.94685287 53.8682939-4.50609297 3.1747472-149.52035944-0.35843931-174.61110436 27.85584737-25.19315641 28.16308124 101.89914903 18.12678338 96.0617103 21.40394206-67.43777825 37.63611797-125.96578207 64.62147036-212.70807253 93.8086635-57.65750823 19.4069231-121.8181284 133.13456658-146.5504346 179.06599187a435.75967738 435.75967738 0 0 0-23.04252112 49.10617311z" fill="#CA0C16"/></symbol><symbol id="gitchat" viewBox="0 0 1024 1024"><path d="M892.08971773 729.08552746h-108.597062v-162.89559374H403.40293801v-108.59706198h488.68677972v271.49265572z m-651.58237345 54.298531V783.49265572h488.68678045v108.59706201H131.91028227V131.91028227h760.17943546v217.19412473h-108.597062V240.50734428H240.50734428v542.87671418z m542.98531145 0h108.597062v108.59706199h-108.597062v-108.59706199z" fill="#FF9100"/></symbol><symbol id="toolbar-memberhead" viewBox="0 0 1303 1024"><path d="M1061.51168438 433.79527648A78.51879902 78.51879902 0 1 1 1129.35192643 472.74060007h-1.80593246l-48.05350474 403.97922198c-4.55409058 38.16013652-39.41643684 67.133573-80.79584389 67.13357302H319.35199503c-41.30088817 0-76.00619753-28.81639958-80.717325-66.97653526L189.01078861 472.74060007H187.12633728a78.51879902 78.51879902 0 1 1 67.76172401-38.86680556l193.31328323 119.81968805 158.13686148-336.06046024A78.5973179 78.5973179 0 0 1 658.23913228 80.14660493a78.51879902 78.51879902 0 0 1 51.58685077 137.721974l158.13686147 335.82490362 193.54883986-119.89820607z" fill="#FDD840"/><path d="M1050.8331274 394.22180104a78.51879902 78.51879902 0 1 1 78.51879903 78.51879903h-1.80593246l-48.05350474 403.97922198c-4.55409058 38.16013652-39.41643684 67.133573-80.79584389 67.13357302H659.02432018C658.47468805 793.25433807 658.23913228 505.32590231 658.23913228 80.14660493a78.51879902 78.51879902 0 0 1 51.58685077 137.721974l158.13686147 335.82490362 193.54883986-119.89820607A78.51879902 78.51879902 0 0 1 1050.8331274 394.22180104z" fill="#FFBE00"/></symbol><symbol id="toolbar-m-memberhead" viewBox="0 0 1303 1024"><path d="M1062.74839935 433.79527648A78.51879902 78.51879902 0 1 1 1130.58864141 472.74060007h-1.80593246l-48.05350474 403.97922198c-4.55409058 38.16013652-39.41643685 67.133573-80.79584389 67.13357302H320.58871c-41.30088817 0-76.00619753-28.81639958-80.71732499-66.97653526L190.24750358 472.74060007H188.36305226a78.51879902 78.51879902 0 1 1 67.761724-38.86680556l193.31328324 119.81968805 158.13686147-336.06046024A78.5973179 78.5973179 0 0 1 659.47584726 80.14660493a78.51879902 78.51879902 0 0 1 51.58685076 137.721974l158.13686148 335.82490362 193.54883985-119.89820607z" fill="#D6D6D6"/><path d="M1052.06984238 394.22180104a78.51879902 78.51879902 0 1 1 78.51879903 78.51879903h-1.80593246l-48.05350474 403.97922198c-4.55409058 38.16013652-39.41643685 67.133573-80.79584389 67.13357302H660.26103515C659.71140302 793.25433807 659.47584726 505.32590231 659.47584726 80.14660493a78.51879902 78.51879902 0 0 1 51.58685076 137.721974l158.13686148 335.82490362 193.54883985-119.89820607A78.51879902 78.51879902 0 0 1 1052.06984238 394.22180104z" fill="#C1C1C1"/></symbol><symbol id="csdnc-upload" viewBox="0 0 1024 1024"><path d="M216.37466416 723.16095396v84.46438188h591.25067168v-84.46438188c0-23.32483876 18.90735218-42.23219094 42.23219093-42.23219021s42.23219094 18.90735218 42.23219096 42.23219021v84.46438188c0 46.64967827-37.81470362 84.46438188-84.46438189 84.46438189H216.37466416c-46.64967827 0-84.46438188-37.81470362-84.46438189-84.4643819v-84.46438187c0-23.32483876 18.90735218-42.23219094 42.23219096-42.23219021s42.23219094 18.90735218 42.23219094 42.23219021zM469.76780906 275.55040991L246.55378774 499.53305726a42.30820888 42.30820888 0 0 1-59.99082735 0c-16.56346508-16.62259056-16.56346508-43.57095155 0-60.19354139L480.51167818 144.38144832A42.21952103 42.21952103 0 0 1 512 131.93984464a42.20262858 42.20262858 0 0 1 31.48409853 12.44160369l293.95294108 294.95806754c16.56346508 16.62259056 16.56346508 43.57095155 0 60.19354139a42.30820888 42.30820888 0 0 1-59.99082735 0L554.23219094 275.55040991V680.92876375c0 23.32483876-18.90735218 42.23219094-42.23219094 42.23219021s-42.23219094-18.90735218-42.23219094-42.23219021V275.55040991z"/></symbol></svg><ins class="adsbygoogle adsbygoogle-noablate" data-adsbygoogle-status="done" style="display: none !important;"><ins id="aswift_2_expand" style="display:inline-table;border:none;height:0px;margin:0;padding:0;position:relative;visibility:visible;width:0px;background-color:transparent;" tabindex="0" title="Advertisement" aria-label="Advertisement"><ins id="aswift_2_anchor" style="display:block;border:none;height:0px;margin:0;padding:0;position:relative;visibility:visible;width:0px;background-color:transparent;"><iframe id="aswift_2" name="aswift_2" style="left:0;position:absolute;top:0;border:0;width:undefinedpx;height:undefinedpx;" sandbox="allow-forms allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" frameborder="0" src="https://googleads.g.doubleclick.net/pagead/ads?guci=2.2.0.0.2.2.0.0&amp;client=ca-pub-1076724771190722&amp;output=html&amp;adk=1812271804&amp;adf=3025194257&amp;lmt=1609934092&amp;plat=1%3A16777224%2C2%3A8%2C9%3A32776%2C10%3A32%2C11%3A32%2C16%3A8388608%2C17%3A32%2C24%3A32%2C25%3A32%2C30%3A1048576%2C32%3A32%2C40%3A32&amp;format=0x0&amp;url=https%3A%2F%2Fblog.csdn.net%2Fsoilwork%2Farticle%2Fdetails%2F1452437&amp;ea=0&amp;flash=0&amp;pra=7&amp;wgl=1&amp;dt=1609934091749&amp;bpp=3&amp;bdt=1486&amp;idt=307&amp;shv=r20201203&amp;cbv=r20190131&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3Dabae74b1af113cf7-2284b68a8cc5007c%3AT%3D1609924037%3ART%3D1609924037%3AS%3DALNI_MbISe9R06kOQTXvnUNRCBezpAp3bA&amp;prev_fmts=712x104%2C300x250&amp;nras=1&amp;correlator=3157332682838&amp;frm=20&amp;pv=1&amp;ga_vid=1355739629.1609934092&amp;ga_sid=1609934092&amp;ga_hid=176432530&amp;ga_fc=0&amp;u_tz=480&amp;u_his=2&amp;u_java=0&amp;u_h=1080&amp;u_w=1920&amp;u_ah=1040&amp;u_aw=1920&amp;u_cd=24&amp;u_nplug=3&amp;u_nmime=4&amp;adx=-12245933&amp;ady=-12245933&amp;biw=912&amp;bih=872&amp;scr_x=0&amp;scr_y=0&amp;eid=21067982%2C21068084%2C21068769&amp;oid=3&amp;pvsid=1491051520445906&amp;pem=508&amp;rx=0&amp;eae=2&amp;fc=896&amp;brdim=10%2C10%2C10%2C10%2C1920%2C0%2C945%2C1020%2C929%2C889&amp;vis=1&amp;rsz=%7C%7Cs%7C&amp;abl=NS&amp;fu=9224&amp;bc=31&amp;ifi=3&amp;uci=a!3&amp;fsb=1&amp;dtd=320" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no" allowfullscreen="true" data-google-container-id="a!3" data-load-complete="true"></iframe></ins></ins></ins><div>
  <div class="csdn-side-toolbar " style="bottom: 64px !important; left: 1146px;">
    
    <a class="option-box" data-type="guide">
      <img src="https://g.csdnimg.cn/side-toolbar/2.8/images/guide.png" alt="" srcset="" />
      <span class="show-txt">新手<br />引导</span>
    </a>
    
    
    
    
    <a class="option-box" data-type="cs">
      <img src="https://g.csdnimg.cn/side-toolbar/2.8/images/kefu.png" alt="" srcset="" />
      <span class="show-txt">客服</span>
    </a>
    
    
    
    <a class="option-box" data-type="report">
      <span class="show-txt" style="display:flex;opacity:100;">举报</span>
    </a>
    
    
    <a class="option-box go-top-hide" data-type="gotop">
      <img src="https://g.csdnimg.cn/side-toolbar/2.8/images/fanhuidingbucopy.png" alt="" srcset="" />
      <span class="show-txt">返回<br />顶部</span>
    </a>
    
  </div>
  </div><iframe id="google_osd_static_frame_2788306073405" name="google_osd_static_frame" style="display: none; width: 0px; height: 0px;"></iframe></body><iframe id="google_esf" name="google_esf" src="https://googleads.g.doubleclick.net/pagead/html/r20201203/r20190131/zrt_lookup.html#" data-ad-client="ca-pub-1076724771190722" style="display: none;"></iframe><iframe style="display: none;"></iframe><ins class="adsbygoogle adsbygoogle-noablate" style="display: none !important; width: 100vw !important; height: 100vh !important; inset: 0px auto auto 0px !important; clear: none !important; float: none !important; margin: 0px !important; max-height: none !important; max-width: none !important; opacity: 1 !important; overflow: visible !important; padding: 0px !important; position: fixed !important; vertical-align: baseline !important; visibility: visible !important; z-index: 2147483647 !important; background-color: white !important;" data-adsbygoogle-status="done" aria-hidden="true" data-vignette-loaded="true"><ins id="aswift_3_expand" style="display: inline-table !important; border: none !important; height: 100vh !important; margin: 0px !important; padding: 0px !important; position: relative !important; visibility: visible !important; width: 100vw !important; background-color: transparent !important; inset: auto !important; clear: none !important; float: none !important; max-height: none !important; max-width: none !important; opacity: 1 !important; overflow: visible !important; vertical-align: baseline !important; z-index: auto !important;" tabindex="0" title="Advertisement" aria-label="Advertisement"><ins id="aswift_3_anchor" style="display: block !important; border: none !important; height: 100vh !important; margin: 0px !important; padding: 0px !important; position: relative !important; visibility: visible !important; width: 100vw !important; background-color: transparent !important; inset: auto !important; clear: none !important; float: none !important; max-height: none !important; max-width: none !important; opacity: 1 !important; overflow: visible !important; vertical-align: baseline !important; z-index: auto !important;"><iframe id="aswift_3" name="RS-0-&amp;adk=1812271808&amp;client=ca-pub-1076724771190722&amp;fa=8" sandbox="allow-forms allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" width="" height="" frameborder="0" src="https://googleads.g.doubleclick.net/pagead/html/r20201203/r20190131/zrt_lookup.html?fsb=1#ifi=4&amp;uci=a!4&amp;xpc=2itJx0NM4f&amp;p=https%3A//blog.csdn.net" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no" allowfullscreen="true" style="width: 100vw !important; height: 100vh !important; inset: 0px auto auto 0px !important; position: absolute !important; clear: none !important; display: inline !important; float: none !important; margin: 0px !important; max-height: none !important; max-width: none !important; opacity: 1 !important; overflow: visible !important; padding: 0px !important; vertical-align: baseline !important; visibility: visible !important; z-index: auto !important;" data-google-container-id="a!4" data-google-query-id="COXAh-6fh-4CFXa9lgodzDkCQQ" data-load-complete="true"></iframe></ins></ins></ins></html>