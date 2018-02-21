<input type="hidden" id="js-default-search-options" data-field="date" data-order="desc">
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
            <span id="js-sorting-option-order">{lang key='desc'}</span>
            <span class="caret"></span>
        </a>
        <ul class="dropdown-menu js-estates-sorting-options">
            <li><a href="#" data-order="asc"><span class="fa fa-long-arrow-down"></span> {lang key='asc'}</a></li>
            <li><a href="#" data-order="desc"><span class="fa fa-long-arrow-up"></span> {lang key='desc'}</a></li>
        </ul>
    </div>

    <div class="ia-cards__layout">
        <a class="btn btn-default js-toggle-layout{if isset($smarty.cookies.cardsLayout) && 'list' == $smarty.cookies.cardsLayout || !isset($smarty.cookies.cardsLayout)} active{/if}" data-layout="list" href="#"><span class="fa fa-bars"></span> {lang key='list'}</a>
        <a class="btn btn-default js-toggle-layout{if isset($smarty.cookies.cardsLayout) && 'grid' == $smarty.cookies.cardsLayout} active{/if}" data-layout="grid" href="#"><span class="fa fa-th"></span> {lang key='grid'}</a>
    </div>
</div>

{ia_add_js}
$(function() {
    $('.js-estates-sorting-options a').on('click', function(e) {
        e.preventDefault();

        var data = $(this).data();

        if (undefined !== data.field)
            $('#js-sorting-option-field').text($(this).text());
        else if (undefined !== data.order)
            $('#js-sorting-option-order').text($(this).text());
    });
});
{/ia_add_js}