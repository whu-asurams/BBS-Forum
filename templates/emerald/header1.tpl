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

</head>
<body onload="{IF FOCUS_TO_ID}var focuselt=document.getElementById('{FOCUS_TO_ID}'); if (focuselt) focuselt.focus();{/IF}" >
<table>
<tr>
   <td>
      <img width="100" height="70" style="opacity:0.8;filter:alpha(opacity=80)" src="maoTie.jpg"  />

   </td>
   <td>
   </td>
</tr>
<tr>
   <td>
   </td>
   <td>
      <img width="800" height="200" style="opacity:0.8;filter:alpha(opacity=80)" src="bookshelf3.jpg" usemap="#bookmap" /> 
<map name="bookmap">
  <area shape="rect"   coords="45,40,95,165" href="index.php?39" alt="News" target="_parent"/>
  <area shape="rect" coords="95,40,155, 165" href="index.php?40" alt="XueYuan" target="_parent" />
  <area shape="rect" coords="155,40, 205,165" href="index.php?41" alt="{LANG->eric_forumname2}" target="_parent" />
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
  <area shape="rect" coords="652,35, 706,165" href="index.php?42" alt="{LANG->eric_forumname14}" target="_parent" />
  <area shape="rect" coords="706,35, 753,165" href="index.php?43" alt="{LANG->eric_forumname15}" target="_parent" />
</map>

   </td>
</tr>
</table>

<!--

{! Please leave this div in your template   you can alter anything above this line }

<div id="phorum">
{IF NOT PRINTVIEW}



