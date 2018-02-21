{if !empty($realestate.types)}
    <p>
        {foreach $realestate.types as $type => $title}
            <a href="{$smarty.const.IA_URL}search/properties/type:{$type}/">{$title|escape}</a>{if !$title@last} &middot; {/if}
        {/foreach}
    </p>
{/if}
