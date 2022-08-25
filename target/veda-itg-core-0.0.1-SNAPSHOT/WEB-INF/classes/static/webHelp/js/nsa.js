/*! HelpSmith Web Help System 3.0
* http://www.helpsmith.com
* Copyright (c) 2007-2019 Divcom Software */
$(document).ready(function(){$(window).on("resize",function(){alignDocument()}).trigger("resize")});function alignDocument(){var b=$("#non-scrolling-area");if(!(0>=b.length)){var a=$("#container");if(!(0>=a.length)){var c=a.find("> #content-background");if(!(0>=c.length)){var d=c.find("> #content");if(!(0>=d.length))try{var e=b.outerHeight(!0);a.css({top:b.position().top+e,height:$(window).innerHeight()-e});c.css({height:Math.max(d.innerHeight(),a.height())})}catch(f){}}}}};