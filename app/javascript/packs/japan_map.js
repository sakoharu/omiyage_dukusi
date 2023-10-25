$(function(){
  $("#map-container").japanMap({
    width:600,
    onSelect : function(data){
     alert(data.name);
    }
  });
});