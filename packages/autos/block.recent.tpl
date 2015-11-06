{if isset($car_blocks_data.recent)}
	<h2 class="title title--accent">{$block.title|escape:'html'}</h2>
	<div class="ia-cards ia-cards--small">
		<div class="ia-cards__items">
			<div class="row">
				{foreach $car_blocks_data.recent as $item}
					<div class="col-md-2 col-sm-2">
						<div class="ia-card ia-card--small -{$item.status} {if 'hidden' == $item.status}-hidden{/if} {if $item.featured}-featured{/if} {if $item.sponsored}-sponsored{/if}">
			
							{if $item.auto_pictures}
								<a class="ia-card__image" href="{$item.link}">
									{printImage imgfile=$item.auto_pictures[0]['path'] title=$item.model}
									<span class="ia-card__support-info">
										<span class="pull-left"><span class="fa fa-image"></span> {$item.auto_pictures_num}</span>
										<span class="pull-right">{$item.date_added|date_format:$core.config.date_format}</span>
									</span>
								</a>
							{/if}
			
							<div class="ia-card__content">
								<div class="ia-card__actions dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="fa fa-ellipsis-v"></span></a>
									<ul class="dropdown-menu pull-right">
										<li>{printFavorites item=$item itemtype='autos' guests=true}</li>
										<li><a href="{$item.link}"><span class="fa fa-automobile"></span> {lang key='car_details'}</a></li>
										<li>{accountActions item=$item itemtype='autos'}</li>
									</ul>
								</div>
								<a class="ia-card__title" href="{$item.link}">{$item.model}, {$item.release_year}</a>
								<p class="ia-card__sub-title">{$item.price}</p>
							</div>
						</div>
					</div>
			
					{if $item@iteration % 6 == 0}
						</div>
						<div class="row">
					{/if}
				{/foreach}
			</div>
		</div>
	</div>
{/if}