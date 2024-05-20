function updateValues(cpNo, total_disc, total_price) {
	let cpInput = $('<input>')
		.attr({
			type: 'hidden',
			name: 'cpNo',
			value: cpNo
		});		
	$('#buyform').append(cpInput);
	
	$('#dc_amt').text(total_disc);
	updateTotalPrice(total_price);
}

function updateTotalPrice(total_price) {
	let dcAmt = parseInt($('#dc_amt').text().replace('원','').trim()) || 0;
	let usePoint = parseInt($('#usePoint').val()) || 0;
	
	let totalPrice = total_price - usePoint;
	
	$('input[name=tot_price]').val(totalPrice);
}