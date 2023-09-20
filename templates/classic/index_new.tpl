<table class="centerCon">
<tr><td id= "contentArea" class="contentArea">
   <table style="width:100%;">
    <script language="javascript">
	    var fid = "fid";
		var fcounter=0;
		fid = fid + fcounter;
	</script>
   
    {VAR first_pass 1}
    {LOOP FORUMS}
    <tr>
    {IF FORUMS->level 0}
       {IF FORUMS->forum_id FORUMS->vroot}
            <th align="left" valign="top" style="background-color:white;border-bottom: 1px solid green;color: gray;">
               <b>{LANG->Forums}</b>
            </th>
         {ELSE}
            <th align="left" valign="top" class="forumBanner">
 		<b>{FORUMS->name}</b>
            </th>
         {/IF}

    {ELSE}
         {IF FORUMS->folder_flag}
            <td>
               &nbsp;&nbsp;
                  <a href="{FORUMS->URL->INDEX}"><span style="font-size: 14px;">{FORUMS->name}</span></a>
            </td>
         {ELSE}
            <td>
		      <script language="javascript">	 
                  document.write("<span  onmouseover=\"document.getElementById('" + fid);
  				  document.write("').style.display='block';  return true;\""); 
				  document.write(" onmouseout =\"document.getElementById('" + fid );
				  document.write("').style.display='none';   return true;\">");
              </script>	

			       &nbsp;&nbsp;			   
  			      <a href="{FORUMS->URL->LIST}"><span style="letter-spacing: -0.5px;font-size:14px;">{FORUMS->name}</font></a>
                  {IF FORUMS->new_message_check}
                       <span class="new-indicator" letter-spacing="0px;"><span style="font-size: 14px;">({LANG->NewMessages})</span></span>
                  {/IF}                
              </span>

  		      <script language="javascript">				  
			      document.write("<div id='" + fid+ "' style='display:none; border: thin; border-color: blue; '>");
				  fcounter = fcounter+1; 
				  fid=fid+fcounter;
			  </script>
      			    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 14px;">{LANG->Threads} - {FORUMS->thread_count}</span><br />
                    {IF FORUMS->new_threads}
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="new-flag"><span style="font-size: 12px;">({FORUMS->new_threads} {LANG->newflag})</span></span> <br />
                    {/IF}
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 14px;">{LANG->Posts} - {FORUMS->message_count}</span> <br />
                    {IF FORUMS->new_messages}
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="new-flag"><span style="font-size: 12px;">({FORUMS->new_messages} {LANG->newflag})</span></span> <br />
                    {/IF}
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 14px;">{LANG->LastPost} - {FORUMS->last_post}</span>
 			   </div>
            </td>
 		  {/IF}
     {/IF}
    </tr>

    {/LOOP FORUMS}
   </table>
 </td>
 <td id="hotPick" class="hotPick">  
  <table style="width:100%; height:100%; padding: 0px 0px 0px 0px; margin: 0px 0px 0px 0px;">
   {IF MESSAGES_T}
    <tr><td colspan="2">
         <div align="center" class="topicBanner1" >
          {LANG->eric_topten1}
         </div>
    </td></tr>        
   {/IF}
   {LOOP MESSAGES_T}
    <tr><td width="190" style=" vertical-align:top;">
         <a href="{MESSAGES_T->forum_rnca_link}">
            <span style="font-size:14px;color:lighgray;letter-spacing: 0px;">
              [{MESSAGES_T->forum_name}]
         </span></a>
    </td><td width="450" >
	 <a href="{MESSAGES_T->URL->READ}">
            <span style="font-size:14px;color:lighgray;letter-spacing: 0px;">
               {MESSAGES_T->subject}
            </span>
         </a>
    </td></tr>
    {/LOOP MESSAGES_T}

    {IF MESSAGES_G}
    <tr><td colspan="2">
	          <div align="center" class="topicBanner" >{LANG->eric_guide1}</div>
     </td></tr>
    {/IF}
    {LOOP MESSAGES_G}
     <tr><td width="190" style=" vertical-align:top;">
        <a href="{MESSAGES_G->forum_rnca_link}">
           <span style="font-size:14px;color:lighgray;letter-spacing: 0px;">
              [{MESSAGES_G->forum_name}]
        </span></a>
     </td><td width="450" align="left">
	 <a href="{MESSAGES_G->URL->READ}">
            <span style="font-size:14px;color:lighgray;letter-spacing:0px;">
               {MESSAGES_G->subject}
            </span>
         </a>
     </td></tr>
     {/LOOP MESSAGES_G}

     {IF MESSAGES_R}
      <tr><td colspan="2">
          <div align="center" class="topicBanner">{LANG->eric_recommend1}</div>
      </td></tr>
     {/IF}
     {LOOP MESSAGES_R}
      <tr><td width="190" style=" vertical-align:top;">
        <a href="{MESSAGES_R->forum_rnca_link}">
           <span style="font-size:14px;color:lighgray;letter-spacing: 0px;">
              [{MESSAGES_R->forum_name}]
        </span></a>
      </td><td width="450" >
          <a href="{MESSAGES_R->URL->READ}">
            <span style="font-size:14px;color:lighgray;letter-spacing:0px;">
              {MESSAGES_R->subject}
            </span>
          </a>
      </td></tr>
     {/LOOP MESSAGES_R}

     {IF MESSAGES_H}
     <tr><td colspan="2" style="vertical-align:top;">
         <div align="center" class="topicBanner" >{LANG->eric_hot1}</div>
     </td></tr>
     {/IF}
     {LOOP MESSAGES_H}
     <tr><td width="190" style=" vertical-align:top;">
       <a href="{MESSAGES_H->forum_rnca_link}">
          <span style="font-size:14px;color:lighgray;letter-spacing: 0px;">
            [{MESSAGES_H->forum_name}]
       </span></a>
     </td><td width="450" >
         <a href="{MESSAGES_H->URL->READ}">
            <span style="font-size:14px;color:lighgray;letter-spacing:0px;">
              {MESSAGES_H->subject}
            </span>
         </a>
     </td></tr>
     {/LOOP MESSAGES_H}
     <tr>
        <td colspan="2" style="height:100%">&nbsp;</td>
     </tr>
    </table>  
