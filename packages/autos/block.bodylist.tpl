{if isset($car_blocks_data.body)}
	<div class="bodystyle-list">
		<div class="row">
			{foreach $car_blocks_data.body as $name => $entry}
				<div class="col-sm-3">
					<a href="{$entry.url}" class="pr-list__item">
						<img src="{$img}bodytypes/{$name}.png" alt="{$item.title}">
						<span class="pr-list__item__title">{$entry.title|escape:'html'}</span>
					</a>
				</div>

				{if $entry@iteration % 4 == 0}
					</div>
					<div class="row">
				{/if}
			{/foreach}
		</div>
	</div>
{/if}