$(document).on 'turbolinks:load', ()->
	$('#datetimepicker').datetimepicker({
		format: 'YYYY/MM/DD',
		locale: 'es',
	})

	$('#dpmin').datetimepicker({
		format: 'DD/MM/YYYY',
		locale: 'es',
	})
	$('#dpmax').datetimepicker({
		format: 'DD/MM/YYYY',
		locale: 'es',
	})