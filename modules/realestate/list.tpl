<div class="ia-card ia-item--{$listing.status} {if $listing.featured}-featured{/if} {if $listing.sponsored}-sponsored{/if}">
    {if $listing.featured}
        <div class="ia-card__badge ia-card__badge--featured" title="{lang key='featured'}"><span class="fa fa-star"></span></div>
    {/if}
    {if $listing.sponsored}
        <div class="ia-card__badge ia-card__badge--sponsored" title="{lang key='sponsored'}"><span class="fa fa-usd"></span></div>
    {/if}

    {if iaEstate::STATUS_SOLD == $listing.status}
        <span class="label label-status label-danger">{lang key='sold'}</span>
    {elseif $member && $member.id == $listing.member_id
    && (iaCore::STATUS_APPROVAL == $listing.status || iaEstate::STATUS_HIDDEN == $listing.status)}
        <span class="label label-status label-{$listing.status}" title="{lang key=$listing.status default=$listing.status}"><span class="fa fa-warning"></span> {lang key=$listing.status default=$listing.status}</span>
    {else}
        <span class="label label-status label-{$listing.status}" title="{lang key=$listing.status default=$listing.status}"><span class="fa fa-warning"></span> {lang key=$listing.status default=$listing.status}</span>
    {/if}

    {if isset($listing.gallery[0]['path']) && $listing.gallery[0]['path']}
        <a class="ia-card__image" href="{ia_url type='url' item='estates' data=$listing}">
            {ia_image file=$listing.gallery[0]['path'] type='thumbnail' title=$listing.address}
            <span class="ia-card__support-info">
                <span class="pull-left"><span class="fa fa-image"></span> {$listing.gallery_num}</span>
                <span class="hidden-xs pull-right">{$listing.date_added|date_format:$core.config.date_format}</span>
            </span>
        </a>

        {if $listing.sponsored}
            <div class="ia-card__image__more hidden-xs">
                {foreach $listing.gallery as $pic}
                    {if !$pic@first}
                        <a href="{ia_url type='url' item='estates' data=$listing}">
                            {ia_image file=$pic['path'] type='thumbnail' title=$listing.address}
                        </a>
                    {/if}
                    {if $pic@iteration == 4}
                        {break}
                    {/if}
                {/foreach}
            </div>
        {/if}
    {/if}

    <div class="ia-card__content">
        <div class="ia-card__actions dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="fa fa-ellipsis-v"></span></a>
            <ul class="dropdown-menu pull-right">
                <li>{printFavorites item=$listing itemtype='estates' guests=true}</li>
                <li><a href="{ia_url type='url' item='estates' data=$listing}"><span class="fa fa-home"></span> {lang key='house_details'}</a></li>
                {if !in_array($core.page.name, array('favorites', 'view_member'))}
                    <li><a class="btn-compare" data-id="{$listing.id}" href="#" data-disabled="{(isset($_SESSION[iaEstate::SESSION_COMPARISON_KEY][$listing.id])) ? 'disabled' : ''}"><span class="fa fa-sort-amount-desc"></span> {lang key='mark_to_compare'}</a></li>
                {/if}
            </ul>
        </div>

        <a class="ia-card__title" href="{ia_url type='url' item='estates' data=$listing}">{$listing.address} <small class="text-fade-50">{lang key='id'}: {$listing.id}</small></a>
        {if !empty($listing.price)}<p class="ia-card__sub-title">{$listing.price_formatted}</p>{/if}
        {ia_hooker name='smartyItemListAfterTitle'}

        <div class="ia-item__additional">
            <p><span class="fa fa-home"></span> <a href="{$smarty.const.IA_URL}search/properties/type:{$listing.type}/">{lang key="field_type_{$listing.type}"}</a></p>
            {if $listing.bedrooms}<p title="{lang key='field_bedrooms'}"><span class="fa fa-bed"></span> {lang key="field_bedrooms_{$listing.bedrooms}"}</p>{/if}
            {if $listing.bathrooms}<p title="{lang key='field_bathrooms'}"><span class="fa fa-tint"></span> {lang key="field_bathrooms_{$listing.bathrooms}"}</p>{/if}
            <p><span class="fa fa-map-pin"></span> {$listing.location}{if !empty($listing.state)}, {$listing.state}{/if} {$listing.zipcode}</p>
            <p><span class="fa fa-eye"></span> {$listing.views_num}</p>
        </div>

        {ia_hooker name='smartyItemListBeforeInfoPost'}

        <p>{$listing.description|strip_tags|truncate:350:'...':true}</p>
    </div>
</div>