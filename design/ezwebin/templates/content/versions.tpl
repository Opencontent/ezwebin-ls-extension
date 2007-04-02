<div class="box">
<div class="tl"><div class="tr"><div class="br"><div class="bl"><div class="box-content float-break">

<div class="content-versions">

{let page_limit=30
     list_count=fetch('content','version_count', hash(contentobject, $object))}

<form action={concat("/content/versions/",$object.id,"/")|ezurl} method="post">

<div class="attribute-header">
	<h1 class="long">{"Versions for: %1"|i18n("design/ezwebin/content/versions",,array($object.name|wash))}</h1>
</div>

{switch match=$edit_warning}
{case match=1}
<div class="warning">
<h2>{"Version not a draft"|i18n("design/ezwebin/content/versions")}</h2>
<ul>
    <li>{"Version %1 is not available for editing any more, only drafts can be edited."|i18n("design/ezwebin/content/versions",,array($edit_version))}</li>
    <li>{"To edit this version create a copy of it."|i18n("design/ezwebin/content/versions")}</li>
</ul>
</div>
{/case}
{case match=2}
<div class="warning">
<h2>{"Version not yours"|i18n("design/ezwebin/content/versions")}</h2>
<ul>
    <li>{"Version %1 was not created by you, only your own drafts can be edited."|i18n("design/ezwebin/content/versions",,array($edit_version))}</li>
    <li>{"To edit this version create a copy of it."|i18n("design/ezwebin/content/versions")}</li>
</ul>
</div>
{/case}
{case match=3}
<div class="warning">
<h2>{"Unable to create new version"|i18n("design/ezwebin/content/versions")}</h2>
<ul>
    <li>{"Version history limit has been exceeded and no archived version can be removed by the system."|i18n("design/ezwebin/content/versions")}</li>
    <li>{"You can change your version history settings in content.ini, remove draft versions or edit existing drafts."|i18n("design/ezwebin/content/versions")}</li>
</ul>
</div>
{/case}
{case}
{/case}
{/switch}

{let version_list=fetch('content','version_list',hash(contentobject, $object,limit,$page_limit,offset,$view_parameters.offset))}

<table class="list" width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<th colspan="2">
	{"Version"|i18n("design/ezwebin/content/versions")}:
	</th>
	<th>
	{"Status"|i18n("design/ezwebin/content/versions")}:
	</th>
	<th>
	{"Translations"|i18n("design/ezwebin/content/versions")}:
	</th>
	<th>
	{"Creator"|i18n("design/ezwebin/content/versions")}:
	</th>
	{section show=$can_edit}
	<th colspan="2">
	{"Modified"|i18n("design/ezwebin/content/versions")}:
	</th>
	{/section}
</tr>
{section name=Version loop=$version_list sequence=array(bglight,bgdark)}
<tr class="{$Version:sequence}">
    <td>
    {section show=and( $Version:item.can_remove, array( 0, 3, 4, 5 )|contains( $Version:item.status ) )}
	    <input type="checkbox" name="DeleteIDArray[]" value="{$Version:item.id}" />
    {/section}
    </td>
	<td>
	<a href={concat("/content/versionview/",$object.id,"/",$Version:item.version,"/",$Version:item.initial_language.locale)|ezurl}>{$Version:item.version}</a>
        {section show=eq($Version:item.version,$object.current_version)}*{/section}

	</td>
	<td>
	{$Version:item.status|choose("Draft","Published","Pending","Archived","Rejected")}
	</td>
	<td>
	{section name=Language loop=$Version:item.language_list}
        {delimiter},{/delimiter}
	<a href={concat("/content/versionview/",$object.id,"/",$Version:item.version,"/",$Version:Language:item.language_code)|ezurl}>{$Version:Language:item.locale.intl_language_name}</a>{/section}
	</td>
	<td>
	<a href={concat("/content/view/full/",$Version:item.creator.main_node_id,"/")|ezurl}>{$Version:item.creator.name|wash}</a>
	</td>
	<td>
	<span class="small">{$Version:item.modified|l10n(shortdatetime)}</span>
	</td>
	{section show=$can_edit}
	<td>
	<input type="radio" name="RevertToVersionID" value="{$Version:item.version}" {section show=eq($Version:item.version,$edit_version)}checked="checked"{/section} />
	</td>
	{/section}
</tr>
{/section}
<tr class="bgdark">
    <td colspan="1" align="left" width="1">
        <input type="image" name="RemoveButton" value="{'Remove'|i18n('design/ezwebin/content/versions')}" src={"trash.png"|ezimage} />
    </td>
    <td colspan="7">
    </td>
</tr>
</table>

{include name=navigator
         uri='design:navigator/google.tpl'
         page_uri=concat('/content/versions/', $object.id, '///' )
         item_count=$list_count
         view_parameters=$view_parameters
         item_limit=$page_limit}

{section show=$can_edit}
<div class="buttonblock" align="right">
<input class="button" type="submit" name="EditButton" value="{'Edit'|i18n('design/ezwebin/content/versions')}" />
<input class="button" type="submit" name="CopyVersionButton" value="{'Copy and edit'|i18n('design/ezwebin/content/versions')}" />
</div>
{/section}

</form>

{/let}
{/let}

</div>

</div></div></div></div></div>
</div>
