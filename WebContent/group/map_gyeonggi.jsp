<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>소모임</title>
</head>
<style>
    @font-face {
        font-family: 'GowunDodum-Regular';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunDodum-Regular.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }
    body{
        margin: 0;
        padding: 0;
        min-width: 1190px;  /*브라우저 축소해도 요소가 깨지는것을 방지*/
        min-height: 650px;
        font-family: 'GowunDodum-Regular';
    }
    /*헤더*/
    header{
        min-width: 100%;
        height: 120px;
        display: flex;
        align-items: center;        /*가운데 정렬*/
        justify-content: center;    /*가운데 정렬*/
        -ms-user-select: none;      /*드래그 금지*/
        -moz-user-select: none;
        -khtml-user-select: none;
        -webkit-user-select: none;
        user-select: none;
    }
    /*네비바*/
    nav{
        background-color: rgb(173,175,255);
        width: 100%;
        height: 50px;
        display: flex;
        justify-content: center;
        -ms-user-select: none;
        -moz-user-select: none;
        -khtml-user-select: none;
        -webkit-user-select: none;
        user-select: none;
    }
    /*본문 X구역*/
    section{
        min-width: 1190px;
        display: flex;
        justify-content: center;
    }
    /*메뉴 리스트*/
    section .menuform{
        background-color: aliceblue;
        width: 210px;
        -ms-user-select: none;
        -moz-user-select: none;
        -khtml-user-select: none;
        -webkit-user-select: none;
        user-select: none;
    }
    /*채팅 구역*/
    section .chatform{
        min-width: 980px;
        min-height: 700px;
        display: flex;
        align-items: center;
        justify-content: center;
        -ms-user-select: none;
        -moz-user-select: none;
        -khtml-user-select: none;
        -webkit-user-select: none;
        user-select: none;
    }
    section .chatform #chat{
        min-width: 800px;
        min-height: 500px;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    /*푸터*/
    footer{
        background-color: rgb(233 233 236);
        min-width: 100%;
        min-height: 150px;
        display: flex;
        flex-wrap: wrap;
        align-items: center;
        justify-content: center;
        font-size: 15px;
        -ms-user-select: none;
        -moz-user-select: none;
        -khtml-user-select: none;
        -webkit-user-select: none;
        user-select: none;
    }
</style>
<script type="text/javascript">
    window.onload = function (){
        if(${userdto.user_id eq null}){
            alert("세션 만료");
            location.href='../main_controller.do?command=start';
        }
    }
</script>
<body>
<header>
    <%@ include file="../form/header.jsp"%>
</header>
<nav>
    <%@ include file="../form/navi.jsp"%>
</nav>
<section>
    <div class="menuform">
        <%@ include file="../form/group_menubar.jsp"%>
    </div>
    <div class="chatform">
        <div id="chat">
            <!-- 지도를 표시할 div 입니다 -->
            <div id="map" style="width:800px;height:380px;"></div>
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
                        center: new kakao.maps.LatLng(37.503641, 127.103692), // 지도의 중심좌표
                        level: 11 // 지도의 확대 레벨
                    };

                // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
                var map = new kakao.maps.Map(mapContainer, mapOption);

                // 지도에 표시할 원을 생성합니다
                var circle = new kakao.maps.Circle({
                    center : new kakao.maps.LatLng(37.510262635330534, 127.11217793851705),  // 원의 중심좌표 입니다
                    radius: 58000, // 미터 단위의 원의 반지름입니다
                    strokeWeight: 5, // 선의 두께입니다
                    strokeColor: '#75B8FA', // 선의 색깔입니다
                    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
                    fillColor: '#fff', // 채우기 색깔입니다
                    fillOpacity: 0.1  // 채우기 불투명도 입니다
                });

                // 지도에 원을 표시합니다
                circle.setMap(map);

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
                        fillOpacity : 0.8
                    });

                    polygon.setMap(map);
                }

                // // 지도에 표시할 원을 생성합니다
                // var seoul = new kakao.maps.Circle({
                //     center : new kakao.maps.LatLng(37.566262, 126.977856),  // 원의 중심좌표 입니다
                //     radius: 14000, // 미터 단위의 원의 반지름입니다
                //     strokeWeight: 5, // 선의 두께입니다
                //     strokeColor: '#75B8FA', // 선의 색깔입니다
                //     strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
                //     fillColor: '#CFE7FF', // 채우기 색깔입니다
                //     fillOpacity: 1  // 채우기 불투명도 입니다
                // });
                //
                // // 지도에 원을 표시합니다
                // seoul.setMap(map);

                // 맵 이동 금지
                   map.setDraggable(false);
                // 맵 확대 축소 금지
                   map.setZoomable(false);


                // 도서관 핀 생성
                var positions = [
                    {
                        content : '<div>고양시립 일산도서관</div>',
                        lating : new kakao.maps.LatLng(37.68498050529745, 126.76441755480296),
                        clickable: true
                    },
                    {
                        content : '<div>교문도서관</div>',
                        lating : new kakao.maps.LatLng(37.595121689318276, 127.13458920784721),
                        clickable: true
                    },
                    {
                        content : '<div>용인죽전도서관</div>',
                        lating : new kakao.maps.LatLng(37.33042618797159, 127.11863464591617),
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
                    location.href='../group_controller.do?command=group_border&gboard_region=GYEONGGI&gboard_library=A도서관';
                });
                kakao.maps.event.addListener(marker2, 'click', function() {
                    location.href='../group_controller.do?command=group_border&gboard_region=GYEONGGI&gboard_library=B도서관';
                });
                kakao.maps.event.addListener(marker3, 'click', function() {
                    location.href='../group_controller.do?command=group_border&gboard_region=GYEONGGI&gboard_library=C도서관';
                });

                var infowindow1 = new kakao.maps.InfoWindow({
                    position : new kakao.maps.LatLng(37.68498050529745, 126.76441755480296),
                    content : '<div>고양시립 일산도서관</div>'
                });

                var infowindow2 = new kakao.maps.InfoWindow({
                    position : new kakao.maps.LatLng(37.595121689318276, 127.13458920784721),
                    content : '<div>교문도서관</div>'
                });

                var infowindow3 = new kakao.maps.InfoWindow({
                    position : new kakao.maps.LatLng(37.33042618797159, 127.11863464591617),
                    content : '<div>용인죽전도서관</div>'
                });

                infowindow1.open(map, marker1);
                infowindow2.open(map, marker2);
                infowindow3.open(map, marker3);

            </script>
        </div>
    </div>
</section>
<footer>
    <%@ include file="../form/footer.jsp"%>
</footer>
</body>
</html>
