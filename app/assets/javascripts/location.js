$(document).ready(function(){
  $('select#location_campus').change(
    function updateBuildings(){
      var campus_select = $('select#location_campus');
      var campus = $('#location_campus>option:selected').text();
      campus = campus.toLowerCase();
      var buildings = "";  
      switch(campus){
        case "busch":
          buildings = BUILDINGS_BUSCH;
          break;
        case "livingston":
          buildings = BUILDINGS_LIVINGSTON;
          break;
        case "college avenue":
          buildings = BUILDINGS_COLLEGE_AVENUE;
          break;
        case "cook douglass":
          buildings = BUILDINGS_COOK_DOUGLASS;
          break;
      }
      var newOptions = "";
      for(i = 0; i < buildings.length; i++){
        newOptions += "<option value ='" + buildings[i] + "'>" + buildings[i] + "</option>";
      }
      $('#location_building').html(newOptions);
    }
  );
});

