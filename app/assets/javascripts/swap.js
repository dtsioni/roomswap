$(document).ready(function(){
  //livingston is the campus that is automatically selected
  var floors = FLOORS_LIVINGSTON;
  $('select#swap_origin_attributes_campus').change(
    function (){
      var campus = $('#swap_origin_attributes_campus>option:selected').text();
      campus = campus.toLowerCase();
      var buildings = "";  
      switch(campus){
        case "busch":
          buildings = BUILDINGS_BUSCH;
          floors = FLOORS_BUSCH;
          break;
        case "livingston":
          buildings = BUILDINGS_LIVINGSTON;
          break;
        case "college avenue":
          buildings = BUILDINGS_COLLEGE_AVENUE;
          floors = FLOORS_COLLEGE_AVENUE;
          break;
        case "cook/douglass":
          buildings = BUILDINGS_COOK_DOUGLASS;          
          floors = FLOORS_COOK_DOUGLASS;
          break;
      }
      //remove "anywhere" option, which is always first
      buildings.splice(0, 1);      
      var newOptions = "";
      for(i = 0; i < buildings.length; i++){
        newOptions += "<option value ='" + buildings[i] + "'>" + buildings[i].toTitleCase() + "</option>";
      }
      $('#swap_origin_attributes_building').html(newOptions);
      updateFloorOrigin(floors);
    }

  );
  

  $('select#swap_origin_attributes_building').change(function(){
    var building = $('#swap_origin_attributes_building>option:selected').text();
    building = building.toLowerCase();
    var newOptions = "";    
    for(i = 0; i < floors[building]; i++){
      newOptions += "<option value ='" + (i + 1) + "'>" + (i + 1) + "</option>";
    }    
    $('select#swap_origin_attributes_floor').html(newOptions);
  }
);

});

function updateFloorOrigin(floors){
  var building = $('#swap_origin_attributes_building>option:selected').text();
  building = building.toLowerCase();
  var newOptions = "";  
  for(i = 0; i < floors[building]; i++){
    newOptions += "<option value ='" + (i + 1) + "'>" + (i + 1) + "</option>";
  }  
  $('select#swap_origin_attributes_floor').html(newOptions);
}


