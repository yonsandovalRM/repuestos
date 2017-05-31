$(document).on('turbolinks:load', function() {
	$('#desde').datetimepicker({
		format: 'DD-MM-YYYY',
		locale: 'es'
	});
	$('#hasta').datetimepicker({
		format: 'DD-MM-YYYY',
		locale: 'es'
	});
});