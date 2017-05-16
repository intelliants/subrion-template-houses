{if !empty($realestate_blocks.featured)}
    <div class="ia-items featured-real-estates">
        {foreach $realestate_blocks.featured as $entry}
            <div class="ia-item -with-bg">
                {if !empty($entry.gallery)}
                    <a href="{$entry.link}" class="ia-item__image">
                        {ia_image file=$entry.gallery[0] type='thumbnail' title=$entry.address width=50}
                    </a>
                {/if}

                <div class="ia-item__content">
                    <h5 class="ia-item__title">
                        <a href="{$entry.link}">{$entry.address|escape}</a>
                    </h5>
                    {if !empty($entry.price)}<p class="ia-item__price"><span class="fa fa-tag"></span> {$entry.price_formatted}</p>{/if}
                    <p><span class="fa fa-map-pin"></span> {$entry.address2|escape}</p>
                </div>
            </div>
        {/foreach}
    </div>
{/if}