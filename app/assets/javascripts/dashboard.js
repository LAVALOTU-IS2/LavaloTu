var garments_services = new Object();

function renderGarments( service ){
	$("#garment_pieces").remove();

	var $garments = $('<div id="garment_pieces" class="content row"></div>');
	for(var k in garments_services[service]){
		var name_image = "garments/"+ k.toLowerCase() +".png"; 
		console.log(name_image);
		var $garment = $('<div class="garment col-md-3"></div>');
		var $garment_image = $('<div class="image '+ k.toLowerCase() +'"></div>');	
		//var $garment_image = $('<div class="image"><%= asset_path "garments/'+ k.toLowerCase() +'.png", :alt => "'+ k +'", :title => "'+ k +'", :class=> "img-responsive" %></div>');
		var $garment_name = $('<span class="name">'+ k +'</span>');
		var $price = $('<span>From: $ '+ garments_services[service][k][0] +' To: $ ' + garments_services[service][k][1] + '</span>')

		$garment.append($garment_image);
		$garment.append($garment_name);
		$garment.append($price);	
		$garments.append($garment);
	}

	$('#garments-container').append($garments);
}

$(document).ready(function () {
	console.log("Si");
	$.ajax({
		dataType: "json",
		url: '/api/v1/laundries/',
		success: function(data){
			var $options = $('<div class="options form-group"><label for="service">Select service:</label></div>');
			var $services = $('<select class="form-control" onchange="renderGarments(this.value);"></select>');

			for (var i = 0; i < data.laundries.length; i++) {
				for( var j = 0; j < data.laundries[i].services.length; j++){
					var service_name = data.laundries[i].services[j].name;
					var garment_name = data.laundries[i].services[j].garment.name;
					var service_cost = data.laundries[i].services[j].cost;
					if(!(service_name in garments_services)){
						garments_services[service_name] = new Object();
						$services.append('<option value="'+ service_name +'">'+ service_name +'</option>');
					}
					else{
						if(!(garment_name in garments_services[service_name])){
							garments_services[service_name][garment_name] = [service_cost, service_cost];
						}
						else{
							if(garments_services[service_name][garment_name][0] > service_cost){
								garments_services[service_name][garment_name][0] = service_cost;
							}
							else if(garments_services[service_name][garment_name][1] < service_cost){
								garments_services[service_name][garment_name][1] = service_cost;
							}
						}
					}
				}
			}
			;
			$options.append($services);
			$('#garments-container').append($options);
			renderGarments("Washed And Drying");
		}
	});
});
