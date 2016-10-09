var laundry_services = new Object();

function renderGarments( service ){
	$("#laundry_garments").remove();

	var $garments = $('<div id="laundry_garments" class="content row"></div>');
	for(var k in laundry_services[service]){
		var $garment = $('<div class="garment col-md-3"></div>');
		var $garment_image = $('<div class="image"><img src="/assets/garments/'+ k.toLowerCase() +'.png" alt="'+ k +'" title="'+ k +'" class="img-responsive"></div>');
		var $garment_name = $('<span class="name">'+ k +'</span>');
		var $price = $('<span>Price: $ '+ laundry_services[service][k] +'</span>')

		$garment.append($garment_image);
		$garment.append($garment_name);
		$garment.append($price);	
		$garments.append($garment);
	}

	$('#laundries-container').append($garments);
}

$(document).ready(function () {
	console.log("Si");
	var laundry_id = gon.laundry_id;
	$.ajax({
		dataType: "json",
		url: '/api/v1/laundries/'+ laundry_id,
		success: function(data){
			console.log(data);
			var $laundry_info = $('<div id="laundry_info"></div>');
			$laundry_info.append('<p><span>Name: </span>'+ data.laundry.name +'</p>');
			$laundry_info.append('<p><span>Address: </span>'+ data.laundry.address +'</p>');
			$laundry_info.append('<p><span>Phone: </span>'+ data.laundry.phone +'</p>');
			$laundry_info.append('<p><span>Score: </span>'+ data.laundry.score +'</p>');
			$('#laundries-container').append($laundry_info);

			var $options = $('<div class="options form-group"><label for="service">Select service:</label></div>');
			var $services = $('<select class="form-control" onchange="renderGarments(this.value);"></select>');
			for( var j = 0; j < data.laundry.services.length; j++){
				var service_name = data.laundry.services[j].name;
				var garment_name = data.laundry.services[j].garment.name;
				var service_cost = data.laundry.services[j].cost;
				if(!(service_name in laundry_services)){
					laundry_services[service_name] = new Object();
					laundry_services[service_name][garment_name] = service_cost;
					$services.append('<option value="'+ service_name +'">'+ service_name +'</option>');
				}
				else{
					if(!(garment_name in laundry_services[service_name])){
						laundry_services[service_name][garment_name] = service_cost;
					}
				}
			}
			$options.append($services);
			$('#laundries-container').append($options);
			renderGarments("Washed And Drying");
			console.log(laundry_services);
		}
	});
});