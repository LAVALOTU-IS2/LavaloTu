$(document).ready(function () { 
	$.ajax({
		dataType: "json",
		url: 'http://localhost:3000/api/v1/garments/',
		success: function(data){
			/*Filter by service*/
			var $content_prices = $('<div class="prices"></div>');
			$content_prices.append('<h2 class="title">Calculate your order</h2>');
			var $options = $('<div class="options form-group"><label for="service">Select service:</label></div>');
			var $garments = $('<div class="content row"></div>');

			var $services = $('<select class="form-control" id="service"></select>');
			var garments_services = [];
			$.each(data, function(i, item) {
				//Fill services
				for (var j = 0; j < data[i].services.length; j++){
					if(garments_services.indexOf(data[i].services[j].name) === -1){
						garments_services.push(data[i].services[j].name);
						$services.append('<option value="'+ data[i].services[j].name +'">'+ data[i].services[j].name +'</option>');
					}
					console.log(data[i].services[j].cost);
				}

				//Create Garments
				var $garment = $('<div class="garment col-md-3"></div>');
				var $garment_image = $('<div class="image"><img src="/assets/garments/'+ data[i].name +'.png" alt="'+ data[i].name +'" title="'+ data[i].name +'" class="img-responsive"></div>');
				var $garment_name = $('<span class="name">'+ data[i].name +'</span>');
				var $mask = $('<div class="mask"><div class="mask"><span class="see-more"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1" x="0px" y="0px" width="40px" height="40px" viewBox="0 0 612 612" style="enable-background:new 0 0 612 612;" xml:space="preserve"><g><g id="Add"><g><path d="M401.625,267.75H344.25v-57.375c0-21.114-17.136-38.25-38.25-38.25s-38.25,17.117-38.25,38.25v57.375h-57.375     c-21.114,0-38.25,17.117-38.25,38.25c0,21.114,17.136,38.25,38.25,38.25h57.375v57.375c0,21.114,17.136,38.25,38.25,38.25     s38.25-17.117,38.25-38.25V344.25h57.375c21.114,0,38.25-17.136,38.25-38.25S422.739,267.75,401.625,267.75z M306,0     C136.992,0,0,136.992,0,306s136.992,306,306,306s306-136.992,306-306S475.008,0,306,0z M306,554.625     C168.912,554.625,57.375,443.088,57.375,306S168.912,57.375,306,57.375S554.625,168.912,554.625,306S443.088,554.625,306,554.625     z" fill="#72e2fd"/></g></g></g></svg></span></div></div>');
				$garment_image.append($mask);
				$garment.append($garment_image);
				$garment.append($garment_name);
				$garments.append($garment);
			});

			$options.append($services);
			$('#garments-container').append($options);
			$('#garments-container').append($garments);
		}
	});
});


