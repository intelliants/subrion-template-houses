{if !empty($news_latest)}
    <div class="news">
        <div class="container">
            <h2 class="b-title b-title--accent">Latest news and reviews</h2>
            <div class="row">
                <div class="col-md-5">
                    {foreach $news_latest as $entry}
                        {if $entry@first}
                            <div class="news__item news__item--lead">
                                {if !empty($entry.image)}
                                    <a href="{$smarty.const.IA_URL}news/{$entry.id}-{$entry.slug}">
                                        {ia_image file=$entry.image|default:'' type='large' title=$entry.title class='img-responsive'}
                                    </a>
                                {/if}
                                <h5 class="media-heading"><a href="{$smarty.const.IA_URL}news/{$entry.id}-{$entry.slug}">{$entry.title}</a></h5>
                                <p class="ia-item-date">{$entry.body|strip_tags|truncate:$core.config.news_max_block:'...'}</p>
                            </div>
                        {/if}
                    {/foreach}
                </div>
                <div class="col-md-7">
                    {foreach $news_latest as $entry}
                        {if !$entry@first}
                            <div class="news__item">
                                <a href="{$smarty.const.IA_URL}news/{$entry.id}-{$entry.slug}">
                                    {ia_image file=$entry.image|default:'' type='thumbnail' title=$entry.title class='img-responsive'}
                                </a>
                                <h5 class="media-heading"><a href="{$smarty.const.IA_URL}news/{$entry.id}-{$entry.slug}">{$entry.title}</a></h5>
                                <p class="ia-item-date">{$entry.body|strip_tags|truncate:$core.config.news_max_block:'...'}</p>
                            </div>
                        {/if}
                    {/foreach}
                </div>
            </div>
        </div>
    </div>
{/if}