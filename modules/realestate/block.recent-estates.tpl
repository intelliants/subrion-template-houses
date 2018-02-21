{if isset($realestate.recent)}
    <h2 class="b-title b-title--accent">{$block.title|escape}</h2>
    <div class="ia-cards ia-cards--small">
        <div class="ia-cards__items">
            <div class="row">
                {foreach $realestate.recent as $entry}
                    <div class="col-md-2 col-sm-2">
                        <div class="ia-card ia-card--small -{$entry.status} {if 'hidden' == $entry.status}-hidden{/if} {if $entry.featured}-featured{/if} {if $entry.sponsored}-sponsored{/if}">
                            {if !empty($entry.gallery)}
                                <a class="ia-card__image" href="{$entry.link}">
                                    {ia_image file=$entry.gallery[0] type='thumbnail' title=$entry.address}
                                    <span class="ia-card__support-info">
                                        <span class="pull-left"><span class="fa fa-image"></span> {$entry.gallery_num}</span>
                                        <span class="pull-right">{$entry.date_added|date_format:$core.config.date_format}</span>
                                    </span>
                                </a>
                            {else}
                                <a class="ia-card__image" href="{$entry.link}">
                                    <img src="{$smarty.const.IA_TPL_URL}img/no-preview.png" alt="{$entry.address|escape}">
                                </a>
                            {/if}

                            <div class="ia-card__content">
                                <div class="ia-card__actions dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="fa fa-ellipsis-v"></span></a>
                                    <ul class="dropdown-menu pull-right">
                                        <li>{printFavorites item=$entry itemtype='estate' guests=true}</li>
                                        <li><a href="{$entry.link}"><span class="fa fa-home"></span> {lang key='house_details'}</a></li>
                                    </ul>
                                </div>
                                <a class="ia-card__title" href="{$entry.link}">{$entry.address|escape}</a>
                                {if !empty($entry.price)}
                                    <p class="ia-card__sub-title">{$entry.price_formatted}</p>
                                {/if}
                            </div>
                        </div>
                    </div>

                    {if $entry@iteration % 6 == 0 && !$entry@last}
                        </div>
                        <div class="row">
                    {/if}
                {/foreach}
            </div>
        </div>
    </div>
{/if}