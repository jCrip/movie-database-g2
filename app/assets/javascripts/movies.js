// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('page:change', function() {

	function geoSuccess(position) {
		var lat = position.coords.latitude;
		var lng = position.coords.longitude;

		$.ajax({
			url: '/',
			type: 'GET',
			dataType: 'script',
			data: {
				latitude: lat,
				longitude: lng
			}
		});

	}

	function geoError(error) {
		alert('Try again later mother fucker!');
	}

	function getPosition() {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(geoSuccess, geoError);
		} else {
			alert("IE vale callampa")
		}
	}

	getPosition();


});
