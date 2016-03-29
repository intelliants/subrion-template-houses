{if isset($realestate_blocks.featured)}
	<div class="ia-items featured-real-estates">
		{foreach $realestate_blocks.featured as $item}
			<div class="ia-item -with-bg">
				{if isset($item.gallery[0]['path']) && $item.gallery[0]['path']}
					<a href="{ia_url type='url' item='estates' data=$item}" class="ia-item__image">{printImage imgfile=$item.gallery[0]['path'] title=$item.address width=50}</a>
				{/if}

				<div class="ia-item__content">
					<h5 class="ia-item__title">
						<a href="{ia_url type='url' item='estates' data=$item}">{$item.address|escape:'html'}</a>
					</h5>
					{if !empty($item.price)}<p class="ia-item__price"><span class="fa fa-tag"></span> {$item.price_formatted}</p>{/if}
					<p><span class="fa fa-map-pin"></span> {$item.address2|escape:'html'}</p>
				</div>
			</div>
		{/foreach}
	</div>
{/if}