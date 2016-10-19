var laundry_services = new Object();

function calculate(option, garment, price){
	var e = document.getElementsByClassName("form-control");
	var service = e[0].options[e[0].selectedIndex].value;
	var quantity = laundry_services[service][garment][1];
	if(option == 1){
		quantity += 1;
		laundry_services[service][garment][1] = quantity;
		var outerDiv = document.getElementsByClassName('garment '+ garment.toLowerCase() +' col-md-3');
		var counter = outerDiv[0].getElementsByClassName("number");
		counter[0].innerHTML = quantity;
		var result = document.getElementById("result");
		result.innerHTML = Number(result.innerHTML) + Number(price);
	}
	else{
		if(quantity >= 1) {
			quantity -= 1;
			laundry_services[service][garment][1] = quantity;
			var outerDiv = document.getElementsByClassName('garment '+ garment.toLowerCase() +' col-md-3');
			var counter = outerDiv[0].getElementsByClassName("number");
			counter[0].innerHTML = quantity;
			var result = document.getElementById("result");
			result.innerHTML = Number(result.innerHTML) - Number(price);
		}
	}
}

function resetCalculator(){
	var e = document.getElementsByClassName("form-control");
	var service = e[0].options[e[0].selectedIndex].value;
	for(var i in laundry_services){
		for(var j in laundry_services[i]){
			laundry_services[i][j][1] = 0;
			if (i == service) {
				var outerDiv = document.getElementsByClassName('garment '+ j.toLowerCase() +' col-md-3');
				var counter = outerDiv[0].getElementsByClassName("number");
				counter[0].innerHTML = laundry_services[i][j][1];
			}
		}
	}
	var result = document.getElementById("result");
	result.innerHTML = 0;
}

function renderGarments( service ){
	$("#laundry_garments").remove();
	var $garments = $('<div id="laundry_garments" class="content row"></div>');
	for(var k in laundry_services[service]){
		var $garment = $('<div class="garment '+ k.toLowerCase() +' col-md-3"></div>');
		var $garment_image = $('<div class="image '+ k.toLowerCase() +'"></div>');			
		var $garment_name = $('<span class="name">'+ k +'</span>');
		var $mask = $('<div class="mask"><div class="options"><span class="plus" onclick="calculate(1, &#34' + k +'&#34 , '+ laundry_services[service][k][0] +');"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1" x="0px" y="0px" width="40px" height="40px" viewBox="0 0 612 612" style="enable-background:new 0 0 612 612;" xml:space="preserve"><g><g id="Add"><g><path d="M401.625,267.75H344.25v-57.375c0-21.114-17.136-38.25-38.25-38.25s-38.25,17.117-38.25,38.25v57.375h-57.375     c-21.114,0-38.25,17.117-38.25,38.25c0,21.114,17.136,38.25,38.25,38.25h57.375v57.375c0,21.114,17.136,38.25,38.25,38.25     s38.25-17.117,38.25-38.25V344.25h57.375c21.114,0,38.25-17.136,38.25-38.25S422.739,267.75,401.625,267.75z M306,0     C136.992,0,0,136.992,0,306s136.992,306,306,306s306-136.992,306-306S475.008,0,306,0z M306,554.625     C168.912,554.625,57.375,443.088,57.375,306S168.912,57.375,306,57.375S554.625,168.912,554.625,306S443.088,554.625,306,554.625     z" fill="#91DC5A"/></g></g></g></svg></span><span class="minus" onclick="calculate(0,  &#34' + k +'&#34 ,  '+ laundry_services[service][k][0] +');"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1" x="0px" y="0px" width="40px" height="40px" viewBox="0 0 438.533 438.533" style="enable-background:new 0 0 438.533 438.533;" xml:space="preserve"><g><path d="M409.133,109.203c-19.608-33.592-46.205-60.189-79.798-79.796C295.736,9.801,259.058,0,219.273,0   c-39.781,0-76.47,9.801-110.063,29.407c-33.595,19.604-60.192,46.201-79.8,79.796C9.801,142.8,0,179.489,0,219.267   c0,39.78,9.804,76.463,29.407,110.062c19.607,33.592,46.204,60.189,79.799,79.798c33.597,19.605,70.283,29.407,110.063,29.407   s76.47-9.802,110.065-29.407c33.593-19.602,60.189-46.206,79.795-79.798c19.603-33.596,29.403-70.284,29.403-110.062   C438.533,179.485,428.732,142.795,409.133,109.203z M347.179,237.539c0,4.948-1.811,9.236-5.428,12.847   c-3.614,3.614-7.898,5.428-12.847,5.428h-219.27c-4.948,0-9.229-1.813-12.847-5.428c-3.616-3.61-5.424-7.898-5.424-12.847v-36.547   c0-4.948,1.809-9.231,5.424-12.847c3.617-3.617,7.898-5.426,12.847-5.426h219.27c4.948,0,9.232,1.809,12.847,5.426   c3.617,3.615,5.428,7.898,5.428,12.847V237.539z" fill="#D80027"/></g></svg></span></div></div>');
		var $price = $('<span class="price">Price: $ '+ laundry_services[service][k][0] +'</span>')
		var $counter = $('<p class="number" >'+ laundry_services[service][k][1] +'</p>')
		$mask.append($counter);
		$garment_image.append($mask);
		$garment.append($garment_image);
		$garment.append($garment_name);
		$garment.append($price);	
		$garments.append($garment);
	}

	$('#laundries-container').append($garments);
}

$(document).ready(function () {
	var laundry_id = gon.laundry_id;
	$.ajax({
		dataType: "json",
		url: '/api/v1/laundries/'+ laundry_id,
		success: function(data){
			var $laundry_info = $('<div class="laundry_info"></div>');
			$laundry_info.append('<h1 class="title">'+ data.laundry.name +'</h1>');
			$laundry_info.append('<span class="detail-cost">Here you&#39ll find all our services and prices</span>')
			$('#laundries-container').append($laundry_info);
			var $calculator = $('<div class="calculator"></div>');
			var $result = $('<div id="result">0</div>');
			var $reset = $('<div id="reset" onclick="resetCalculator()">Reset Calculator</div>');
			$calculator.append($result);
			$calculator.append($reset);
			var $options = $('<div class="options form-group"><label for="service">Select the service you are looking for and then just click on each Garment to add it to our price calculator.</label></div>');
			var $services = $('<select class="form-control" onchange="renderGarments(this.value);"></select>');
			for( var j = 0; j < data.laundry.services.length; j++){
				var service_name = data.laundry.services[j].name;
				var garment_name = data.laundry.services[j].garment.name;
				var service_cost = data.laundry.services[j].cost;
				if(!(service_name in laundry_services)){
					laundry_services[service_name] = new Object();
					laundry_services[service_name][garment_name] = [service_cost, 0];
					$services.append('<option value="'+ service_name +'">'+ service_name +'</option>');
				}
				else{
					if(!(garment_name in laundry_services[service_name])){
						laundry_services[service_name][garment_name] = [service_cost, 0];
					}
				}
			}
			$options.append($services);
			$('#laundries-container').append($options);
			$('#laundries-container').append($calculator);
			renderGarments("Washed And Drying");
		}
	});
});