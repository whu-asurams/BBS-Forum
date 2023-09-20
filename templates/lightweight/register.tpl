{IF ERROR}<div class="attention">{ERROR}</div>{/IF}
{IF OKMSG}<div class="information">{OKMSG}</div>{/IF}

<div class="generic">
  <form action="{URL->ACTION}" method="post" style="display: inline;">
    {POST_VARS}

    <table cellspacing="0" border="0">
      <tr>
        <td nowrap="nowrap">笔名*:&nbsp;</td>
        <td><input type="text" name="username" size="30" value="{REGISTER->username}" /></td>
      </tr>
      <tr>
        <td nowrap="nowrap">Email地址*:&nbsp;</td>
        <td><input type="text" name="email" size="30" value="{REGISTER->email}" /></td>
      </tr>
      <tr>
        <td nowrap="nowrap">口令*:&nbsp;</td>
        <td><input type="password" name="password" size="30" value="" /></td>
      </tr>
      <tr>
        <td nowrap="nowrap">&nbsp;</td>
        <td><input type="password" name="password2" size="30" value="" /> (再输一遍确认)</td>
      </tr>
    </table>

    {HOOK "tpl_register_form"}

    <div style="margin-top: 15px;">
      <small>*必须填的地方</small>
    </div>

    <div style="margin-top: 15px;">
      <input type="submit" value=" 点击注册 " />
    </div>

  </form>
</div>
