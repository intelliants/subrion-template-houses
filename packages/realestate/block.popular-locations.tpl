{if isset($realestate_blocks.popular_cities)}
	<div class="ia-categories">
		<div class="row">
			{foreach $realestate_blocks.popular_cities as $item}
				<div class="col-md-3 col-sm-3">
					<div class="ia-cat">
						<a href="{$core.packages.realestate.url}{$item.url}">{$item.title}, {$item.abbreviation}</a>
						{if $core.config.realestate_popular_show_number} &mdash; {$item.num_listings}{/if}
					</div>
				</div>

				{if $item@iteration % 4 == 0}
					</div>
					<div class="row ia-cats">
				{/if}
			{/foreach}
		</div>
	</div>
{/if}
