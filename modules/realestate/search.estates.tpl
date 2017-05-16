{if $listings}
    <div class="ia-cards">
        <div class="ia-cards__items{if isset($smarty.cookies.cardsLayout)} -{$smarty.cookies.cardsLayout}{else} -list{/if}">
            <div class="row">
                {foreach $listings as $listing}
                    <div class="col-md-4">
                        {include file='extra:realestate/list'}
                    </div>

                    {if $listing@iteration % 3 == 0 && !$listing@last}
                        </div>
                        <div class="row">
                    {/if}
                {/foreach}
            </div>
        </div>
    </div>

    <div class="box box--border box-compare">
        <h4 class="box__caption"><span class="fa fa-sort-amount-desc"></span> {lang key='compare'} {lang key='listings'}</h4>
        <div class="box__content">
            <div id="comparison-list">{lang key='no_listings_selected_to_compare'}</div>
            <p><a class="btn btn-info" href="{$core.packages.realestate.url}comparison/" id="js-cmd-compare" style="display: none;">{lang key='compare'}</a></p>
        </div>
    </div>

    {ia_add_media files='js: _IA_URL_modules/realestate/js/front/comparison, js:_IA_URL_modules/realestate/js/front/index'}
{else}
    <div class="alert alert-info">{lang key='no_listings_to_show'}</div>
{/if}