<div class="generic">
    <h4>{LANG->eric_RecommendMessage}</h4>
 
    <hr align="left" width="50%" color="#6600FF" />

    <form method="POST" action="{URL->ACTION}">
        {POST_VARS}
        <input type="hidden" name="thread" value="{FORM->thread_id}" />
        <input type="hidden" name="mod_step" value="{FORM->mod_step}" />
  	    <div id="wm_recommend" style="display: block; border: 1px solid green; width:40%;" align="left" >

         <input type="radio" name="group1" value="sticky" />
		       {LANG->eric_sticky}<br />
         <input type="radio" name="group1" value="topten" /> 
		       {LANG->eric_topten}<br />
         <input type="radio" name="group1" value="hot" />
		       {LANG->eric_hot}<br />
         <input type="radio" name="group1" value="recommend" />
		       {LANG->eric_recommend}<br />
  	     <input type="radio" name="group1" value="guide" />
		       {LANG->eric_guide}<br />
         <input type="radio" name="group1" value="sticky_topten" /> 
		       {LANG->eric_sticky},{LANG->eric_topten}<br />
         <input type="radio" name="group1" value="sticky_hot" />
		       {LANG->eric_sticky},{LANG->eric_hot}<br />
         <input type="radio" name="group1" value="sticky_recommend" />
		       {LANG->eric_sticky},{LANG->eric_recommend}<br />
  	     <input type="radio" name="group1" value="sticky_guide" />
		       {LANG->eric_sticky},{LANG->eric_guide}<br />
  	     <input type="radio" name="group1" value="remove_all" />
		       {LANG->eric_remove_all}<br />

	     </div>
	  <br />
      <br />
      <input type="submit" name="move" value="{LANG->Submit}" />

	  <br />
        <strong><font color="#003399"> Subject: "{FORM->subject}"</font></strong>
	  <br />
        <strong><font size="2">&nbsp;&nbsp;{LANG->eric_author}: {FORM->author}</font></strong>
	  <br /><br />
                <div style="border:1px solid green; width:80%;"> {FORM->body}</div>
	  <br />

    </form>
</div>
