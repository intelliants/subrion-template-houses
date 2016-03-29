{if isset($realestate_blocks.recent)}
	<h2 class="b-title b-title--accent">{$block.title|escape:'html'}</h2>
	<div class="ia-cards ia-cards--small">
		<div class="ia-cards__items">
			<div class="row">
				{foreach $realestate_blocks.recent as $item}
					<div class="col-md-2 col-sm-2">
						<div class="ia-card ia-card--small -{$item.status} {if 'hidden' == $item.status}-hidden{/if} {if $item.featured}-featured{/if} {if $item.sponsored}-sponsored{/if}">
					
							{if isset($item.gallery[0]['path']) && $item.gallery[0]['path']}
								<a class="ia-card__image" href="{ia_url type='url' item='estates' data=$item}">
									{printImage imgfile=$item.gallery[0]['path'] title=$item.address}
									<span class="ia-card__support-info">
										<span class="pull-left"><span class="fa fa-image"></span> {$item.gallery_num}</span>
										<span class="pull-right">{$item.date_added|date_format:$core.config.date_format}</span>
									</span>
								</a>
							{/if}
					
							<div class="ia-card__content">
								<div class="ia-card__actions dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="fa fa-ellipsis-v"></span></a>
									<ul class="dropdown-menu pull-right">
										<li>{printFavorites item=$item itemtype='estates' guests=true}</li>
										<li><a href="{ia_url type='url' item='estates' data=$item}"><span class="fa fa-home"></span> {lang key='house_details'}</a></li>
									</ul>
								</div>
								<a class="ia-card__title" href="{ia_url type='url' item='estates' data=$item}">{$item.address|escape:'html'}</a>
								{if !empty($item.price)}
									<p class="ia-card__sub-title">{$item.price_formatted}</p>
								{/if}
							</div>
						</div>
					</div>

					{if $item@iteration % 6 == 0 && !$item@last}
						</div>
						<div class="row">
					{/if}
				{/foreach}
			</div>
		</div>
	</div>
{/if}