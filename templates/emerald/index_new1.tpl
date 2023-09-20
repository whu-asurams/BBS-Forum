<table cellspacing="0" class="list">
    {VAR first_pass 1}
    {LOOP FORUMS}
    {IF FORUMS->level 0}
            <tr>
                {IF FORUMS->forum_id FORUMS->vroot}
                    <th align="left">
                        <font size="3" color="black"><b>{LANG->Forums}</b></font>
                    </th>
                {ELSE}
                    <th align="left" >
               		<!--
	            <a href="{FORUMS->URL->LIST}"><font size="3" color="black"><b>{FORUMS->name}</b></font></a>  -->
			<font size="3" color="black"><b>{FORUMS->name}</b></font>
                    </th>
                {/IF}
			
                <th><font size="3">{LANG->Threads}</font></th>
                <th><font size="3">{LANG->Posts}</font></th>
                <th align="left"><font size="2">{LANG->LastPost}</font></th>
            </tr>
    {ELSE}
        <tr>
            {IF FORUMS->folder_flag}
              <td width="55%" >
                <h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <a href="{FORUMS->URL->INDEX}"><font size="2">{FORUMS->name}</font></a>
                <!--
                   <a href="{FORUMS->URL->INDEX}"><font size="2">{FORUMS->name}({FORUMS->description})</font></a>
                -->
				
                </h3>
              </td>
            {ELSE}
                <td width="55%">
                    <h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="{FORUMS->URL->LIST}"><font size="2">{FORUMS->name}</font></a>
                    {IF FORUMS->new_message_check}
                        &nbsp;&nbsp;
                        <span class="new-indicator"><font size="2">({LANG->NewMessages})</font></span>
                    {/IF}
                    {IF FORUMS->URL->FEED} 
                        <a class="icon" href="{FORUMS->URL->FEED}"><font size="2">({FEED})</font></a>
                    {/IF} 
                    </h3>
                     
                </td>
			{/IF}
                <td align="center" width="12%" nowrap="nowrap">
                    <font size="2">{FORUMS->thread_count}</font>
                    {IF FORUMS->new_threads}
                        <span class="new-flag"><font size="2">({FORUMS->new_threads} {LANG->newflag})</font></span>
                    {/IF}
                </td>
                <td align="center" width="12%" nowrap="nowrap">
                    <font size="2">{FORUMS->message_count}</font>
                    {IF FORUMS->new_messages}
                        <span class="new-flag"><font size="2">({FORUMS->new_messages} {LANG->newflag})</font></span>
                    {/IF}
                </td>
                <td width="21%" nowrap="nowrap"><font size="2">{FORUMS->last_post}</font></td>
           
      </tr>
    {/IF}
    {/LOOP FORUMS}
</table>

<table cellspacing="0" class="list" style="border-style:double">
</table>
