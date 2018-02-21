{if !empty($realestate.popularCities)}
    <div class="ia-categories">
        <div class="row">
            {foreach $realestate.popularCities as $entry}
                <div class="col-md-3 col-sm-3">
                    <div class="ia-cat">
                        <a href="{$entry.link}">{$entry.title|escape}, {$entry.abbreviation}</a>
                        {if $core.config.realestate_popular_show_number} &mdash; {$entry.num_listings}{/if}
                    </div>
                </div>

                {if $entry@iteration % 4 == 0 && !$entry@last}
                    </div>
                    <div class="row ia-cats">
                {/if}
            {/foreach}
        </div>
    </div>
{/if}
