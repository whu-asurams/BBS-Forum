<!-- BEGIN TEMPLATE read_hybrid.tpl -->
<div align="left" style="width:100%;">
   <br />
   <a href="{URL->LIST}">[{LANG->eric_return}]</a>
   <br />
   <br />
   <center>   
   <font size = "4"><b>{LANG->eric_read_subject}</b><br />
   <font size = "3"><b>{LANG->eric_read_author}: {LANG->eric_read_authorname}</b><br /></center>

   <br />
   <hr align="center" style="width:60%;">
   <br />

   <font size = "3" style="font-weight: 100; font-size: 12px; letter-spacing:0.5px;">{LANG->eric_read_body}<br />
<br />
<br />
<br />
<hr align="center" style="width:60%;">
<br />
</div>

{IF NOT FORUM_ID 29}
<form>
  {IF MESSAGE->edit 1}
     {IF MODERATOR false}
             <input type="button" value="{LANG->EditPost}" onclick="document.getElementById('rnca_mylist').style.display='none';document.getElementById('rnca_mybody').style.display='none';
document.location.href='{MESSAGE->URL->EDIT}'; return true;" />
        </a>
     {/IF}
  {/IF}
  <input type="button" value="{LANG->Reply}" onclick="document.getElementById('rnca_mylist').style.display='none';document.getElementById('rnca_mybody').style.display='none'; return true;" />
  
<!--
  <input type="button" value="{LANG->QuoteMessage}"  onclick="document.getElementById('rnca_mylist').style.display='none';document.getElementById('rnca_mybody').style.display='none'; document.location.href='{MESSAGE->URL->QUOTE}'; return true;" />
-->

  <input type="button" value="{LANG->eric_click_show_list}" onclick="document.getElementById('rnca_mylist').style.display='block';document.getElementById('rnca_mybody').style.display='none';
return true;" />
  <input type="button" value="{LANG->eric_click_show_all}" onclick="document.getElementById('rnca_mybody').style.display='block';document.getElementById('rnca_mylist').style.display='none';
return true;" />

  {IF MODERATOR true}
        {IF MESSAGE->threadstart true}
		<input type="button" value="{LANG->DelMessReplies}" onclick="document.getElementById('rnca_mybody').style.display='block';document.getElementById('rnca_mylist').style.display='none';
document.location.href='{MESSAGE->URL->DELETE_THREAD}'; return true;" />
                <input type="button" value="{LANG->eric_RecommendMessage}" onclick="document.location.href='{MESSAGE->URL->RECOMMEND_MESSAGE}'; return true;" />
        {ELSE}
		<input type="button" value="{LANG->DeleteMessage}" onclick="document.getElementById('rnca_mybody').style.display='block';document.getElementById('rnca_mylist').style.display='none';
document.location.href='{MESSAGE->URL->DELETE_MESSAGE}'; return true;" />

		<input type="button" value="{LANG->DelMessReplies}" onclick="document.getElementById('rnca_mybody').style.display='block';document.getElementById('rnca_mylist').style.display='none';
document.location.href='{MESSAGE->URL->DELETE_THREAD}'; return true;" />

		<input type="button" value="{LANG->SplitThread}" onclick="document.getElementById('rnca_mybody').style.display='block';document.getElementById('rnca_mylist').style.display='none';
document.location.href='{MESSAGE->URL->SPLIT}'; return true;" />

        {/IF}
        {IF MESSAGE->is_unapproved}
		<input type="button" value="{LANG->ApproveMessage}" onclick="document.getElementById('rnca_mybody').style.display='block';document.getElementById('rnca_mylist').style.display='none';
document.location.href='{MESSAGE->URL->APPROVE}'; return true;" />
        {ELSE}
		<input type="button" value="{LANG->HideMessage}" onclick="document.getElementById('rnca_mybody').style.display='block';document.getElementById('rnca_mylist').style.display='none';
document.location.href='{MESSAGE->URL->HIDE}'; return true;" />

        {/IF}
		<input type="button" value="{LANG->EditPost}" onclick="document.getElementById('rnca_mybody').style.display='block';document.getElementById('rnca_mylist').style.display='none';
document.location.href='{MESSAGE->URL->EDIT}'; return true;" />
  {/IF}
</form>


