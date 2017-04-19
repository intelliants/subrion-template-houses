<div class="ia-item-view">
    <div class="ia-item-view__price">{$core.config.currency} {$item.price}</div>

    <h4 class="ia-item-view__sub-header">{$item.address2|escape:'html'} {$item.country|escape:'html'}</h4>
    <div class="ia-item-view__info">
        {if $item.sponsored}<span class="ia-item-view__info__item"><span class="label label-warning">{lang key='sponsored'}</span></span>{/if}
        {if $item.featured}<span class="ia-item-view__info__item"><span class="label label-info">{lang key='featured'}</span></span>{/if}
        <span class="ia-item-view__info__item"><span class="fa fa-home"></span> <a href="{$smarty.const.IA_URL}search/properties/type:{$item.type}/"><b>{lang key="field_type_{$item.type}"}</b></a> &mdash; <a href="{$smarty.const.IA_URL}search/properties/category:{$item.category}/">{lang key="field_category_{$item.category}"}</a></span>
        <span class="ia-item-view__info__item"><span class="fa fa-eye"></span> {$item.views_num}</b></span>
        <span class="ia-item-view__info__item"><span class="fa fa-calendar"></span> {lang key='added_date'} {$item.date_added|date_format:$core.config.date_format}</b></span>
    </div>

    {if !empty($item.gallery)}
        {ia_add_media files='fotorama'}

        <div class="ia-item-view__gallery">
            <div class="fotorama"
                 data-nav="thumbs"
                 data-width="100%"
                 data-ratio="800/400"
                 data-allowfullscreen="true"
                 data-fit="{$core.config.template_fotorama_view}">
                {foreach $item.gallery as $entry}
                    <a class="ia-item-view__gallery__item" href="{ia_image file=$entry.path url=true type='large'}">{ia_image file=$entry.path title=$entry.title}</a>
                {/foreach}
            </div>
        </div>
    {/if}

    <div class="ia-item-view__section">
        <h3>{lang key='details'}</h3>

        <div class="row">
            <div class="col-md-6">
                <table class="ia-item-view__table">
                    <tbody>
                        <tr>
                            <td>{lang key='field_type'}</td>
                            <td><a href="{$smarty.const.IA_URL}search/properties/type:{$item.type}/">{lang key="field_type_{$item.type}"}</a></td>
                        </tr>
                        <tr>
                            <td>{lang key='field_bedrooms'}</td>
                            <td>{if $item.bedrooms}{lang key="field_bedrooms_{$item.bedrooms}"}{/if}</td>
                        </tr>
                        <tr>
                            <td>{lang key='field_bathrooms'}</td>
                            <td>{if $item.bathrooms}{lang key="field_bathrooms_{$item.bathrooms}"}{/if}</td>
                        </tr>
                        <tr>
                            <td>{lang key='field_built_year'}</td>
                            <td>{$item.built_year}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="col-md-6">
                <table class="ia-item-view__table">
                    <tbody>
                        {if $item.floors}
                            <tr>
                                <td>{lang key='field_floors'}</td>
                                <td>{$item.floors}</td>
                            </tr>
                        {/if}
                        <tr>
                            <td>{lang key='field_size'}</td>
                            <td>{$item.size}</td>
                        </tr>
                        <tr>
                            <td>{lang key='field_category'}</td>
                            <td><a href="{$smarty.const.IA_URL}search/properties/category:{$item.category}/">{lang key="field_category_{$item.category}"}</a></td>
                        </tr>
                        <tr>
                            <td>{lang key='field_price'}</td>
                            <td class="text-success">{$item.price_formatted}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="ia-item-view__section">
        <h3>{lang key='field_special_features'}</h3>

        <div class="ia-item-view__features">
            {foreach explode(',', $item.special_features) as $opt}
                <div class="ia-item-view__features__item"><span class="fa fa-check-square"></span> {lang key="field_special_features_{$opt}"}</div>
            {/foreach}
        </div>
    </div>

    <div class="ia-item-view__section">
        <h3>{lang key='fieldgroup_realestate_location'}</h3>

        <div id="re-gmap" style="height: 335px; width: 100%; visibility: hidden; margin-bottom: 20px;"></div>
        <p><a class="btn btn-xs btn-default" href="http://maps.google.com/maps?q={$item.zipcode}+{$item.address}+{$item.location}+{$item.state}&hl={$smarty.const.IA_LANGUAGE}" target="_blank">{lang key='full_size_map'}</a>

        <input type="hidden" id="js-full-address" value="{$address|escape:'html'}">

        {ia_add_media files='js: _IA_URL_modules/realestate/js/front/view'}
    </div>

    <div class="ia-item-view__section">
        <h3>{lang key='fieldgroup_realestate_additional'}</h3>

        {$item.description|escape}
    </div>

    {include file='item-view-tabs.tpl' isView=true exceptions=array('description', 'gallery', 'type', 'category', 'price', 'bedrooms', 'bathrooms', 'size', 'floors', 'built_year', 'special_features', 'address', 'zipcode')}

    {if $neighborhood.total > 1}
        <div class="ia-item clearfix text-center">
            {if $neighborhood.url.previous}
                <a href="{$neighborhood.url.previous}" title="{lang key='previous_listing_in_this_location'}" class="pull-left">
                    <span class="fa fa-chevron-circle-left fa-large"></span>
                </a>
            {/if}

            {if $neighborhood.url.next}
                <a href="{$neighborhood.url.next}" title="{lang key='next_listing_in_this_location'}" class="pull-right">
                    <span class="fa fa-chevron-circle-right fa-large"></span>
                </a>
            {/if}
            <em>{lang key='neighborhood_paginator' current=$neighborhood.current total=$neighborhood.total}</em>
        </div>
    {/if}

    {ia_hooker name='smartyViewListingBeforeFooter'}
</div>

{ia_add_js}
$(function() {
    $('.js-delete-listing').on('click', function(e) {
        e.preventDefault();

        intelli.confirm(_t('do_you_really_want_to_delete_listing'), { url: $(this).attr('href') });
    });
});
{/ia_add_js}
