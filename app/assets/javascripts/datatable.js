$(document).on('turbolinks:load', function() {
	
	$('[data-toggle="tooltip"]').tooltip()
	$('.articlelist').DataTable({
		destroy: true,
		"columnDefs": [
        {
            "targets": [ 1 ],
            "visible": false,
            "searchable": true
        },
        {
            "targets": [ 3 ],
            "visible": false,
            "searchable": true
        },
        {
            "targets": [ 7 ],
            "visible": false,
            "searchable": true
        }
        ,
        {
            "targets": [ 8 ],
            "visible": false,
            "searchable": true
        }],
        "scrollX": true,
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
	var table = $('.historylist').DataTable({
		destroy: true,
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
 	$("#dpmin").on("dp.change", function(e) {
	   table.draw();
	    
	});
	$("#dpmax").on("dp.change", function(e) {
	   table.draw(); 
	});

	// if (document.getElementById('min') ){
	// 	$.fn.dataTableExt.afnFiltering.push(
	// 	    function( oSettings, aData, iDataIndex ) {

	//     		var inicioDate = document.getElementById('min').value;
	// 	        var finDate = document.getElementById('max').value;
	// 	        var date = 1;

	// 	        inicioDate=inicioDate.substring(6,10) + inicioDate.substring(3,5)+ inicioDate.substring(0,2);
	// 	        finDate=finDate.substring(6,10) + finDate.substring(3,5)+ finDate.substring(0,2);
		 
	// 	        var dataDate=aData[date].substring(6,10) + aData[date].substring(3,5)+ aData[date].substring(0,2);
		        
		 
	// 	        if ( inicioDate === "" && finDate === "" )
	// 	        {
	// 	            return true;
	// 	        }
	// 	        else if ( inicioDate <= dataDate && finDate === "")
	// 	        {
	// 	            return true;
	// 	        }
	// 	        else if ( finDate >= dataDate && inicioDate === "")
	// 	        {
	// 	            return true;
	// 	        }
	// 	        else if (inicioDate <= dataDate && finDate >= dataDate)
	// 	        {
	// 	            return true;
	// 	        }
	// 	        return false;
	//     	}
	// 	);
	// };
	
	$('.articlelistmodal').DataTable({
		destroy: true,
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
	$('.customerlistmodal').DataTable({
		destroy: true,
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
	$('.homelist').DataTable({
		destroy: true,
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