<div id="rnca_mylist" style="display:block">
  <br />
  <br />
  <br />


    {IF MESSAGES->parent_id 0}
        {IF MESSAGES->sort PHORUM_SORT_STICKY}
            {IF MESSAGES->new}
               {VAR icon "flag_red"}
               {VAR alt LANG->NewMessage}
            {ELSE}
               {VAR icon "comment"}
               {VAR alt LANG->Sticky}
            {/IF}
            {VAR title LANG->Sticky}
        {ELSEIF MESSAGES->moved}
            {VAR icon "page_go"}
            {VAR title LANG->MovedSubject}
            {VAR alt LANG->MovedSubject}
        {ELSEIF MESSAGES->new}
            {VAR icon "flag_red"}
            {VAR title LANG->NewMessage}
            {VAR alt LANG->NewMessage}
        {ELSE}
            {VAR icon "comment"}
            {VAR title ""}
            {VAR alt ""}
        {/IF}
    {ELSEIF MESSAGES->new}
        {VAR icon "flag_red"}
        {VAR title LANG->New}
    {ELSE}
        {VAR icon "bullet_black"}
        {VAR title ""}
    {/IF}

    {IF MESSAGES->new}
        {VAR newclass "message-new"}
    {ELSE}
        {VAR newclass ""}
    {/IF}


  {LANG->eric_child_message }
  <table>

   {LOOP MESSAGES}

    {IF NOT MESSAGES->parent_id 0}
        <a name="msg-{MESSAGES->message_id}"></a>
    {/IF}

    <tr>
       <td width="100%">
          <div class="message" style="padding-left: {MESSAGES->indent_cnt}px; border:none; border-bottom:0; margin: 0">
                      <img src="{URL->TEMPLATE}/images/{icon}.png" class="icon1616" alt="{alt}" title="{title}" />
                      <strong><a href="{MESSAGES->URL->READ}">{MESSAGES->subject}</a> 
			  {IF MESSAGES->new}<span class="new-flag">{MESSAGES->new}</span>{/IF}
		      </strong>
			   &nbsp;&nbsp;-&nbsp;&nbsp; 
 	              {IF MESSAGES->attachments}
                           {LOOP MESSAGES->attachments}
                               <a href="{MESSAGES->attachments->url}">
                               <font color="blue" size="2">
                                {MESSAGES->attachments->name}({MESSAGES->attachments->size})
			       </font>
			       </a> &nbsp;&nbsp;
                           {/LOOP MESSAGES->attachments}
		      {/IF} 
                      {IF MESSAGES->URL->PROFILE}<a href="{MESSAGES->URL->PROFILE}">{/IF}
                         {IF NOT FORUM_ID 33}
                            {IF NOT FORUM_ID 17}
                			    <strong> {MESSAGES->author}</strong>
                         {/IF}{/IF}
                      {IF MESSAGES->URL->PROFILE}</a>{/IF}
			   <small>
			 ({MESSAGES->size} bytes)({MESSAGES->datestamp})
                          </small>

                     <font size="2" color="red">
                    {IF MESSAGES->user->admin}
                        &nbsp; -<strong>{LANG->Admin}</strong>&nbsp; - 
                    {ELSEIF MESSAGES->moderator_post}
                        <strong>{LANG->Moderator}</strong> &nbsp; - 
                    {/IF}
                    {IF MESSAGES->ip}
                        {LANG->IP}: {MESSAGES->ip} &nbsp; - 
                    {/IF}
                    {IF MESSAGES->user}
                        {LANG->DateReg}: {MESSAGES->user->date_added} &nbsp; - 
                        {LANG->Posts}: {MESSAGES->user->posts}
                    {/IF}
                      </font>
          </div>
        </td>
    </tr>

    {/LOOP MESSAGES}
            
   </table>
  <br />
  <br />
  <br />

</div>



