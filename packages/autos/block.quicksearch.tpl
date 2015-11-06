<div class="sec sec-search">
	<div class="container">
		<div class="q-search">
			<div class="q-search__tabs">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#tab_find" data-toggle="tab"><span class="hidden-sm hidden-xs">{lang key='qsearch_find_a_perfect_car'}</span><span class="fa fa-search visible-sm visible-xs"></span></a></li>
					<li><a href="#tab_makes" data-toggle="tab">{lang key='qsearch_popular_makes'}</a></li>
					<li><a href="#tab_bodystyle" data-toggle="tab">{lang key='qsearch_bodystyle'}</a></li>
					{if $core.config.show_by_year}
						<li class="hidden-sm hidden-xs"><a href="#tab_year" data-toggle="tab">{lang key='qsearch_year'}</a></li>
					{/if}
				</ul>
				<ul class="nav nav-links">
					<li><a href="{$core.packages.autos.url}popular/">{lang key='qsearch_popular'}</a></li>
					<li><a href="{$core.packages.autos.url}latest/">{lang key='qsearch_latest'}</a></li>
					<li><a href="{$core.packages.autos.url}featured/">{lang key='qsearch_featured'}</a></li>
				</ul>
			</div>
			
			<div class="tab-content">
				<div class="tab-pane active" id="tab_find">
					{if isset($car_blocks_data.search)}
						<form action="{$smarty.const.IA_URL}search/cars/">
							<div class="container-fluid q-search__inputs">
								<div class="row">
									<div class="col-md-2">
										<div class="btn-group btn-group-justified" data-toggle="buttons">
											<label class="btn btn-primary">
												<input type="radio" name="condition" value="new" autocomplete="off"> <span class="fa fa-check"></span> {lang key='field_condition_new'}
											</label>
											<label class="btn btn-primary active">
												<input type="radio" name="condition" value="used" autocomplete="off" checked> <span class="fa fa-check"></span> {lang key='field_condition_used'}
											</label>
										</div>
									</div>
									<div class="col-md-2">
										<select class="form-control js-car-make" name="mk">
											<option value="">{lang key='make'}</option>
											{foreach $car_blocks_data.search.categories as $item}
												<option value="{$item.id}"{if isset($smarty.get.mk) && $smarty.get.mk == $item.id} selected{/if}>{$item.name|escape:'html'}</option>
											{/foreach}
										</select>
									</div>
									<div class="col-md-2">
										<div class="q-search__loader"><div class="loader"></div></div>
										<select name="md" class="form-control js-car-model" data-spinner=".q-search__loader">
											<option value="">{lang key='model'}</option>
										</select>
									</div>
									<div class="col-md-2">
										<input class="form-control" type="text" name="price[f]" placeholder="Price min" value="{if isset($smarty.get.price[f])}{$smarty.get.price[f]}{else}{/if}">
									</div>
									<div class="col-md-2">
										<input class="form-control" type="text" name="price[t]" placeholder="Price max" value="{if isset($smarty.get.price[t])}{$smarty.get.price[t]}{else}{/if}">
									</div>
									<div class="col-md-2">
										<button class="btn btn-success btn-block" type="submit">
											<span class="fa fa-search"></span> {lang key='search'}
										</button>
									</div>
								</div>
							</div>
							<div class="q-search__more-actions">
								<label class="checkbox-inline c-checkbox">
									<input type="checkbox" name="auto_pictures" value="1" checked>
									<span class="fa fa-square"></span>
									{lang key='with_pictures_only'}
								</label>
								<label class="checkbox-inline c-checkbox">
									<input type="checkbox" name="sold" value="1"> 
									<span class="fa fa-square"></span>
									{lang key='include_sold_listings'}
								</label>
							</div>
							<p class="q-search__info">{lang key='total_cars_listed'}: <b class="text-success">{$num_autos}</b>. <a href="{$core.packages.autos.url}add/">{lang key='get_listed'}</a></p>
						</form>
					{/if}
				</div>
				<div class="tab-pane" id="tab_makes">
					{ia_blocks block='popular_makes'}
				</div>
				<div class="tab-pane" id="tab_bodystyle">
					{ia_blocks block='bodystyle'}
				</div>
				{if $core.config.show_by_year}
					<div class="tab-pane" id="tab_year">
						{ia_blocks block='by_year'}
					</div>
				{/if}
			</div>
		</div>
	</div>
</div>
{ia_print_js files='_IA_URL_packages/autos/js/front/search'}
