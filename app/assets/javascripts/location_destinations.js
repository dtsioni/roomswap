function updateBuildings(num){
  var campus = $('#swap_destinations_attributes_' + num + '_campus>option:selected').text();
  campus = campus.toLowerCase();
  var buildings = "";
  //find which campus is chosen, and designate proper buildings array and floors hash and then fade in
  switch(campus){
    case "busch":
      buildings = BUILDINGS_BUSCH;
      floors = FLOORS_BUSCH;          
      $('#building_input_' + num).fadeIn();
      break;
    case "livingston":
      buildings = BUILDINGS_LIVINGSTON;
      floors = FLOORS_LIVINGSTON;          
      $('#building_input_' + num).fadeIn();
      break;
    case "college avenue":
      buildings = BUILDINGS_COLLEGE_AVENUE;
      floors = FLOORS_COLLEGE_AVENUE;          
      $('#building_input_' + num).fadeIn();
      break;
    case "cook/douglass":
      buildings = BUILDINGS_COOK_DOUGLASS;  
      floors = FLOORS_COOK_DOUGLASS;        
      $('#building_input_' + num).fadeIn();
      break;
    case "anywhere":
      //change building and floor to "anywhere", then fade out
      buildings = ["anywhere"];
      $('#swap_destinations_attributes_' + num + '_floor').html("<option value = '0'>Anywhere</option>");                    
      $('#building_input_' + num).fadeOut();
      $('#floor_input_' + num).fadeOut();        
      break;
  }
  var newOptions = "";
  for(i = 0; i < buildings.length; i++){
    newOptions += "<option value ='" + buildings[i] + "'>" + buildings[i].toTitleCase() + "</option>";
  }
  $('#building_select_' + num).html(newOptions);
}; 

function updateFloors(num){
  var building = $('#building_select_' + num + '>option:selected').text();
  building = building.toLowerCase();
  var newOptions = "<option value = '0'>Anywhere</option>";
  if(building == "anywhere"){
    $('#floor_input_' + num).fadeOut();        
  }else{
    for(i = 0; i < floors[building]; i++){
      newOptions += "<option value ='" + (i + 1) + "'>" + (i + 1) + "</option>";
    }
    $('#floor_input_' + num).fadeIn();
  }
  $('#swap_destinations_attributes_' + num + '_floor').html(newOptions);
};

