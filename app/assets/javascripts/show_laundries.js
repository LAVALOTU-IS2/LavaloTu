laundries = new Array();
var laundry_id;
function sortOn(property){
    return function(a, b){
        if(a[property] < b[property]){
            return -1;
        }else if(a[property] > b[property]){
            return 1;
        }else{
            return 0;   
        }
    }
}



function drawLaundries(){
	console.log("draw");
	
	var $laundry_info = $('<section class="laundries-info"></div>');
	var $row = $('<div class="data row"></div>');
	var $col = $('<div class="user col-md-12"></div>');
	$col.append('<h3 class="subtitle">Lavalotu&#39s laundries</h3>')
	$col.append('<h4 class="subtitle">You can order laundries if select score or name </h4>')
	var $new = $('<td><a href=laundries/new><img src="assets/add.png" ></a></td>');
	var $space = $('<br></br>');
	var $table=$('<table id="laundries_table"></table>');
	var $tableb=$('<tr>');
	var $name = $(' <th>Name</th>');
	var $address = $(' <th>Address</th>');
	var $phone = $(' <th>Phone</th>');
	var $score = $(' <th>Score</th>');				
	var $tablef=$('<tr>');
	$table.append($tableb);
	$tableb.append($name);
	$tableb.append($address);
	$tableb.append($phone);
	$tableb.append($score);
	$table.append($tablef);		

	for (var k = 0; k < laundries.length; k++){		
		var $tableb2=$('<tr>');
		var $id = laundries[k].id;
		var $name = $(' <td>'+laundries[k].name +'</td>');
		var $address = $(' <td>'+laundries[k].address +'</td>');
		var $phone = $(' <td>'+laundries[k].phone +'</td>');
		var $score = $(' <td>'+laundries[k].score +'</td>');
		var $show = $('<td><a href=laundries/'+$id+'><img src="assets/show.png" ></a></td>');
		var $edit = $('<td><a href=laundries/'+$id+'/edit><img src="assets/edit.png" ></a></td>');
		var $delete = $('<td><a href=laundries/><img src="assets/delete.png" onclick="removeLaundry('+k+');"></a></td>');
		var $garments = $('<td><a href=laundries/'+$id+'/garments>Garments</a></td>');
		$tableb2.append($name);
		$tableb2.append($address);
		$tableb2.append($phone);
		$tableb2.append($score);
		$tableb2.append($show);
		$tableb2.append($edit);
		$tableb2.append($delete);
		$tableb2.append($garments);
		var $tablef2=$('<tr>');	
		$table.append($tableb2);		
		$table.append($tablef2);
		$col.append($table);
		$col.append($space);
		$col.append($space);
		$col.append($new);
		$row.append($col);
		$laundry_info.append($row);

	}
	
	
	console.log($tableb);
	$('.admin-container').append($laundry_info);
	returnType();
}

function removeLaundry(i){
	alert("Are you sure?");
	laundries.splice(i,1);
	$(".laundries-info").remove();
	drawLaundries();
}
function returnType(){
	var table = document.getElementById("laundries_table");
	if (table != null) {
	    
        for (var j = 0; j < table.rows[0].cells.length; j++)
        table.rows[0].cells[j].onclick = function () {
        	console.log("text",this.innerHTML);
        	type=this.innerHTML;
        	//tableText(this);

        	OrderLaundries(type);

            
        };
	    
	}
}


function OrderLaundries(type){	

	$(".laundries-info").remove();
	console.log("orden por",type);
	if(type=="Name"){		
		console.log("si es tipo",type);
		laundries.sort(sortOn("name"));
		drawLaundries();
		for (var k = 0; k < laundries.length; k++){		
		
		console.log(laundries[k].name);	
		
		}

	}
	else if(type=="Score"){	
		//$(".laundries-info").remove();
		laundries.sort(sortOn("score"));
		drawLaundries();
		for (var k = 0; k < laundries.length; k++){		
		
		console.log(laundries[k].name);	
		
		}
		console.log("name",laundries[0].name,laundries[1].score);	
		//laundries.orderByNumber('score', -1);
		//drawLaundries();
	}
}


$(document).ready(function () {
	console.log("Si");
	//laundry_id = gon.laundry_id;
	$.ajax({
		dataType: "json",
		url: '/api/v1/laundries/',
		success: function(data){
			for (var i = 0; i < data.laundries.length; i++) {
				laundries.push(data.laundries[i]);
				
			}

			//$options.append($search);
			drawLaundries();
			//OrderLaundries('Score');
			returnType();
			
		}
	});
});