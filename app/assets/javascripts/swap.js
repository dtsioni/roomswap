$(document).ready(function(){
  $('#building_input').hide();
  $('#floor_input').hide();
  var floors = "";
  $('select#swap_origin_attributes_campus').change(

    function (){
      var campus = $('#swap_origin_attributes_campus>option:selected').text();
      campus = campus.toLowerCase();
      var buildings = "";  
      switch(campus){
        case "busch":
          buildings = BUILDINGS_BUSCH;
          floors = FLOORS_BUSCH;          
          $('#building_input').fadeIn();
          break;
        case "livingston":
          buildings = BUILDINGS_LIVINGSTON;
          floors = FLOORS_LIVINGSTON;          
          $('#building_input').fadeIn();
          break;
        case "college avenue":
          buildings = BUILDINGS_COLLEGE_AVENUE;
          floors = FLOORS_COLLEGE_AVENUE;          
          $('#building_input').fadeIn();
          break;
        case "cook/douglass":
          buildings = BUILDINGS_COOK_DOUGLASS;  
          floors = FLOORS_COOK_DOUGLASS;        
          $('#building_input').fadeIn();
          break;
        case "anywhere":
          buildings = ["anywhere"];
          floors = ["anywhere"];
          $('select#swap_origin_attributes_floor').html("<option value = '0'>Anywhere</option>");                    
          $('#building_input').fadeOut();
          $('#floor_input').fadeOut();        
          break;
      }
      var newOptions = "";
      for(i = 0; i < buildings.length; i++){
        newOptions += "<option value ='" + buildings[i] + "'>" + buildings[i].toTitleCase() + "</option>";
      }
      $('#swap_origin_attributes_building').html(newOptions);
    }

  );

  $('select#swap_origin_attributes_building').change(

    function updateFloors(){
      var building = $('#swap_origin_attributes_building>option:selected').text();
      building = building.toLowerCase();
      var newOptions = "<option value = '0'>Anywhere</option>";
      if(building == "anywhere"){
        $('#floor_input').fadeOut();        
      }else{
        for(i = 0; i < floors[building]; i++){
          newOptions += "<option value ='" + (i + 1) + "'>" + (i + 1) + "</option>";
        }
        $('#floor_input').fadeIn();
      }
      $('select#swap_origin_attributes_floor').html(newOptions);
    }

  )

});

