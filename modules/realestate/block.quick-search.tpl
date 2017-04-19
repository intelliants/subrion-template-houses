{if 'index' == $core.page.name}
    <div class="sec sec-search">
        <div class="container">
            <div class="q-search">
                <div class="q-search__tabs">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab_find" data-toggle="tab"><span class="hidden-sm hidden-xs">{lang key='qsearch_find_a_perfect_home'}</span><span class="fa fa-search visible-sm visible-xs"></span></a></li>
                        <li><a href="#tab_pop_locs" data-toggle="tab">{lang key='qsearch_popular_locations'}</a></li>
                    </ul>
                    <ul class="nav nav-links">
                        <li><a href="{$core.packages.realestate.url}featured/">{lang key='qsearch_featured'}</a></li>
                        <li><a href="{$core.packages.realestate.url}sponsored/">{lang key='qsearch_sponsored'}</a></li>
                    </ul>
                </div>

                <div class="tab-content">
                    <div class="tab-pane active" id="tab_find">
                        <form action="{$smarty.const.IA_URL}search/properties/">
                            <div class="container-fluid q-search__inputs">
                                <div class="row">
                                    <div class="col-md-2">
                                        <input type="text" name="keyword" autocomplete="off" class="form-control" placeholder="{lang key='field_address'}" id="qs-keyword" value="{$realestate_blocks.search.defaults.keyword}">
                                    </div>
                                    <div class="col-md-2">
                                        <select class="form-control" name="category">
                                            <option value="">{lang key='category'}</option>
                                            {foreach $realestate_blocks.search.category as $value => $title}
                                                <option value="{$value}"{if $realestate_blocks.search.defaults.category == $value} selected{/if}>{$title}</option>
                                            {/foreach}
                                        </select>
                                    </div>
                                    <div class="col-md-2">
                                        <select class="form-control" name="type">
                                            <option value="">{lang key='field_type'}</option>
                                            {foreach $realestate_blocks.search.type as $value => $title}
                                                <option value="{$value}"{if $realestate_blocks.search.defaults.type == $value} selected{/if}>{$title}</option>
                                            {/foreach}
                                        </select>
                                    </div>
                                    <div class="col-md-2">
                                        <input class="form-control" type="text" name="price[f]" placeholder="Price min" value="{$realestate_blocks.search.defaults.price.min}">
                                    </div>
                                    <div class="col-md-2">
                                        <input class="form-control" type="text" name="price[t]" placeholder="Price max" value="{$realestate_blocks.search.defaults.price.max}">
                                    </div>
                                    <div class="col-md-2">
                                        <button class="btn btn-warning btn-block" type="submit">
                                            <span class="fa fa-search"></span> {lang key='search'}
                                        </button>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <p class="q-search__addr-eg">{lang key='for_example'} <a href="#" class="js-location-example">{$realestate_blocks.search.example}</a></p>
                                    </div>
                                    <div class="col-md-6">
                                        <p class="q-search__info">{lang key='total_houses_listed'}: <b class="text-success">{$num_estates}</b></p>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="tab-pane" id="tab_pop_locs">
                        {ia_blocks block='popular_locations'}
                    </div>
                </div>
            </div>
        </div>
    </div>
{else}
    <div class="sec sec-search">
        <div class="container">
            <div class="q-search q-search--inner">
                <form action="{$smarty.const.IA_URL}search/properties/">
                    <div class="container-fluid q-search__inputs">
                        <div class="row">
                            <div class="col-md-2">
                                <input type="text" name="keyword" autocomplete="off" class="form-control" placeholder="{lang key='field_address'}" id="qs-keyword" value="{$realestate_blocks.search.defaults.keyword}">
                            </div>
                            <div class="col-md-2">
                                <select class="form-control" name="category">
                                    <option value="">{lang key='category'}</option>
                                    {foreach $realestate_blocks.search.category as $value => $title}
                                        <option value="{$value}"{if $realestate_blocks.search.defaults.category == $value} selected{/if}>{$title}</option>
                                    {/foreach}
                                </select>
                            </div>
                            <div class="col-md-2">
                                <select class="form-control" name="type">
                                    <option value="">{lang key='field_type'}</option>
                                    {foreach $realestate_blocks.search.type as $value => $title}
                                        <option value="{$value}"{if $realestate_blocks.search.defaults.type == $value} selected{/if}>{$title}</option>
                                    {/foreach}
                                </select>
                            </div>
                            <div class="col-md-2">
                                <input class="form-control" type="text" name="price[f]" placeholder="Price min" value="{$realestate_blocks.search.defaults.price.min}">
                            </div>
                            <div class="col-md-2">
                                <input class="form-control" type="text" name="price[t]" placeholder="Price max" value="{$realestate_blocks.search.defaults.price.max}">
                            </div>
                            <div class="col-md-2">
                                <button class="btn btn-warning btn-block" type="submit">
                                    <span class="fa fa-search"></span> {lang key='search'}
                                </button>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <p class="q-search__addr-eg">{lang key='for_example'} <a href="#" class="js-location-example">{$realestate_blocks.search.example}</a></p>
                            </div>
                            <div class="col-md-6">
                                <p class="q-search__info">{lang key='total_houses_listed'}: <b class="text-success">{$num_estates}</b></p>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
{/if}

{ia_add_js}
$('.js-location-example').on('click', function(e)
{
    e.preventDefault();
    $('#qs-keyword').val($(this).text());
});

$('#qs-keyword').typeahead(
{
    source: function(query, process)
    {
        return $.ajax(
        {
            url: intelli.config.ia_url + 'search/properties.json',
            type: 'get',
            dataType: 'json',
            data: { q: query },
            success: function(response)
            {
                return process(response);
            }
        });
    }
});
{/ia_add_js}
