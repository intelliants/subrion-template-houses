{if isset($location.description)}
	<div class="page-description">{$location.description}</div>
{/if}

{if isset($locations) && $locations}
	{ia_block title={lang key='locations'} style='fixed' id='re-categories'}
		{html_categories source=$locations columns=$core.config.realestate_location_columns}
	{/ia_block}
{/if}

{if isset($listings)}
	{if $listings}
		{if !isset($no_sorting)}
			<div class="ia-sorting">
				{lang key='sort_by'}:

				<div class="btn-group">
					<a class="btn btn-default dropdown-toggle" data-toggle="dropdown" href="#">
						{if 'date_modified' == $sorting.field}
							{lang key='last_modified'}
						{elseif 'views_num' == $sorting.field}
							{lang key='views'}
						{else}
							{lang key=$sorting.field}
						{/if}
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="{$smarty.const.IA_SELF}?sort=date" rel="nofollow"><span class="fa fa-clock-o"></span> {lang key='last_modified'}</a></li>

						<li><a href="{$smarty.const.IA_SELF}?sort=views" rel="nofollow"><span class="fa fa-eye"></span> {lang key='views'}</a></li>
						<li><a href="{$smarty.const.IA_SELF}?sort=price" rel="nofollow"><span class="fa fa-dollar"></span> {lang key='price'}</a></li>
						<li><a href="{$smarty.const.IA_SELF}?sort=year" rel="nofollow"><span class="fa fa-calendar"></span> {lang key='built_year'}</a></li>
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
			</div>
		{/if}

		<div class="ia-cards__items -list">
			{foreach $listings as $listing}
				<div class="col-md-3">
					{include file='extra:realestate/list'}
				</div>
			
				{if $listing@iteration % 4 == 0}
					</div>
					<div class="row">
				{/if}
			{/foreach}
		</div>

		{navigation aTotal=$pagination.total aTemplate=$pagination.url aItemsPerPage=$pagination.limit}

		<div class="box box--border box-compare">
			<h4 class="box__caption"><span class="fa fa-sort-amount-desc"></span> {lang key='compare'} {lang key='listings'}</h4>
			<div class="box__content">
				<div id="comparison-list">{lang key='no_listings_selected_to_compare'}</div>
				<p><a class="btn btn-info" href="{$core.packages.realestate.url}comparison/" id="js-cmd-compare" style="display: none;">{lang key='compare'}</a></p>
			</div>
		</div>

		{ia_add_media files='js: _IA_URL_packages/realestate/js/front/comparison, js:_IA_URL_packages/realestate/js/front/index'}
	{else}
		<div class="alert alert-info">{lang key='no_listings_to_show'}</div>
	{/if}
{/if}