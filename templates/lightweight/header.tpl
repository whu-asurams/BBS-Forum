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
   var maxPicture = 47;
   var ranNumber=0;
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

   function fengjing(){
	ranNumber=Math.floor(Math.random()*maxPicture);	
        picName =  "cloud" + ranNumber + ".jpg";
       document.getElementById("topBanner").style.backgroundImage ="url(" + picName + ")";
   }

</script>

</head>

<body onload="{IF FOCUS_TO_ID}var focuselt=document.getElementById('{FOCUS_TO_ID}'); if (focuselt) focuselt.focus();{/IF} style='width:120%;'; fengjing();" > 

<div id="phorum" style="position: absolute; left: 30px; top:10px;">
{IF NOT PRINTVIEW}


<!--
<div style=" width:950px; height:275px; background-color:blue;border-width:0px; border-spacing:0px;padding:0px; text-align:center; filter:progid:DXImageTransform.Microsoft.Gradient(endColorstr='#CEF6E3', startColorstr='#0B3861', gradientType='0');  ">
-->
<div style=" width:950px; height:270px; ">
   <div style="width:950px; height:80px; vertical-align:top;border-width:0px; border-spacing:0px;padding:0px;">
      <div style="background-color:#FFFF99; width:150px; height:80px; float:left;">
         <img width="150px" height="80px" style="opacity:0.5;filter:alpha(opacity=50);" src="maoTie2.png"  />        
      </div> 
      <div id="topBanner" height="80" align="bottom" style="background-image: none;background-position: 50% 50%; background-repeat: no-repeat;width:800px; height:80px; float:left;" onclick="change_background();return true;">
      </div>
   </div>  
   <div style="width:950px; height:180px; vertical-align:top; background-image: url('./topBG.jpg');background-repeat: repeat-x; background-position: top;border-width:0px; border-spacing:0px;padding:0px;">	
      <div align="left" style="height:178px; width:148px; float:left; opacity:0.5;filter:alpha(opacity=50); border: 1px solid green;">
  	<center>
            <a href="{URL->INDEX}"><font size="3" color="black"><b>[{LANG->ForumList}]</b></font></a>
	    <hr />
        {IF USER->user_id}
            <span style="font-size:12px;color:black; ">{LANG->Welcome}&nbsp;<b>{USER->username}!</span></b><br />
             <small><a href="{URL->LOGINOUT}">
                     <span style="font-size:12px;color:black;">
                          <b>[{LANG->LogOut}]</b>
                     </span></a>
             </small>
	     <br />
             <a href="{URL->REGISTERPROFILE}">
                     <span style="font-size:12px;color:black;"><b>[{LANG->MyProfile}]</b></span>
             </a>
			
           {IF ENABLE_PM}
               <br />
               {IF USER->new_private_messages}
                  <strong><a href="{URL->PM}"><span style="font-size:12px;color:black;"><b>[{LANG->NewPrivateMessages}]</b></span></a></strong>
               {ELSE}
                  <a href="{URL->PM}"><span style="font-size:12px;color:black;"><b>[{LANG->PrivateMessages}]</b></span></a>
               {/IF}
           {/IF}
        {ELSE}
               [<a href="{URL->LOGINOUT}"><span style="font-size:12px;color:black;">{LANG->LogIn}</span></a>]
               <br />[<a href="{URL->REGISTERPROFILE}"><b><span style="font-size:12px;color:black;"></b>{LANG->Register}</span></a>]
        {/IF}
	 <br /><a href="{URL->SEARCH}"><span style="font-size:12px;color:black;"><b>[{LANG->Advanced}]</b></span></a>
         <br /><a href="list.php?17"><span style="font-size:12px;color:black;"><b>[{LANG->eric_forumname17}]</b></span></a>
         <a href="list.php?29"><span style="font-size:12px;color:black;"><b>[{LANG->eric_forumrule}]</b></span></a>
         <br /><a href="read.php?29,2810,2810"><span style="font-size:12px;color:black;"><b>[{LANG->eric_aboutus}]</b></span></a>

         {IF GLOBAL_ERROR}<div class="attention">{GLOBAL_ERROR}</div>{/IF}

         {IF USER->NOTICE->SHOW}
           <div class="attention">
             <h4>{LANG->NeedsAttention}</h4>
             {IF USER->NOTICE->MESSAGES}<a class="icon icon-table-add" href="{URL->NOTICE->MESSAGES}">{LANG->UnapprovedMessagesLong}</a>{/IF}
             {IF USER->NOTICE->USERS}<a class="icon icon-user-add" href="{URL->NOTICE->USERS}">{LANG->UnapprovedUsersLong}</a>{/IF}
             {IF USER->NOTICE->GROUPS}<a class="icon icon-group-add" href="{URL->NOTICE->GROUPS}">{LANG->UnapprovedGroupMembers}</a>{/IF}
           </div>
         {/IF}

       </center>
     </div>

     <div id="old_header" style=" width:799px; height:179px; vertical-align:top; float:left;border-right: 1px solid green; border-bottom: 1px solid green; display:block;">	 
        {IF VERSION 1}
        <!--        


        -->
        {ELSE}


        {/IF}
       <div id = "eric_fn" align="center">
              <font size="6"><b>{LANG->eric_forumname}</b></font><br /><br />
              {IF FORUM_ID 29}
       	      {ELSE}
                  <font size="3"><b>{LANG->eric_webmaster}{LANG->eric_webmastername}</b></font><br />
              {/IF}
       </div>

        <br />  

           <hr style="width:80%; border: 1px solid green;" /> 			
     	   <div align="center">
              {IF FORUM_ID 29}
       	      {ELSE}
 	         <span style="font-size:12px;">{LANG->eric_links}</span>
              {/IF} 
           </div>
           <hr style="width:80%; border: 1px solid green;" /> 			

        <div  align="center"> 
             {IF FORUM_ID 29}
             {ELSE}
                [<a href="{URL->LIST}">
                    <span style="font-size:12px;color:green;">{LANG->MessageList}</span>
                </a>]
             {/IF}

              [<a href="list.php?3">
                   <span style="font-size:12px;color:green;">{LANG->eric_forum_name3}</span>
              </a>]
              [<a href="list.php?2">
                   <span style="font-size:12px;color:green;">{LANG->eric_forum_name2}</span>
              </a>]
              [<a href="list.php?4">
                   <span style="font-size:12px;color:green;">{LANG->eric_forum_name4}</span>
              </a>]
              [<a href="list.php?37">
                   <span style="font-size:12px;color:green;">{LANG->eric_forum_name37}</span>
              </a>]
              [<a href="list.php?53">
                   <span style="font-size:12px;color:green;">{LANG->eric_forum_name53}</span>
              </a>]
 	      [<a href="list.php?38">
                   <span style="font-size:12px;color:green;">{LANG->eric_forum_name38}</span>
              </a>]
              [<a href="list.php?31">
                   <span style="font-size:12px;color:green;">{LANG->eric_forum_name31}</span>
              </a>]

        </div>
   </div>
  
</div>
</div>

{/IF}

<div class = "centerContent">
