$(function(){


  $("#map-container").japanMap({
    width:600,
        backgroundColor : "#f2fcff",
        borderLineColor: "#f2fcff",
        borderLineWidth : 0.25,
        lineColor : "#a0a0a0",
        lineWidth: 1,
        drawsBoxLine: true,
        showsPrefectureName: true,
        prefectureNameType: "short",
        movesIslands : true,
        fontSize : 11,
    onSelect : function(data){
     location.href = location.pathname + "?prefecture_id=" + data.code;
    }
  });
});