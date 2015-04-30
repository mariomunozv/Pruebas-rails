
$(document).ready(function () {

	$('#index-search select option').each(function (index, value) {
		var select = $(this).parent()[0] // Objecto <select />
		var item = $(value).val()		 // Objeto <option />
			
		// Si la option esta presente en la URI
		if(location.search.indexOf( item ) != -1) {
			// La selecciono para nueva búsqueda
			$(select).val( item )
			$('#index-search input').attr('name', item)
		}
	})

})

$('#index-search select').change(function () {
	// Name change
	$('#index-search input').attr('name', $(this).val())
})
