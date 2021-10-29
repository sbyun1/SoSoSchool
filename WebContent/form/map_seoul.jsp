<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<div id="map" style="width:300px;height:300px;"></div>
            <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=49af48b1cf77792390c26841571e0b1c"></script>
            <script type="text/javascript">
                /*카카오맵 구현*/

                //행정구역 구분
                $.getJSON("../src/ss.geojson", function(geojson) {
                    var data = geojson.features;
                    var coordinates = [];    //좌표 저장할 배열

                    $.each(data, function(index, val) {
                        coordinates = val.geometry.coordinates;
                        name = val.properties.SIG_KOR_NM;

                        displayArea(coordinates);
                    })
                })

                var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                    mapOption = {
                        center: new kakao.maps.LatLng(37.56087229371253, 126.95858686660779 ), // 지도의 중심좌표
                        level: 10 // 지도의 확대 레벨
                    };

                // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
                var map = new kakao.maps.Map(mapContainer, mapOption);

                // 맵 이동 금지
                map.setDraggable(false);
                // 맵 확대 축소 금지
                map.setZoomable(false);


                // 도서관 핀 생성
                var positions = [
                    {
                        content : '<div>서울 도서관</div>',
                        lating : new kakao.maps.LatLng(37.566262, 126.977856),
                        clickable: true
                    },
                    {
                        content : '<div>국회 도서관</div>',
                        lating : new kakao.maps.LatLng(37.531179, 126.917114),
                        clickable: true
                    },
                    {
                        content : '<div>아마 송파 도서관</div>',
                        lating : new kakao.maps.LatLng(37.503641, 127.103692),
                        clickable: true
                    }
                ];

                //도서관 핀 출력
                var marker1 = new kakao.maps.Marker({
                    map: map,    //마커를 표시할 지도의 변수명
                    position: positions[0].lating,
                });
                var marker2 = new kakao.maps.Marker({
                    map: map,    //마커를 표시할 지도의 변수명
                    position: positions[1].lating,
                });
                var marker3 = new kakao.maps.Marker({
                    map: map,    //마커를 표시할 지도의 변수명
                    position: positions[2].lating,
                });

                //도서관 클릭 이벤트 생성
                kakao.maps.event.addListener(marker1, 'click', function() {
                    location.href='../group_controller.do?command=group_border&gboard_region=SEOUL&gboard_library=A도서관';
                });
                kakao.maps.event.addListener(marker2, 'click', function() {
                	location.href='../group_controller.do?command=group_border&gboard_region=SEOUL&gboard_library=B도서관';
                });
                kakao.maps.event.addListener(marker3, 'click', function() {
                	location.href='../group_controller.do?command=group_border&gboard_region=SEOUL&gboard_library=C도서관';
                });

                var infowindow1 = new kakao.maps.InfoWindow({
                    position : new kakao.maps.LatLng(37.566262, 126.977856),
                    content : '<div>서울 도서관</div>'
                });

                var infowindow2 = new kakao.maps.InfoWindow({
                    position : new kakao.maps.LatLng(37.531179, 126.917114),
                    content : '<div>국회 도서관</div>'
                });

                var infowindow3 = new kakao.maps.InfoWindow({
                    position : new kakao.maps.LatLng(37.503641, 127.103692),
                    content : '<div>아마 송파 도서관</div>'
                });

                infowindow1.open(map, marker1);
                infowindow2.open(map, marker2);
                infowindow3.open(map, marker3);

                //행정구역 폴리곤
                function displayArea(coordinates) {
                    var path = [];

                    console.log(coordinates);

                    $.each(coordinates[0], function(index, coordinate) {
                        path.push(new daum.maps.LatLng(coordinate[1],coordinate[0]));
                    })

                    console.log(path);

                    // 다각형을 생성합니다
                    var polygon = new daum.maps.Polygon({
                        path : path,
                        strokeWeight : 2,
                        strokeColor : '#004c80',
                        strokeOpacity : 0.8,
                        fillColor : '#fff',
                        fillOpacity : 0.3
                    });

                    polygon.setMap(map);
                }
            </script>
</body>
</html>