<div>
 {IF FORUM_ID}
         <br />
         <br />
         <br />
      {IF TOPIC->subject}
	  <center>
                <font size="5"><b><u>{LANG->eric_forumname}</u></b></font><br /><br /> 
                <font size="4">{LANG->eric_webmaster} {LANG->eric_webmastername}</font><br /><br />
                <br />
                <br />
                <br />
	  </center>

	  <font size="2" style="letter-spacing: 1px;" >{LANG->eric_gramma}</font>
                <br />
                <br />
                <br />
                <br />
                <br />

          <hr />
       {ELSE}
	   {If FORUM_ID 2}
              <center>
                 <img width="400" height="120" src="fang.jpg" />
                 <br /><font size="4">{LANG->eric_webmaster} {LANG->eric_webmastername}</font><br /><br />
 		  <br />
		  <br />
                  <br />
                  {LANG->eric_links}
		  <br />
                  <br />

             </center>
 
          {ELSEIF FORUM_ID 3}
              <center>
                 <img width="400" height="120" src="xiao.jpg" />
                 <br />   <font size="4">{LANG->eric_webmaster} {LANG->eric_webmastername}</font><br /><br />
		  <br />
		  <br />
                  <br />
                  {LANG->eric_links}
		  <br />
                  <br />

              </center>
          {ELSEIF FORUM_ID 4}
              <center>
                 <img width="400" height="120" src="yiming.jpg" />
                 <br /><font size="4">{LANG->eric_webmaster} {LANG->eric_webmastername}</font><br /><br />
		  <br />
		  <br />
                  <br />
                  {LANG->eric_links}
		  <br />
                  <br />

              </center>
           {ELSEIF FORUM_ID 29}
                 <center>
                 <br />
                 <br />
                 <img width="400"  height="120"  style="opacity:0.8;filter:alpha(opacity=80)" src="maoTie.jpg" />
                 <br />
                 <br />
                 <font size="3">{LANG->eric_gramma}</font>
                 </center>
                 <hr />
           {ELSE}
             <center>
	      <font size="5">{LANG->eric_forumname}</font><br /><br /> 
              <font size="4">{LANG->eric_webmaster} {LANG->eric_webmastername}</font><br /><br />
 	      <font size="3">{LANG->eric_gramma}</font>
		  <br />
		  <br />
                  <br />
                  <br />
              {LANG->eric_links}
              <hr />
	    </center>
          {/IF} 
       {/IF}	
  {ELSE}
          <center>
          <br />
          <br />

          <img width="400"  height="120"  style="opacity:0.8;filter:alpha(opacity=80)" src="maoTie.jpg" />
          </center>
          <br />
          <br />
          <br />
          <hr />
  {/IF}

     <div  align="right">
		{IF URL->INDEX}
                     [<a href="{URL->INDEX}">
                         <font size="2">{LANG->ForumList}</font>
                     </a>]

                {/IF}
		{IF FORUM_ID}
                    {IF FORUM_ID 29}
                    {ELSE}
                        [<a href="{URL->LIST}">
                          <font size="2">{LANG->MessageList}</font>
                        </a>]
                     {/IF}

                     {IF FORUM_ID 2}
                        [<a href="index.php?3">
                        <font size="2">{LANG->eric_forumname3}</font>
                        </a>]
                        [<a href="index.php?20">
                        <font size="2">{LANG->eric_forumname20}</font>
                        </a>]
                     {ELSEIF FORUM_ID 3}
                        [<a href="index.php?2">
                        <font size="2">{LANG->eric_forumname2}</font>
                        </a>]
                        [<a href="index.php?20">
                        <font size="2">{LANG->eric_forumname20}</font>
                        </a>]
                     {ELSE}
                        [<a href="index.php?3">
                        <font size="2">{LANG->eric_forumname3}</font>
                        </a>]
                        [<a href="index.php?2">
                        <font size="2">{LANG->eric_forumname2}</font>
                        </a>]
                     {/IF}

                {/IF}

        {IF USER->user_id}
            &nbsp;&nbsp;[{LANG->Welcome}, {USER->username} 
             <small>(<a href="{URL->LOGINOUT}">
                     <font size="2">
                          {LANG->LogOut}
                     </font></a>)
             </small>]
             [<a class="icon" href="{URL->REGISTERPROFILE}">
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
             [<a class="icon" href="{URL->REGISTERPROFILE}"><font size="2">{LANG->Register}</font></a>]
        {/IF}


         [<a href="index.php?17">
           <font size="2">{LANG->eric_forumname17}</font>
         </a>]
         <a href="index.php?29"><font size="2">[{LANG->eric_forumrule}]</font></a>
         <a href="{URL->SEARCH}"><font size="2">[{LANG->Advanced}]</font></a>
   </div>
</div>
-->

<!--
<div>
{MOD_ANNOUNCEMENTS} 
</div>

-->
		<hr />
<!--
<div id="top-right">
    <div id="search-area" class="icon-zoom">
        <form id="header-search-form" action="{URL->SEARCH}" method="get">
            {POST_VARS}
            <input type="hidden" name="phorum_page" value="search" />
            <input type="hidden" name="match_forum" value="ALL" />
            <input type="hidden" name="match_dates" value="365" />
            <input type="hidden" name="match_threads" value="1" />
            <input type="hidden" name="match_type" value="ALL" />
            <input type="text" name="search" size="20" value="" class="styled-text" /><input type="submit" value="{LANG->Search}" class="styled-button" /><br />

        </form>
    </div>
</div>
-->


<!--

<div id="top">

{IF HEADING}
    {! This is custom set heading }
    <h1>{HEADING}</h1>
    {IF HTML_DESCRIPTION}
        <div id="description">{HTML_DESCRIPTION}</div>
    {/IF}
{ELSEIF MESSAGE->subject}
    {! This is a threaded read page }
 
     <h1>{MESSAGE->subject}</h1>
  

{ELSEIF TOPIC->subject}
    {! This is a read page }
    <h1>{TOPIC->subject}</h1>
    <div id="description">{LANG->Postedby} {IF TOPIC->URL->PROFILE}<a href="{TOPIC->URL->PROFILE}">{/IF}{TOPIC->author}{IF TOPIC->URL->PROFILE}</a>{/IF}&nbsp;</div>
{ELSEIF NAME}
    {! This is a forum page other than a read page or a folder page }
    <h1>{NAME}</h1>{! replace with path see http://www.phorum.org/cgi-bin/trac.cgi/ticket/213 }
    {IF HTML_DESCRIPTION}
      <div id="description">{HTML_DESCRIPTION}&nbsp;</div>
    {/IF}
{ELSE}
    {! This is the index }
    <h1>{TITLE}</h1>
    {IF HTML_DESCRIPTION}
      <div id="description">{HTML_DESCRIPTION}&nbsp;</div>
    {/IF}
{/IF}


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


{/IF}
