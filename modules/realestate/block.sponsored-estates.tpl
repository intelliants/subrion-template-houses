{if !empty($realestate_blocks.sponsored)}
    <div class="container">
        <h2 class="b-title b-title--accent">{lang key='special_offers'}</h2>
        <div class="owl-carousel ia-carousel js-carousel-sponsored">
            {foreach $realestate_blocks.sponsored as $entry}
                <div class="ia-carousel__item">
                    <div class="ia-card -{$entry.status} {if 'hidden' == $entry.status}-hidden{/if}">

                        {if !empty($entry.gallery)}
                            <a class="ia-card__image" href="{$entry.link}">
                                {ia_image file=$entry.gallery[0] type='thumbnail' title=$entry.address}
                                <span class="ia-card__support-info">
                                    <span class="pull-left"><span class="fa fa-image"></span> {$entry.gallery_num}</span>
                                    <span class="pull-right">{$entry.date_added|date_format:$core.config.date_format}</span>
                                </span>
                            </a>
                        {/if}

                        <div class="ia-card__content">
                            <div class="ia-card__actions dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="fa fa-ellipsis-v"></span></a>
                                <ul class="dropdown-menu pull-right">
                                    <li>{printFavorites item=$entry itemtype='estates' guests=true}</li>
                                    <li><a href="{$entry.link}"><span class="fa fa-home"></span> {lang key='house_details'}</a></li>
                                </ul>
                            </div>
                            <a class="ia-card__title" href="{$entry.link}">{$entry.address}</a>
                            {if !empty($entry.price)}<p class="ia-card__sub-title">{$entry.price_formatted}</p>{/if}
                            <table class="ia-card__info-table">
                                <tbody>
                                    <tr>
                                        <td>
                                            <span class="fa fa-home"></span>
                                            {lang key="field_estates_type+{$entry.type}"}
                                            {if !empty($entry.bedrooms)}
                                                <span class="fa fa-bed m-l"></span> {$entry.bedrooms}
                                            {/if}
                                            {if !empty($entry.bathrooms)}
                                                <span class="fa fa-tint m-l"></span> {$entry.bathrooms}
                                            {/if}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><span class="fa fa-map-marker"></span> {$entry.address2|escape}</td>
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