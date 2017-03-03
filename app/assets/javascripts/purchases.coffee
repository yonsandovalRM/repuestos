$(document).on 'turbolinks:load', ()->
	$('#datetimepicker').datetimepicker({
		format: 'DD/MM/YYYY',
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