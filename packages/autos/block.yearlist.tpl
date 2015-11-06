{if isset($car_blocks_data.year)}
	<ul class="year-list">
		{section name='years' loop=$car_blocks_data.year.loop max=$car_blocks_data.year.max step=-1}
			<li><a href="{$car_blocks_data.year.url}year:{$smarty.section.years.index}/">{$smarty.section.years.index}</a></li>
		{/section}
	</ul>
{/if}