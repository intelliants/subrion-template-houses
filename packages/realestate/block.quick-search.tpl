<div class="sec sec-search">
	<div class="container">
		<div class="q-search">
			<div class="q-search__tabs">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#tab_find" data-toggle="tab"><span class="hidden-sm hidden-xs">{lang key='qsearch_find_a_perfect_home'}</span><span class="fa fa-search visible-sm visible-xs"></span></a></li>
					<li><a href="#tab_pop_locs" data-toggle="tab">{lang key='qsearch_popular_locations'}</a></li>
				</ul>
				<ul class="nav nav-links">
					<li><a href="{$core.packages.realestate.url}latest/">{lang key='qsearch_latest'}</a></li>
					<li><a href="{$core.packages.realestate.url}featured/">{lang key='qsearch_featured'}</a></li>
				</ul>
			</div>
			
			<div class="tab-content">
				<div class="tab-pane active" id="tab_find">
					<form action="{$smarty.const.IA_URL}search/properties/">
					</form>
				</div>
				<div class="tab-pane" id="tab_pop_locs">
					{ia_blocks block='popular_locations'}
				</div>
			</div>
		</div>
	</div>
</div>

{*
<form action="{$smarty.const.IA_URL}search/properties/" class="ia-form ia-form--search qs">
	<div class="form-group">
		<label for="as_body">{lang key='field_address'}:</label>
		<input type="text" name="keyword" autocomplete="off" class="form-control" id="qs-keyword" value="{$realestate_blocks.search.defaults.keyword}">
		{if isset($realestate_blocks.search.example)}
			<p class="help-block">
				<span>{lang key='for_example'}</span> <a href="#" class="js-location-example">{$realestate_blocks.search.example}</a>
			</p>
		{/if}
	</div>

	<div class="form-group">
		<label for="re-s-type">{lang key='field_type'}:</label>
		<select class="form-control" name="type" id="re-s-type">
			<option value="">{lang key='any'}</option>
			{foreach $realestate_blocks.search.type as $value => $title}
				<option value="{$value}"{if $realestate_blocks.search.defaults.type == $value} selected{/if}>{$title}</option>
			{/foreach}
		</select>
	</div>

	<div class="form-group">
		<label for="re-s-price-from">{lang key='field_price'}:</label>
		<div class="row">
			<div class="col-md-6">
				<label for="" class="ia-form__label-mini">{lang key='from'}</label>
				<input type="text" id="re-s-price-from" name="price[f]" class="form-control" maxlength="10" value="{$realestate_blocks.search.defaults.price.min}">
			</div>
			<div class="col-md-6">
				<label for="" class="ia-form__label-mini">{lang key='to'}</label>
				<input type="text" id="re-s-price-to" name="price[t]" class="form-control" maxlength="10" value="{$realestate_blocks.search.defaults.price.max}">
			</div>
		</div>
	</div>

	<div class="form-group">
		<label for="re-s-category">{lang key='category'}:</label>
		<select class="form-control" name="category" id="re-s-category">
			<option value="">{lang key='any'}</option>
			{foreach $realestate_blocks.search.category as $value => $title}
				<option value="{$value}"{if $realestate_blocks.search.defaults.category == $value} selected{/if}>{$title}</option>
			{/foreach}
		</select>
	</div>

	<div class="form-group">
		<label for="re-s-bed">{lang key='field_bedrooms'}:</label>
		<select class="form-control" name="bedrooms" id="re-s-bed">
			<option value="">{lang key='any'}</option>
			{foreach $realestate_blocks.search.bedrooms as $value => $title}
				<option value="{$value}"{if $realestate_blocks.search.defaults.bed == $value} selected{/if}>{$title}</option>
			{/foreach}
		</select>
	</div>

	<div class="form-group">
		<label for="re-s-bath">{lang key='field_bathrooms'}:</label>
		<select class="form-control" name="bathrooms" id="re-s-bath">
			<option value="">{lang key='any'}</option>
			{foreach $realestate_blocks.search.bathrooms as $value => $title}
				<option value="{$value}"{if $realestate_blocks.search.defaults.bath == $value} selected{/if}>{$title}</option>
			{/foreach}
		</select>
	</div>

	<div class="form-group">
		<div class="radios-list">
			<div class="checkbox">
				<label>
					<input type="checkbox" name="children_loc" id="re-s-child-locations"{if $realestate_blocks.search.defaults.children_loc} checked="checked"{/if}>
					{lang key='include_child_locations'}
				</label>
			</div>
			<div class="checkbox">
				<label>
					<input type="checkbox" name="gallery" id="re-s-images" value="1"{if $realestate_blocks.search.defaults.i} checked{/if}>
					{lang key='with_images_only'}
				</label>
			</div>
		</div>
	</div>

	<button type="submit" class="btn btn-primary btn-block">{lang key='search'}</button>
</form>
*}
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
