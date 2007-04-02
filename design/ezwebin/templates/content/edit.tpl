<form enctype="multipart/form-data" id="editform" method="post" action={concat("/content/edit/",$object.id,"/",$edit_version,"/",$edit_language|not|choose(concat($edit_language,"/"),''))|ezurl}>

<div class="box-et box-et-content-edit">
<div class="tl"><div class="tr"><div class="br"><div class="bl"><div class="box-content">

<div class="block">
<div class="left">
    <a href={"/ezinfo/about"|ezurl}><img src={"ez_toolbar.png"|ezimage} alt="eZ publish Now" width="49" height="16" /></a>
    <input class="button" type="submit" name="VersionsButton" value="{'Manage versions'|i18n('design/ezwebin/content/edit')}" />

    <input class="button" type="submit" name="StoreExitButton" value="{'Store and exit'|i18n( 'design/ezwebin/content/edit' )}" title="{'Store the draft that is being edited and exit from edit mode.'|i18n( 'design/ezwebin/content/edit' )}" />
    <input class="button" type="submit" name="PreviewButton" value="{'Preview'|i18n('design/ezwebin/content/edit')}" />
<select name="FromLanguage">
<option value=""{if $from_language|not} selected="selected"{/if}> {'No translation'|i18n( 'design/ezwebin/content/edit' )}</option>

{if $object.status}
{foreach $object.languages as $lang}
<option value="{$lang.locale}"{if $lang.locale|eq($from_language)} selected="selected"{/if}>
{$lang.name|wash}
</option>
{/foreach}
{/if}
</select>

<input {if $object.status|eq(0)}class="button-disabled" disabled="disabled"{else} class="button"{/if} type="submit" name="FromLanguageButton" value="{'Translate'|i18n( 'design/ezwebin/content/edit' )}" title="{'Edit the current object showing the selected language as a reference.'|i18n( 'design/ezwebin/content/edit' )}" />

</div>
<div class="right">
	<a href="http://ez.no/doc" title="Documentation"><img src={"ezt_question_mark.gif"|ezimage} alt="Help" class="help" /></a>
</div>

</div>

</div></div></div></div></div>
</div>

<div class="box">
<div class="tl"><div class="tr"><div class="br"><div class="bl"><div class="box-content float-break">

<div class="content-edit">

    <div class="attribute-header">
	    <h1 class="long">{"Edit %1 - %2"|i18n("design/ezwebin/content/edit",,array($class.name|wash,$object.name|wash))}</h1>
    </div>

    {include uri="design:content/edit_validation.tpl"}

    {include uri="design:content/edit_attribute.tpl"}

    <div class="buttonblock">
    <input class="defaultbutton" type="submit" name="PublishButton" value="{'Send for publishing'|i18n('design/ezwebin/content/edit')}" />
    <input class="button" type="submit" name="StoreButton" value="{'Store draft'|i18n('design/ezwebin/content/edit')}" />
    <input class="button" type="submit" name="DiscardButton" value="{'Discard'|i18n('design/ezwebin/content/edit')}" />
    <input type="hidden" name="DiscardConfirm" value="0" />
	<input type="hidden" name="RedirectIfDiscarded" value="{ezhttp( 'LastAccessesURI', 'session' )}" />
	<input type="hidden" name="RedirectURIAfterPublish" value="{ezhttp( 'LastAccessesURI', 'session' )}" />
    </div>
</div>

</div></div></div></div></div>
</div>

</form>