<?php
if ($PHORUM['DATA']['CHARSET']) {
    header("Content-Type: text/html; charset=".htmlspecialchars($PHORUM['DATA']['CHARSET']));
    echo '<?xml version="1.0" encoding="'.$PHORUM['DATA']['CHARSET'].'"?>';
} else {
    echo '<?xml version="1.0" ?>';
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{LOCALE}" lang="{LOCALE}">
<head>

<title>{LANG->eric_forum}</title>

{LANG_META}

{IF PRINTVIEW}
    <meta name="robots" content="NOINDEX,NOFOLLOW">
    <link rel="stylesheet" type="text/css" href="{URL->CSS_PRINT}" media="screen,print" />
{ELSE}
    <link rel="stylesheet" type="text/css" href="{URL->CSS}" media="screen" />
    <link rel="stylesheet" type="text/css" href="{URL->CSS_PRINT}" media="print" />
{/IF}
{IF URL->JAVASCRIPT}
    <script type="text/javascript" src="{URL->JAVASCRIPT}"></script>
{/IF}
{IF URL->FEED}
    <link rel="alternate" type="{FEED_CONTENT_TYPE}" title="{FEED}" href="{URL->FEED}" />
{/IF}
{IF URL->REDIRECT}
    <meta http-equiv="refresh" content="{IF REDIRECT_TIME}{REDIRECT_TIME}{ELSE}5{/IF}; url={URL->REDIRECT}" />
{/IF}

{IF DESCRIPTION}
    <meta name="description" content="{LANG->eric_forum}" />
{/IF}

{HEAD_TAGS}

<script language="javascript">
   var alter_header = 0;
   var alter_read = 0;
   var pictureSeries = 0;
   var maxPicture = 35;
   var ranNumber=Math.floor(Math.random()*maxPicture);
   var picName =  "cloud" + ranNumber + ".jpg";
   

   var dragMode = 0;
   var leftWidth = 500;
   var rightWidth = 440;

   var message_id = 0;

   var rid = 0;
   var tid = 0;
   var oldTid= 0;
   var posy = 0;

   
   function show_head(){
        if (alter_header==0){
		    alter_header=1;
			document.getElementById('old_header').style.display='block'; 
			document.getElementById('rnca_header').style.display='none'; 
                        document.getElementById('rnca_fn').style.display='none'; 

		}else{
		    alter_header=0;
			document.getElementById('old_header').style.display='none'; 
			document.getElementById('rnca_header').style.display='block'; 
                        document.getElementById('rnca_fn').style.display='block';
		}
   }
   function change_background(){
        pictureSeries = pictureSeries + 1;
		if (pictureSeries>maxPicture)
		    pictureSeries = 0;
			
		ranNumber=Math.floor(Math.random()*maxPicture);
		
        picName =  "cloud" + ranNumber + ".jpg";
		document.getElementById("topBanner").style.backgroundImage = "url(" + picName + ")";
		// setTimeout('change_background()', 20000);
   }
   function change_read(){
        if (alter_header==0){
		    alter_header=1;
			document.getElementById('leftContent').style.display='none'; 
			document.getElementById('rightContent').style.width='930px';
			document.getElementById('rightContent').style.height='400px';
			
			document.getElementById('quickRead').style.width = '930px';
			document.getElementById('quickRead').style.height = '380px';
			document.getElementById('quickRead').style.top = '290px';			
		}else{
		    alter_header=0;
			document.getElementById('leftContent').style.display='block'; 
			document.getElementById('leftContent').style.width=leftWidth;
			document.getElementById('rightContent').style.width=rightWidth; 			
			reload_setup();
		}  
   }
   function show_message(myId){
           var temp = 0;
		   var temp1 = 0;

		   if (event.pageX || event.pageY) { 
                posy = event.pageY; 
           } 
           else if (event.clientX || event.clientY) { 
                posy = event.clientY + document.body.scrollTop 
                       + document.documentElement.scrollTop; 
           }
          
		    posy = posy-event.clientY;
		    if(posy <290)
		       posy = 290;
            document.getElementById("rnca_read"+oldTid).style.display = 'none';
			document.getElementById("rnca_read"+myId).style.display = 'block';
			//document.getElementById("rnca_read"+myId).style.top = posy + "px";
			oldTid = myId;        
			document.getElementById("quickRead").style.top = posy + "px";
			
			temp = rightWidth -10;
 		    document.getElementById("quickRead").style.width = temp + "px";
			temp=document.getElementById("leftContent").clientHeight;
			temp1=280+parseInt(temp)-posy;
			if(temp1<0)
			   temp1=0;
			document.getElementById("quickRead").style.height = temp1;

   }
   function show_message_update(){
           var temp = 0;

		   if (event.pageX || event.pageY) { 
                posy = event.pageY; 
           } 
           else if (event.clientX || event.clientY) { 
                posy = event.clientY + document.body.scrollTop 
                       + document.documentElement.scrollTop; 
           }
		   posy = posy-event.clientY;
		   if(posy <290)
		      posy = 290;
		   document.getElementById("quickRead").style.top = posy + "px";
			temp=document.getElementById("leftContent").clientHeight;
			temp=280+parseInt(temp)-posy;
			if(temp<0)
			   temp=0;
			document.getElementById("quickRead").style.height = temp;

   }
   function reload_setup(){
       if(document.getElementById('leftContent')){
          document.getElementById('leftContent').style.width = leftWidth;
          document.getElementById('rightContent').style.width = rightWidth;
          document.getElementById('quickRead').style.width = rightWidth -10;
	   }
   }
</script>

</head>

<body onload="{IF FOCUS_TO_ID}var focuselt=document.getElementById('{FOCUS_TO_ID}'); if (focuselt) focuselt.focus();{/IF} document.getElementById('topBanner').style.backgroundImage='url(' + picName + ')'; /*reload_setup();  setTimeout('change_background()', 10000); */"  style="background-color: lightgray; ">
<div id="phorum">
{IF NOT PRINTVIEW}


<div style=" width:950px; height:280px; background-color:#66CCCC;border-width:0px; border-spacing:0px;padding:0px; text-align:center; ">
   <div style="width:950px; height:80px; vertical-align:top;">
      <div style="background-color:#FFFF99; width:150px; height:80px; float:left;">
        <img width="150px" height="80px" style="opacity:0.5;filter:alpha(opacity=50);" src="maoTie2.png"  />
      </div> 
      <div id="topBanner" style="background-image:url('cloud0.jpg'); background-position: 50% 50%; background-repeat: no-repeat; height:80px; width: 800px; float:left; " onclick="change_background();return true;">
      </div>
   </div>  
   <div style="background-color:lightgray; width:950px; height:200px; vertical-align:top;">	
      <div align="left" style="height:200px; width:145px; float:left; background-color:lightgray; opacity:0.5;filter:alpha(opacity=50); border: 1px solid green;">
  	       <center><a href="{URL->INDEX}"><font size="3">[{LANG->ForumList}]</font></a></center>
			 <hr />
        {IF USER->user_id}
            &nbsp;&nbsp;[{LANG->Welcome}, {USER->username} <br />
             <small>(<a href="{URL->LOGINOUT}">
                     <font size="2">
                          {LANG->LogOut}
                     </font></a>)
             </small>]
	     <br />
             [<a href="{URL->REGISTERPROFILE}">
                     <font size="2">{LANG->MyProfile}</font>
             </a>]&nbsp;
			
           {IF ENABLE_PM}
               {IF USER->new_private_messages}
                  <strong><a class="icon" href="{URL->PM}"><font size="2">[{LANG->NewPrivateMessages}]</font></a></strong>
               {ELSE}
                  <a class="icon" href="{URL->PM}"><font size="2">[{LANG->PrivateMessages}]</font></a>
               {/IF}
           {/IF}
        {ELSE}
               [<a class="icon" href="{URL->LOGINOUT}"><font size="2">{LANG->LogIn}</font></a>]
               <br />[<a class="icon" href="{URL->REGISTERPROFILE}"><font size="2">{LANG->Register}</font></a>]
        {/IF}
		 <br />
         <a href="index.php?17"><font size="2">[{LANG->eric_forumname17}]</font></a>
         <a href="index.php?29"><font size="2">[{LANG->eric_forumrule}]</font></a>
	 <br /><a href="{URL->SEARCH}"><font size="2">[{LANG->Advanced}]</font></a>
         <!--
            <div>
              {MOD_ANNOUNCEMENTS} 
            </div>
         -->
         {IF GLOBAL_ERROR}<div class="attention">{GLOBAL_ERROR}</div>{/IF}

         {IF USER->NOTICE->SHOW}
           <div class="attention">
             <h4>{LANG->NeedsAttention}</h4>
             {IF USER->NOTICE->MESSAGES}<a class="icon icon-table-add" href="{URL->NOTICE->MESSAGES}">{LANG->UnapprovedMessagesLong}</a>{/IF}
             {IF USER->NOTICE->USERS}<a class="icon icon-user-add" href="{URL->NOTICE->USERS}">{LANG->UnapprovedUsersLong}</a>{/IF}
             {IF USER->NOTICE->GROUPS}<a class="icon icon-group-add" href="{URL->NOTICE->GROUPS}">{LANG->UnapprovedGroupMembers}</a>{/IF}
           </div>
         {/IF}
          <!--
            <br /><br />              
		<form>
		    <input type="button" value="{LANG->eric_change_header}" onclick="show_head(); return true;" />
		</form>
               <font size="2">{LANG->eric_admin}</font>
          -->
     </div>
     {IF FORUM_ID 0}
     <div id ="rnca_header" style="display:block; border-width:0px; border-spacing:0px; vertical-align:top; width:800px; height:200px; float:left;>
       <div style="vertical-align:top; height:200px;">
         <img width="800px" height="200px" style="opacity:0.8;filter:alpha(opacity=80);" src="bookshelf3.jpg" usemap="#bookmap" /> 
          <map name="bookmap">
          <area shape="rect"   coords="45,40,95,165" href="index.php?40" alt="News" target="_parent"/>
          <area shape="rect" coords="95,40,155, 165" href="index.php?41" alt="XueYuan" target="_parent" />
          <area shape="rect" coords="155,40, 205,165" href="index.php?42" alt="{LANG->eric_forumname2}" target="_parent" />
          <area shape="rect" coords="205,40, 240,165" href="index.php?2" alt="{LANG->eric_forumname3}" target="_parent" />
          <area shape="rect" coords="240,35, 290,165" href="index.php?3" alt="{LANG->eric_forumname4}" target="_parent" />
          <area shape="rect" coords="290,45, 350,165" href="index.php?4" alt="{LANG->eric_forumname5}" target="_parent" />
          <area shape="rect" coords="350,40, 380,165" href="index.php?26" alt="{LANG->eric_forumname6}" target="_parent" />
          <area shape="rect" coords="380,40, 415,165" href="index.php?37" alt="{LANG->eric_forumname7}" target="_parent" />
          <area shape="rect" coords="415,40, 468,165" href="index.php?15" alt="{LANG->eric_forumname8}" target="_parent" />
          <area shape="rect" coords="468,40, 515,165" href="index.php?17" alt="{LANG->eric_forumname9}" target="_parent" />
          <area shape="rect" coords="515,40, 555,165" href="index.php?34" alt="{LANG->eric_forumname10}" target="_parent" />
          <area shape="rect" coords="555,40, 578,165" href="pm.php" alt="{LANG->eric_forumname11}" target="_parent" />
          <area shape="rect" coords="578,40, 615,165" href="search.php?" alt="{LANG->eric_forumname12}" target="_parent" />
          <area shape="rect" coords="615,40, 652,165" href="index.php?29" alt="{LANG->eric_forumname13}" target="_parent" />
          <area shape="rect" coords="652,35, 706,165" href="index.php?48" alt="{LANG->eric_forumname14}" target="_parent" />
          <area shape="rect" coords="706,35, 753,165" href="index.php?49" alt="{LANG->eric_forumname15}" target="_parent" />
          </map>
       </div>

     {ELSE}

 	   <div id="old_header" style=" width:800px; height:200px; vertical-align:top; float:left;border-right: 1px solid green; border-bottom: 1px solid green; display:block; border-spacing:0px;">	 
        {IF FORUM_ID}
       	    {IF FORUM_ID 2}
              <center>
                 <img width="400" height="80" style="opacity:0.6;filter:alpha(opacity=60)" src="fang.jpg" />
                 <br /><font size="4">{LANG->eric_webmaster} {LANG->eric_webmastername}</font><br />
             </center>
            {ELSEIF FORUM_ID 3}
              <center>
                 <img width="400" height="80" style="opacity:0.6;filter:alpha(opacity=60)" src="xiao.jpg" />
                 <br />   <font size="4">{LANG->eric_webmaster} {LANG->eric_webmastername}</font><br />
              </center>
            {ELSEIF FORUM_ID 4}
              <center>
                 <img width="400" height="80" style="opacity:0.6;filter:alpha(opacity=60)" src="yiming.jpg" />
                 <br /><font size="4">{LANG->eric_webmaster} {LANG->eric_webmastername}</font><br />
              </center>
             {ELSEIF FORUM_ID 29}
                 <center>
                 <img width="400"  height="80"  style="opacity:0.6;filter:alpha(opacity=60)" src="maoTie.jpg" />
                 </center>    
             {ELSE}
                 <center>
 	          <font size="4">{LANG->eric_forumname}</font><br />
                  <font size="4">{LANG->eric_webmaster} {LANG->eric_webmastername}</font><br />
                  <br /><br />
                 </center>  
             {/IF}
        {ELSE}
          <center>
          <img width="400"  height="80"  style="opacity:0.6;filter:alpha(opacity=60)" src="maoTie.jpg" />
          </center>
          <br />
        {/IF}
	<div>
            {IF FORUM_ID 29}
               <font size="3">{LANG->eric_gramma}</font>
	    {ELSE}
	       {If FORUM_ID 2}
               {ELSEIF FORUM_ID 3}
               {ELSEIF FORUM_ID 4}
               {ELSE}
    	          <font size="3">{LANG->eric_gramma}</font><br />
 	       {/IF}   
            {/IF} 
       </div>
        <hr style="width:60%; border: 1px solid green;" /> 			
	<div>
            {IF FORUM_ID 29}
       	    {ELSE}
 	       {LANG->eric_links}
            {/IF} 
       </div>
        <hr style="width:60%; border: 1px solid green;" /> 			


        <div  align="center"> 
             {IF FORUM_ID 29}
             {ELSE}
                [<a href="{URL->LIST}">
                    <font size="2">{LANG->MessageList}</font>
                </a>]
             {/IF}

              [<a href="index.php?3">
                   <font size="2">{LANG->eric_forum_name3}</font>
              </a>]
              [<a href="index.php?2">
                   <font size="2">{LANG->eric_forum_name2}</font>
              </a>]
              [<a href="index.php?4">
                   <font size="2">{LANG->eric_forum_name4}</font>
              </a>]
              [<a href="index.php?37">
                   <font size="2">{LANG->eric_forum_name37}</font>
              </a>]
              [<a href="index.php?26">
                   <font size="2">{LANG->eric_forum_name26}</font>
              </a>]
 	      [<a href="index.php?27">
                   <font size="2">{LANG->eric_forum_name27}</font>
              </a>]
              [<a href="index.php?31">
                   <font size="2">{LANG->eric_forum_name31}</font>
              </a>]
              [<a href="index.php?32">
                   <font size="2">{LANG->eric_forum_name32}</font>
              </a>]

        </div>
   </div>
  {/IF}
  
</div>
</div>

{/IF}