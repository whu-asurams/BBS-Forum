{IF ERROR}<div class="attention">{ERROR}</div>{/IF}
{IF OKMSG}
    <div class="information">

    {OKMSG}
     	
       {IF URL->CLICKHERE}
            <p><a href="{URL->CLICKHERE}">请登录或注册</a></p>
        {/IF}
        {IF URL->REDIRECT}
            <p><a href="{URL->REDIRECT}">请原路返回</a></p>
        {/IF}
    </div>
{/IF}

