{if isset($realestate_blocks.types)}
	<p>
		{foreach $realestate_blocks.types as $type => $title}
			<a href="{$smarty.const.IA_URL}search/properties/type:{$type}/">{$title|escape:'html'}</a>{if !$title@last} &middot; {/if}
		{/foreach}
	</p>
{/if}