laundries = new Array();

Array.prototype.orderByNumber=function(p, so){
	if(so != -1 && so != 1) so=1;
	this.sort(function(a, b){
		return(a[p] - b[p]) * so;
	})
}

function drawLaundries(){
	var $laundries_con = $('<section class="laundries-info"></section>');
	var $ld = $('<div class="data row">');
	for(var k = 0; k < laundries.length; k++){		
		var $id = laundries[k].id;
		var $alaundry = $('<a href=laundries/'+$id+'></a>');
		var $laundryc = $('<div class="laundry col-md-4"></div>');
		var $lc = $('<div class="content">');
		var $mask = $('<div class="mask"></div>');
		var $name = $('<h3 class="name">'+ laundries[k].name +'</h3>');
		var $address = $('<span class="address">'+laundries[k].address +'</span>');
		var $phone = $('<span class="phone">' + laundries[k].phone+'</span>');
		var $score = $('<h4 class="score">' + laundries[k].score+ '</h4>');			

		$alaundry.append($mask);
		$lc.append($alaundry);
		$lc.append($name);
		$lc.append($address);	
		$lc.append($phone);	
		$lc.append($score);
		$laundryc.append($lc);
		$ld.append($laundryc);	
		$laundries_con.append($ld);
	}

	$('#laundries-container').append($laundries_con);


}

function OrderLaundries( type ){
	$(".laundries-info").remove();
	if(type=="score_as"){		
		laundries.orderByNumber('score', 1);
		drawLaundries();
	}
	else if(type=="score_ds"){		
		laundries.orderByNumber('score', -1);
		drawLaundries();
	}
}


$(document).ready(function () {
	console.log("Si");
	$.ajax({
		dataType: "json",
		url: '/api/v1/laundries/',
		success: function(data){
			var $laundry_info = $('<div class="laundry_info"></div>');
			$laundry_info.append('<h1 class="detail-title">Here you&#39ll find all our laundries</h1>')
			$('#laundries-container').append($laundry_info);
			var $options = $('<div class="options form-group"><label for="service">Select the type  of search</label></div>');
			var $search = $('<select class="form-control" onchange="OrderLaundries(this.value);"> <option value="score_as">score upward</option> <option value="score_ds">score falling</option></select>');
			console.log(data.laundries.length);
			for (var i = 0; i < data.laundries.length; i++) {
				laundries.push(data.laundries[i]);
			}
			$options.append($search);
			$('#laundries-container').append($options);
			OrderLaundries("score_ds");		
		}
	});
});