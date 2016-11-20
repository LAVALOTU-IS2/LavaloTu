var map;
function success(position) {
	var myLatLng = {lat: position.coords.latitude, lng: position.coords.longitude};
	var content; var pinColor; var pinImage; var infowindow; var size;
	var infoWindowsOpenCurrently; var markers; var laundries;

	map = new google.maps.Map(document.getElementById('map'), {
	    center: myLatLng,
	    zoom: 11
	});

	pinImage = '/assets/person1.png';
	var marker = new google.maps.Marker({
		map: map,
		position: myLatLng,
		title: 'My location',
		icon: pinImage

	});

	laundries = gon.laundries;
	markers = new Array();
	for(i = 0; i<laundries.length; i++){
		myLatLng = {lat: laundries[i].latitude,lng: laundries[i].longitude};
		pinColor = getColor(laundries[i].score);
		size = getSize(laundries[i].score);
		pinImage = {
		    url: "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|" + pinColor, // url
		    scaledSize: new google.maps.Size(size.w, size.h), // scaled size
		    origin: new google.maps.Point(0,0), // origin
		    anchor: new google.maps.Point(0, 0) // anchor
		};

		marker = new google.maps.Marker({
			map: map,
			position: myLatLng,
			title: laundries[i].name,
			icon: pinImage,
	    });
	    
	    content = 	'<div class="content">' +
					'<div class="image" align="center">' +
					'<img alt="Laundry Icon" title="Laundry Icon" class="img-responsive" src="/assets/ironing-board.png" />' +
					'</div>' +
					'<h4 class="name">' + laundries[i].name + '</h4>' +
					'<span class="address">' + laundries[i].address + '</span>' + '</br>' +
					'<span class="phone">Phone: ' + String(laundries[i].phone) + '</span>' + '</br>' +
					'<span class="phone">Service time: ' + laundries[i].opening_time + ' - ' + laundries[i].closing_time '</h5>' +
					'<h5 class="score">Score: ' + String(laundries[i].score) + '</h5>' +
					'<a class="mask" href="/laundries/' + String(laundries[i].id) + '">' +
					'See prices </a>' +
					'</div>';

	    infowindow = new google.maps.InfoWindow();
	    
	    google.maps.event.addListener(marker,'click', (function(marker,content,infowindow){ 
		    return function() {
		        typeof infoWindowsOpenCurrently !== 'undefined' && infoWindowsOpenCurrently.close();//if variable is defined close
		        infowindow.setContent(content);
		        infowindow.open(map,marker);
		        infoWindowsOpenCurrently = infowindow;//set current info window to temporary variable
		    };
		})(marker,content,infowindow));  
		markers.push(marker);
	}
	var Cluster = new MarkerClusterer(map, markers,
        {imagePath: '/assets/m'});
    
}		 

function getColor(score){
	if(score > 4 && score <= 5)
		return '46B400';
	else if(score > 3 && score <= 4)
		return 'B0FF00';
	else if(score > 2 && score <= 3)
		return 'FFB400';
	else if(score > 1 && score <= 2)
		return 'FF8100';
	else
		return 'FF0000';
}

function getSize(score){
	if(score > 4 && score <= 5)
		return {w: 21, h: 34};
	else if(score > 3 && score <= 4)
		return {w: 19, h: 31};
	else if(score > 2 && score <= 3)
		return {w: 17, h: 28};
	else if(score > 1 && score <= 2)
		return {w: 15, h: 25};
	else
		return {w: 13, h: 22};	
}
			
function error() {
	console.log("Error");
}

function initMap() {
	if (!navigator.geolocation){
		console.log("cant do this");
		return;
	}
	navigator.geolocation.getCurrentPosition(success, error);
}
