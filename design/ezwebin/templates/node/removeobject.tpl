
<div class="box">
<div class="tl"><div class="tr"><div class="br"><div class="bl"><div class="box-content float-break">

<form action={concat($module.functions.removeobject.uri)|ezurl} method="post" name="ObjectRemove">

<div class="warning">
<h2>{"Are you sure you want to remove these items?"|i18n("design/ezwebin/node/removeobject")}</h2>
<ul>
{section name=Result loop=$DeleteResult}
    {section show=$Result:item.childCount|gt(0)}
        <li>{"%nodename and its %childcount children. %additionalwarning"
             |i18n( 'design/ezwebin/node/removeobject',,
                    hash( '%nodename', $Result:item.nodeName,
                          '%childcount', $Result:item.childCount,
                          '%additionalwarning', $Result:item.additionalWarning ) )}</li>
    {section-else}
        <li>{"%nodename %additionalwarning"
             |i18n( 'design/ezwebin/node/removeobject',,
                    hash( '%nodename', $Result:item.nodeName,
                          '%additionalwarning', $Result:item.additionalWarning ) )}</li>
    {/section}
{/section}
</ul>
</div>

{section show=$moveToTrashAllowed}
  <input type="hidden" name="SupportsMoveToTrash" value="1" />
  <p><input type="checkbox" name="MoveToTrash" value="1" checked="checked" />{'Move to trash'|i18n('design/ezwebin/node/removeobject')}</p>

  <p><b>{"Note"|i18n("design/ezwebin/node/removeobject")}:</b> {"If %trashname is checked you will find the removed items in the trash afterwards."
                                                    |i18n( 'design/ezwebin/node/removeobject',,
                                                           hash( '%trashname', concat( '<i>', 'Move to trash' | i18n( 'design/ezwebin/node/removeobject' ), '</i>' ) ) )}</p>
  <br/>
{/section}


<div class="buttonblock">
{include uri="design:gui/button.tpl" name=Store id_name=ConfirmButton value="Confirm"|i18n("design/ezwebin/node/removeobject")}
{include uri="design:gui/defaultbutton.tpl" name=Discard id_name=CancelButton value="Cancel"|i18n("design/ezwebin/node/removeobject")}
</div>

</form>

</div></div></div></div></div>
</div>