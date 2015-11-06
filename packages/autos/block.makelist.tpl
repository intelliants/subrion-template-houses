{if isset($car_blocks_data.make)}
	<div class="container-fluid pr-list">
		<div class="row">
			{foreach $car_blocks_data.make as $make}
				{if $make.priority}
					<div class="col-md-2 col-sm-3">
						<a href="{ia_url type='url' item='autos_models' data=$make}" class="pr-list__item">
							<img src="{$core.page.nonProtocolUrl}uploads/{$make.icon.path}" alt="{$make.title|escape:'html'}">
							<span class="pr-list__item__title">{$make.title|escape:'html'}</span>
							<span class="pr-list__item__num">{$make.num|default:0}</span>
						</a>
					</div>
				{/if}
			{/foreach}
		</div>
	</div>

	<hr>

	<div class="ia-categories pr-list-simple">
		{include file='ia-categories.tpl' categories=$car_blocks_data.make item='autos_models' show_amount=true num_columns=4 icons=false}

		<div class="pr-list-simple__more"><a class="js-more-makes" href="#" data-less-makes-text="<span class='fa fa-angle-up'></span> {lang key='less_makes'}" data-more-makes-text="<span class='fa fa-angle-down'></span> {lang key='more_makes'}"><span class="fa fa-angle-down"></span> {lang key='more_makes'}</a></div>
	</div>
{/if}