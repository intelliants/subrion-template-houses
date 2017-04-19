{if isset($realestate_blocks.sponsored)}
    <div class="container">
        <h2 class="b-title b-title--accent">{lang key='special_offers'}</h2>
        <div class="owl-carousel ia-carousel js-carousel-sponsored">
            {foreach $realestate_blocks.sponsored as $item}
                <div class="ia-carousel__item">
                    <div class="ia-card -{$item.status} {if 'hidden' == $item.status}-hidden{/if}">

                        {if isset($item.gallery[0]['path']) && $item.gallery[0]['path']}
                            <a class="ia-card__image" href="{ia_url type='url' item='estates' data=$item}">
                                {ia_image file=$item.gallery[0]['path'] type='thumbnail' title=$item.address}
                                <span class="ia-card__support-info">
                                    <span class="pull-left"><span class="fa fa-image"></span> {$item.gallery_num}</span>
                                    <span class="pull-right">{$item.date_added|date_format:$core.config.date_format}</span>
                                </span>
                            </a>
                        {/if}

                        <div class="ia-card__content">
                            <div class="ia-card__actions dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="fa fa-ellipsis-v"></span></a>
                                <ul class="dropdown-menu pull-right">
                                    <li>{printFavorites item=$item itemtype='estates' guests=true}</li>
                                    <li><a href="{ia_url type='url' item='estates' data=$item}"><span class="fa fa-home"></span> {lang key='house_details'}</a></li>
                                </ul>
                            </div>
                            <a class="ia-card__title" href="{ia_url type='url' item='estates' data=$item}">{$item.address}</a>
                            {if !empty($item.price)}<p class="ia-card__sub-title">{$item.price_formatted}</p>{/if}
                            <table class="ia-card__info-table">
                                <tbody>
                                    <tr>
                                        <td><span class="fa fa-home"></span> {lang key="field_type_{$item.type}"} <span class="fa fa-bed m-l"></span> {$item.bedrooms} <span class="fa fa-tint m-l"></span> {$item.bathrooms}</td>
                                    </tr>
                                    <tr>
                                        <td><span class="fa fa-map-marker"></span> {$item.address2|escape:'html'}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            {/foreach}
        </div>
    </div>

    {ia_add_js}
$(function() {
    $('.js-carousel-sponsored').owlCarousel({
        items: 4,
        margin: 10,
        dots: false,
        nav: true,
        navText: ['<span class="fa fa-angle-left"></span>','<span class="fa fa-angle-right"></span>'],
        responsive: {
            0: {
                items: 1
            },
            320: {
                items: 2
            },
            500: {
                items: 3
            },
            768: {
                items: 4
            }
        }
    });
});
    {/ia_add_js}
{/if}