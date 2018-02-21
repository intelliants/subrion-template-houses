{if !empty($location.description)}
    <div class="page-description">{$location.description}</div>
{/if}

{if !empty($locations)}
    {ia_block title={lang key='locations'} style='fixed' id='re-categories'}
        {include 'ia-categories.tpl' categories=$locations show_amount=true num_columns=3 item='location'}
    {/ia_block}
{/if}

{if !empty($listings)}
    <div class="ia-sorting">
        {lang key='sort_by'}:

        <div class="btn-group">
            <a class="btn btn-default dropdown-toggle" data-toggle="dropdown" href="#">
                <span id="js-sorting-option-field">{lang key='date'}</span>
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu js-estates-sorting-options">
                <li><a href="#" data-field="date"><span class="fa fa-clock-o"></span> {lang key='date'}</a></li>
                <li><a href="#" data-field="price"><span class="fa fa-dollar"></span> {lang key='price'}</a></li>
                <li><a href="#" data-field="year"><span class="fa fa-calendar"></span> {lang key='field_estate_built_year'}</a></li>
            </ul>
        </div>

        <div class="btn-group">
            <a class="btn btn-default dropdown-toggle" data-toggle="dropdown" href="#">
                {if iaDb::ORDER_ASC == $sorting.direction}
                    {lang key='asc'}
                {else}
                    {lang key='desc'}
                {/if}
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <li><a href="{$smarty.const.IA_SELF}?order=asc" rel="nofollow"><span class="fa fa-long-arrow-down"></span> {lang key='asc'}</a></li>
                <li><a href="{$smarty.const.IA_SELF}?order=desc" rel="nofollow"><span class="fa fa-long-arrow-up"></span> {lang key='desc'}</a></li>
            </ul>
        </div>

        <div class="ia-cards__layout">
            <a class="btn btn-default js-toggle-layout{if isset($smarty.cookies.cardsLayout) && 'list' == $smarty.cookies.cardsLayout || !isset($smarty.cookies.cardsLayout)} active{/if}" data-layout="list" href="#"><span class="fa fa-bars"></span> {lang key='list'}</a>
            <a class="btn btn-default js-toggle-layout{if isset($smarty.cookies.cardsLayout) && 'grid' == $smarty.cookies.cardsLayout} active{/if}" data-layout="grid" href="#"><span class="fa fa-th"></span> {lang key='grid'}</a>
        </div>
    </div>

    <div class="ia-cards">
        <div class="ia-cards__items{if isset($smarty.cookies.cardsLayout)} -{$smarty.cookies.cardsLayout}{else} -list{/if}">
            <div class="row">
                {foreach $listings as $listing}
                <div class="col-md-4">
                    {include 'module:realestate/list.tpl'}
                </div>

                {if $listing@iteration % 3 == 0 && !$listing@last}
            </div>
            <div class="row">
                {/if}
                {/foreach}
            </div>
        </div>
    </div>

    {navigation aTotal=$pagination.total aTemplate=$pagination.url aItemsPerPage=$pagination.limit}

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