<div id="rnca_mybody" style="display: none">
  <br />
  <br />
  <br />

    {LOOP MESSAGES}

    {IF NOT MESSAGES->parent_id 0}
        <a name="msg-{MESSAGES->message_id}"></a>
    {/IF}

    <div class="message" style="padding-left: {MESSAGES->indent_cnt}px;">

        <div class="generic">

            <table border="0" cellspacing="0">
                <tr>
                    <td width="100%">
                        <a href="{MESSAGES->URL->READ}"><font size="2" color="blue">{MESSAGES->subject}</a> 
                        {IF MESSAGES->new}
                            <span class="new-flag">
                            <font size="2" color="blue">{MESSAGES->new}</font>
                            </span>
                        {/IF}
		        {IF MESSAGES->attachments}
                          {LOOP MESSAGES->attachments}
                           <a href="{MESSAGES->attachments->url}">
                             <font color="blue" size="2">
                                {MESSAGES->attachments->name}({MESSAGES->attachments->size})
			     </font>
			   </a> &nbsp;&nbsp;
                          {/LOOP MESSAGES->attachments}
		       {/IF} 

                        ---
                        {IF MESSAGES->URL->PROFILE}<a href="{MESSAGES->URL->PROFILE}">{/IF}
                           {IF NOT FORUM_ID 33}
                              {IF NOT FORUM_ID 17}
                                     <font size="2" color="blue"> {MESSAGES->author}</font>
                           {/IF}{/IF}
			{IF MESSAGES->URL->PROFILE}</a>{/IF}
			    <font size="2" color="blue">({MESSAGES->datestamp})</font>
                    </td>
                </tr>
            </table>
        </div>

        <div class="message-body">
            {IF MESSAGES->is_unapproved}
                <div class="warning">
                    {LANG->UnapprovedMessage}
                </div>
            {/IF}

            <font size="2" style="letter-spacing: 1px;">{MESSAGES->body}</font>
            {IF MESSAGES->URL->CHANGES}
                (<a href="{MESSAGES->URL->CHANGES}">{LANG->ViewChanges}</a>)
            {/IF}
            <div class="message-options">
                {IF MESSAGES->edit 1}
                    {IF MODERATOR false}
                        <a class="icon icon-comment-edit" href="{MESSAGES->URL->EDIT}">
                         &nbsp;&nbsp;&nbsp;<font color="blue" size="2">{LANG->EditPost}</font>
                        </a>
                    {/IF}
                {/IF}
                <a class="icon icon-comment-add" href="{MESSAGES->URL->REPLY}">
                   &nbsp;&nbsp;&nbsp;<font color="blue" size="2">{LANG->Reply}</font></a>
                <a class="icon icon-comment-add" href="{MESSAGES->URL->QUOTE}">
                   &nbsp;&nbsp;&nbsp;<font color="blue" size="2">{LANG->QuoteMessage}</font></a>
                {IF MESSAGES->URL->REPORT}
                   <a class="icon icon-exclamation" href="{MESSAGES->URL->REPORT}">
                      &nbsp;&nbsp;&nbsp;<font color="blue" size="2">{LANG->Report}</font>
                   </a>
                {/IF}
            </div>


            {IF MESSAGES->attachments}
                <div class="attachments">
                    {LANG->Attachments}:<br/>
                    {LOOP MESSAGES->attachments}
                        <a href="{MESSAGES->attachments->url}">
                             <font color="blue" size="2">{LANG->AttachOpen}</font>
                        </a> | 
                        <a href="{MESSAGES->attachments->download_url}">
                             <font color="blue" size="2">{LANG->AttachDownload}</font>
                        </a> -
                        {MESSAGES->attachments->name}
                        ({MESSAGES->attachments->size})<br/>
                    {/LOOP MESSAGES->attachments}
                </div>
            {/IF}

            {IF MODERATOR true}
                <div class="message-moderation">
                    {IF MESSAGES->threadstart true}
                        <a class="icon icon-delete" href="{MESSAGES->URL->DELETE_THREAD}">
                           &nbsp;&nbsp;&nbsp;<font color="blue" size="2">{LANG->DelMessReplies}</font></a>
                    {ELSE}
                        <a class="icon icon-delete" href="{MESSAGES->URL->DELETE_MESSAGE}">
                           &nbsp;&nbsp;&nbsp;<font color="blue" size="2">{LANG->DeleteMessage}</font></a>
                        <a class="icon icon-delete" href="{MESSAGES->URL->DELETE_THREAD}">
                           &nbsp;&nbsp;&nbsp;<font color="blue" size="2">{LANG->DelMessReplies}</font></a>
                        <a class="icon icon-split" href="{MESSAGES->URL->SPLIT}">
                           &nbsp;&nbsp;&nbsp;<font color="blue" size="2">{LANG->SplitThread}</font></a>
                    {/IF}
                    {IF MESSAGES->is_unapproved}
                        <a class="icon icon-accept" href="{MESSAGES->URL->APPROVE}">
                           &nbsp;&nbsp;&nbsp;<font color="blue" size="2">{LANG->ApproveMessage}</font></a>
                    {ELSE}
                        <a class="icon icon-comment-delete" href="{MESSAGES->URL->HIDE}">
                           &nbsp;&nbsp;&nbsp;<font color="blue" size="2">{LANG->HideMessage}</font></a>
                    {/IF}
                    <a class="icon icon-comment-edit" href="{MESSAGES->URL->EDIT}">
                           &nbsp;&nbsp;&nbsp;<font color="blue" size="2">{LANG->EditPost}</font></a>
                </div>
            {/IF}


        </div>
    </div>

{/LOOP MESSAGES}
  <br />
  <br />
  <br />

</div>


{/IF}

<!-- END TEMPLATE read_hybrid.tpl -->
