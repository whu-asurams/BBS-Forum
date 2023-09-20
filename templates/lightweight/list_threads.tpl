<!-- BEGIN TEMPLATE list_threads.tpl -->

<table border="1" style="width:950px;background-color:#A9D0F5;border-spacing:0px;padding:0px; text-align:center;">
  <tr><th id= "leftContent" border="1" style="width:100%;background-color: #A9D0F5;border-spacing:0px;padding:0px;  vertical-align:top">
  <div style="width:100%; height:80%; background-color:#A9D0F5;border-width:0px; border-spacing:0px;padding:0px; text-align: left; ">
     <div>
       <div style="float:left;">
     {IF FORUM_ID 29}
       {IF MODERATOR true}
         <a href="{URL->POST}"><font size="2">{LANG->NewTopic}</font></a>
       {/IF} 
     {ELSE}
        <!-- CONTINUE TEMPLATE list_threads.tpl -->
       <a  href="{URL->POST}"><font size="2">{LANG->NewTopic}</font></a>
        {IF URL->FEED}
        &nbsp;&nbsp; <a href="{URL->FEED}"><font size="2">{FEED}</font></a>
       {/IF}
     {/IF}
       </div>
     {INCLUDE "paging"}
    </div>

    {IF FORUM_ID 29}
    {ELSE}
        <div style="border: 1px solid blue; border-bottom-width:thin; margin-top:0pt">
        </div>
    {/IF}

    <br />
    <table cellspacing="0" class="list">
    {LOOP MESSAGES_STICKY}
    <tr>
    <td width="100%" >
        <h2> <span style="font-family:Arial, Helvetica, sans-serif;font-size: 16px; font-weight:800; color: black">{LANG->Sticky}</span>
	     <a href="{MESSAGES_STICKY->URL->READ}"  title="{title}"><b>{MESSAGES_STICKY->subject}</b></a>
	     <small>({MESSAGES_STICKY->thread_count} {LANG->Posts})</small>
             {IF MESSAGES_STICKY->meta->attachments}
		{LOOP MESSAGES_STICKY->attachments}
                    <a href="{MESSAGES_STICKY->attachments->url}">
			<font color="blue" size="2">
                           {LANG->Attachments}: {MESSAGES_STICKY->attachments->name}
                        </font>
                    </a> &nbsp;&nbsp;
		{/LOOP MESSAGES_STICKY->attachments}
            {/IF}     


            &nbsp;&nbsp;- &nbsp;&nbsp; 
            {IF MESSAGES_STICKY->URL->PROFILE}
                <a href="{MESSAGES_STICKY->URL->PROFILE}">
            {/IF}
            {IF FORUM_ID 33}
            {ELSEIF FORUM_ID 17}
            {ELSE}   
                    <font color="black" size="3"><strong>
                           <b>{MESSAGES_STICKY->author}</b>
                    </strong></font>
             {/IF}
             {IF MESSAGES_STICKY->URL->PROFILE}</a>{/IF}
             
             <span style="color:dark; font-size:12px; font-family:Arial, Helvetica, sans-serif">
                {MESSAGES_STICKY->size}  {MESSAGES_STICKY->datestamp}  
             </span>

             {IF MODERATOR true}
                 {IF MESSAGES_STICKY->moved}
                 {ELSE}
                   {IF MESSAGES_STICKY->threadstart true}
    		      &nbsp; <a title="{LANG->eric_RecommendMessage}" href="{MESSAGES_STICKY->URL->RECOMMEND_MESSAGE}"><font color="black" size="2">{LANG->eric_RecommendMessage}</font></a>
                   {/IF}
                 {/IF}
             {/IF} 
		</h2>
     </td></tr>
    {/LOOP MESSAGES_STICKY}
	 </table>

    <table cellspacing="0" class="list">
    {LOOP MESSAGES}

    {IF MESSAGES->parent_id 0}
        {IF altclass ""}
            {VAR altclass "alt"}
        {ELSE}
            {VAR altclass ""}
        {/IF}
    {/IF}

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

    <tr>
    <td width="100%" >
        <h2 style="padding-left: {MESSAGES->indent_cnt}px">
         {IF FORUM_ID 29}
              <a href="{MESSAGES->URL->READ}"  title="{title}">
                  {MESSAGES->subject}
               </a>
         {ELSE}
                <img src="{URL->TEMPLATE}/images/{icon}.png" class="icon1616" alt="{alt}" title="{title}" />
 	            <a href="{MESSAGES->URL->READ}"  title="{title}">
                    {IF MESSAGES->parent_id 0} 
                       <font size="3"><strong><b>{MESSAGES->subject}</b></strong></font>
                    {ELSE}
                          {MESSAGES->subject}
                    {/IF}
                    </a> 

            {IF MESSAGES->meta->attachments}
		{LOOP MESSAGES->attachments}
                    <a href="{MESSAGES->attachments->url}">
			<font color="blue" size="2">
                           {LANG->Attachments}: {MESSAGES->attachments->name}
                        </font>
                    </a> &nbsp;&nbsp;
		{/LOOP MESSAGES->attachments}
            {/IF}     


            &nbsp;&nbsp;- &nbsp;&nbsp; 
            {IF MESSAGES->URL->PROFILE}
                <a href="{MESSAGES->URL->PROFILE}">
            {/IF}
            {IF FORUM_ID 33}
            {ELSEIF FORUM_ID 17}
            {ELSE}   
                    <font color="black" size="3"><strong>
                           <b>{MESSAGES->author}</b>
                    </strong></font>
             {/IF}
             {IF MESSAGES->URL->PROFILE}</a>{/IF}

             <span style="color:dark; font-size:12px; font-family:Arial, Helvetica, sans-serif">
               ({MESSAGES->viewcount} views) {MESSAGES->datestamp}  
             </span>
          {/IF}

          {IF MODERATOR true}

              {IF MESSAGES->moved}
                <a title="{LANG->DeleteThread}" href="{MESSAGES->URL->DELETE_MESSAGE}"><font color="black" size="2">{LANG->DeleteThread}</font></a>
              {ELSE}
                {IF MESSAGES->threadstart true}
                    &nbsp; <a title="{LANG->MoveThread}" href="{MESSAGES->URL->MOVE}"><font color="black" size="2">{LANG->MoveThread}</font></a>
                    &nbsp; <a title="{LANG->MergeThread}" href="{MESSAGES->URL->MERGE}"><font color="black" size="2">{LANG->MergeThread}</font></a>
                    &nbsp; <a title="{LANG->DeleteThread}" href="{MESSAGES->URL->DELETE_THREAD}"><font color="black" size="2">{LANG->DeleteThread}</font></a>
         		    &nbsp; <a title="{LANG->eric_RecommendMessage}" href="{MESSAGES->URL->RECOMMEND_MESSAGE}"><font color="black" size="2">{LANG->eric_RecommendMessage}</font></a>
                {ELSE}
                    &raquo; <a title="{LANG->DeleteMessage}" href="{MESSAGES->URL->DELETE_MESSAGE}"><font color="black" size="2">{LANG->DeleteMessage}</font></a>
                {/IF}

             {/IF}
          {/IF}   
      </h2>
       </td>
      </tr>
    {/LOOP MESSAGES}
    </table>

    {IF FORUM_ID 29}
    {ELSE}
       <div style="border: 1px solid blue; border-bottom-width:thick; margin-top:0px">
       </div>
    {/IF}

     <br />
     <div class="nav">
         {IF FORUM_ID 29}
         {ELSE}
            {INCLUDE "paging"}
         {/IF}
     <br />
     </div> 
  </th>
 </tr>
</table>