</td>
<td class="rightAd">   

  <div>
     <script type="text/javascript">
        ch_client = "sunshine12";
        ch_width = 120;
        ch_height = 600;
        ch_type = "mpu";
        ch_sid = "Chitika Default";
        ch_backfill = 1;
        ch_color_site_link = "#0000CC";
        ch_color_title = "#0000CC";
        ch_color_border = "#FFFFFF";
        ch_color_text = "#000000";
        ch_color_bg = "#2A821D";
     </script>
     <script src="http://scripts.chitika.net/eminimalls/amm.js" type="text/javascript">
     </script>
  </div>


<style type="text/css">
@import url(http://www.google.com/cse/api/branding.css);
</style>
<div class="cse-branding-bottom" style="background-color:#FFFFFF;color:#000000">
  <div class="cse-branding-form">
    <form action="http://www.2250s.com/result.php" id="cse-search-box">
      <div>
        <input type="hidden" name="cx" value="partner-pub-0469974710562890:g5ie00a2w88" />
        <input type="hidden" name="cof" value="FORID:9" />
        <input type="hidden" name="ie" value="UTF-8" />
        <input type="text" name="q" size="25" />
        {IF VERSION 1}
           <input type="submit" name="sa" value="&#x641c;&#x7d22;" />
        {ELSE}
           <input type="submit" name="sa" value="Search" />
        {/IF}
      </div>
    </form>
  </div>
  <div class="cse-branding-logo">
    <img src="http://www.google.com/images/poweredby_transparent/poweredby_FFFFFF.gif" alt="Google" />
  </div>
  <div class="cse-branding-text">
    {IF VERSION 1}
      &#33258;&#23450;&#20041;&#25628;&#32034;
    {/IF}
  </div>
</div>


</td></tr>
</table>

