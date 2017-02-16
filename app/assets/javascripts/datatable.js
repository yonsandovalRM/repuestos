$(document).on('turbolinks:load', function() {
	$('.table').DataTable({
		language: {
			"decimal":        "",
			"emptyTable":     "No hay datos disponibles",
			"info":           "Mostrando _START_ hasta _END_ de _TOTAL_ registros",
			"infoEmpty":      "Mostrando 0 hasta 0 de 0 registros",
			"infoFiltered":   "(filtrados desde _MAX_ registros totales)",
			"infoPostFix":    "",
			"thousands":      ",",
			"lengthMenu":     "Mostrar _MENU_ registros",
			"loadingRecords": "Cargando...",
			"processing":     "Procesando...",
			"search":         "Buscar:",
			"zeroRecords":    "No se encontraron registros",
			"paginate": {
				"first":      "Primero",
				"last":       "Último",
				"next":       "Siguiente",
				"previous":   "Anterior"
			}
		}
	});
});