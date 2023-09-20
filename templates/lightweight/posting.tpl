<!-- BEGIN TEMPLATE posting.tpl -->
{IF REPLY_ON_READ}
<a name="REPLY"></a>
{/IF}

{IF ERROR}<div class="attention">{ERROR}</div>{/IF}
{IF OKMSG}<div class="information">{OKMSG}</div>{/IF}


<div id="post" align="left">

    <form id="post-form" name="post_form" action="{URL->ACTION}" method="post" enctype="multipart/form-data">

        {POST_VARS}

        <div class="generic">
                {IF SHOW_SPECIALOPTIONS}
                <div align="left">
                  <div id="post-moderation" style="float:left;">
                    <small>
                    {LANG->Special}:<br />

                    {IF OPTION_ALLOWED->sticky}
                    <input type="checkbox" name="sticky"   id="phorum_sticky" value="1" {IF POSTING->special "sticky"}checked="checked"{/IF} />
                    <label for="phorum_sticky">{LANG->MakeSticky}</label>
                    <br />
                    {/IF}

                    <input type="checkbox" id="allow-reply" name="allow_reply" value="1" {IF POSTING->allow_reply} checked="checked"{/IF} /> <label for="allow-reply">{LANG->AllowReplies}</label>
                    </small>
                  </div>

		</div>
                {/IF}
                <small>

                <center><font size="4"> {LANG->eric_reply_post}</font><br /><br /><br /><br /><br /></center>

                {IF MODE "moderation"}
                  {LANG->YourName}:
                {ELSE}
                  {LANG->Author}:
                {/IF}
                {IF OPTION_ALLOWED->edit_author}
                    <input type="text" name="author" size="30" maxlength="30" value="{POSTING->author}" />
                {ELSE}
                    <big><strong>{POSTING->author}</strong></big><br />
                {/IF}
                <br/>


                {IF MODE "post" OR MODE "reply"}

                    {IF NOT LOGGEDIN}

                        {LANG->YourEmail}:<br />
                        <input type="text" name="email" size="30" value="{POSTING->email}" /><br />
                        <br />

                    {/IF}

                {ELSEIF MODE "moderation"}

                    {IF POSTING->user_id 0}

                        {LANG->Email}:<br />
                        <input type="text" name="email" size="30" value="{POSTING->email}" /><br />
                        <br />

                    {/IF}

                {/IF}

                {LANG->Subject}({LANG->eric_post_subject_length}):<br />
                <input type="text" name="subject" id="subject" size="103" maxlength = "103" value="{POSTING->subject}" style="border:1px solid green;" /><br />
                <br />


                </small>
                {IF POSTING->user_id}

                    <small>{LANG->Options}:</small><br />

                    <input type="checkbox" id="show-signature" name="show_signature" value="1" {IF POSTING->show_signature} checked="checked"{/IF} /> 
                       <label for="show-signature">
                              {LANG->AddSig}
                       </label><br />
                    <br/>

                {/IF}

            {IF ATTACHMENTS}
                <small>{LANG->Attachments}:</small><br />
                {IF POSTING->attachments}
                    <table id="attachment-list" cellspacing="0">
                      {VAR LIST POSTING->attachments}
                      {LOOP LIST}
                        {IF LIST->keep}
                          <tr>
                            <td>{LIST->name} ({LIST->size})</td>
                            <td align="right">
                              {HOOK "tpl_editor_attachment_buttons" LIST}
                              <input type="submit" name="detach:{LIST->file_id}" value="{LANG->Detach}" />
                            </td>
                          </tr>
                        {/IF}
                      {/LOOP LIST}
                    </table>
                    {VAR AttachPhrase LANG->AttachAnotherFile}
                {ELSE}
                    {VAR AttachPhrase LANG->AttachAFile}
                {/IF}

                {IF ATTACHMENTS_FULL}
                    <strong>{LANG->AttachFull}</strong><br />
                {ELSE}
                    <script type="text/javascript">
                    //<![CDATA[
                      function phorumShowAttachForm() {
                        document.getElementById('attach-link').style.display='none';
                        document.getElementById('attach-form').style.display='block';
                      }
                      document.write("<div id=\"attach-link\" class=\"attach-link\" style=\"display: block;\"><a href=\"javascript:phorumShowAttachForm();\"><b>{AttachPhrase} ...<\/b><\/a><\/div>\n");
                      document.write("<div id=\"attach-form\" style=\"display: none;\">");
                    // ]]>
                    </script>
                    <div class="attach-link">{AttachPhrase}</div>
                    <ul>
                      {IF EXPLAIN_ATTACH_FILE_TYPES}<li>{EXPLAIN_ATTACH_FILE_TYPES}</li>{/IF}
                      {IF EXPLAIN_ATTACH_FILE_SIZE}<li>{EXPLAIN_ATTACH_FILE_SIZE}</li>{/IF}
                      {IF EXPLAIN_ATTACH_TOTALFILE_SIZE}<li>{EXPLAIN_ATTACH_TOTALFILE_SIZE}</li>{/IF}
                      {IF EXPLAIN_ATTACH_MAX_ATTACHMENTS}<li>{EXPLAIN_ATTACH_MAX_ATTACHMENTS}</li>{/IF}
                    </ul>
                    <input type="file" size="50" name="attachment" />
                    <input type="submit" name="attach" value="{LANG->Attach}" />
                    <script type="text/javascript">
                    //<![CDATA[
                    document.write('<\/div>');
                    // ]]>
                    </script>
                {/IF}

                <br />
            {/IF}

            {HOOK "tpl_editor_before_textarea"}
            <small>{LANG->Message}:</small>
            <div id="post-body">
              <!-- fieldset is a work around for an MSIE rendering bug -->
              <fieldset>
                <textarea name="body" id="body" class="body" rows="15" cols="50" value=" ">{POSTING->body}&nbsp;&nbsp;</textarea>
              </fieldset>
            </div>

        </div>

        <div id="post-buttons">

            {HOOK "tpl_editor_buttons"}

            <input type="submit" name="finish" value=" {POSTING->submitbutton_text} " />
            {IF SHOW_CANCEL_BUTTON}
            <input type="submit" name="cancel" onclick="return confirm('{LANG->CancelConfirm}')" value="{LANG->Cancel}" />
            {/IF}

        </div>

    </form>

</div>

{IF MODERATED}
    <div class="notice">{LANG->ModeratedForum}</div>
{/IF}
<!-- END TEMPLATE posting.tpl -->
