<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>이벤트 및 광고 신청 페이지</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicons -->
    <link rel="shortcut icon" href="resources/assets/img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="resources/assets/img/icon.png">

    <!-- ************************* CSS Files ************************* -->

    <!-- Vendor CSS -->
    <link rel="stylesheet" href="resources/assets/css/vendor.css">

    <!-- style css -->
    <link rel="stylesheet" href="resources/assets/css/main.css">
</head>

<body>
	<c:import url="../common/menubar.jsp"/>


   <!-- Main Wrapper Start -->
    <div class="wrapper">
                 

        <!-- Breadcrumb area Start -->
        <section class="page-title-area bg-image ptb--80" data-bg-image="assets/img/bg/1920X200.png">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center">
                        <h1 class="page-title">이벤트 및 광고</h1>
                        <ul class="breadcrumb">
                            <li><a href="<%=request.getContextPath() %>">Home</a></li>
                            <li class="current"><span>신청하기</span></li>
                            <li class="current"><span>이벤트 및 광고</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb area End -->

        <!-- Main Content Wrapper Start -->
        <main class="main-content-wrapper">
            <div class="inner-page-content pt--75 pt-md--55">
                <!-- Contact Area Start -->
                <section class="contact-area mb--75 mb-md--55">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-4 col-md-5 mb-sm--30">
                                <div class="heading mb--32">
                                    <h2>* 유의사항</h2>
                                    <hr class="delimeter">
                                </div>
                                <div class="contact-info mb--20">
                                    <p><i class="fa fa-map-marker"></i>유의사항1</p>
                                    <p><i class="fa fa-phone"></i>- 작성된 이벤트/광고는 공지사항 페이지에 게시됩니다.</p>
                                    <p><i class="fa fa-fax"></i>- 파일 크기는 ~ 까지 입니다. </p>
                                    <p><i class="fa fa-clock-o"></i>기타 문의사항은 QNA 게시판을 이용하세요.</p>
                                </div>
                                <div class="social">
                                    <a href="https://www.facebook.com" class="social__link">
                                        <i class="la la-facebook"></i>
                                    </a>
                                    <a href="https://www.twitter.com" class="social__link">
                                        <i class="la la-twitter"></i>
                                    </a>
                                    <a href="https://www.plus.google.com" class="social__link">
                                        <i class="la la-google-plus"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="col-md-7 offset-lg-1">
                                <div class="heading mb--40">
                                    <h2>이벤트 및 광고 신청하기</h2>
                                    <hr class="delimeter">
                                </div>
                                <form action="advertisementForm.do" class="form" id="contact-form" method="post" enctype="multipart/form-data">
                                    
                                    <!-- cNo, lCode 보내기 -->
                                   <input type="hidden" id="cNo" name="cNo" value="${loginUser.cNo}"/> 
                                   <input type="hidden" id="cAddress" value="${loginUser.cAddress}"/>
                                   <input type="hidden" id="lCode"  name="lCode"/>
                                   
                                    <div>작성자<input type="text" name="cName" id="cName" value="${cName}" class="form__input mb--30" readonly></div>
                                    <div>연락 받을 이메일<input type="email" name="cEmail" id="cEmail" value="${cEmail}" class="form__input mb--30" readonly></div>
                                    <div>이벤트/광고 제목<input type="text" name="aTitle" id="aTitle" class="form__input mb--30" placeholder="제목*" required></div>
									<div>게시 할 파일을 선택하세요 : &nbsp;&nbsp;
									<label for="aFile"></label><input type="file" id="aFile" name="aFile">								
                                    </div>
                                    <br><br>
                                    
                                    
                                    <c:choose>
                                      <c:when test="${ empty sessionScope.loginUser }">
                                      	<c:url var="userLogin" value="userLogin.do"/>	 
                                        <button type="submit" class="btn btn-shape-round form__submit" onclick="location.href='${userLogin}'">제출하기</button>
                                      </c:when>
                                      <c:otherwise>	
                                      
                                    <button type="submit" class="btn btn-shape-round form__submit" >제출하기</button>
                                    	
                                      </c:otherwise>
                                   	</c:choose>
                                </form>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Contact Area End -->
            </div>
        </main>
        <!-- Main Content Wrapper End -->

		<script>
		// cNo 보내기  & cAddress를 lCode로 바꿔 보내기
		$(function(){

			var cNo = $("#cNo").val();
			console.log('cNo=' + cNo);
			
			var cAddress = $('#cAddress').val(); 
			var lCode = $('#lCode').val();
			console.log('cAddress=' + cAddress);
			
			// 주소값이 '서울특별시'에  한정되었을 것으로 가정
			if(cAddress.indexOf('종로구')){
				lCode = 'L1';
			} else if (cAddress.indexOf('중구')) {
				lCode = 'L2';
			} else if (cAddress.indexOf('용산구')) {
				lCode = 'L3';
			} else if (cAddress.indexOf('성동구')) {
				lCode = 'L4';
			} else if (cAddress.indexOf('광진구')) {
				lCode = 'L5';
			} else if (cAddress.indexOf('동대문구')) {
				lCode = 'L6';
			} else if (cAddress.indexOf('중랑구')) {
				lCode = 'L7';
			} else if (cAddress.indexOf('성북구')) {
				lCode = 'L8';
			} else if (cAddress.indexOf('강북구')) {
				lCode = 'L9';
			} else if (cAddress.indexOf('노봉구')) {
				lCode = 'L10';
			} else if (cAddress.indexOf('노원구')) {
				lCode = 'L11';
			} else if (cAddress.indexOf('은평구')) {
				lCode = 'L12';
			} else if (cAddress.indexOf('서대문구')) {
				lCode = 'L13';
			} else if (cAddress.indexOf('마포구')) {
				lCode = 'L14';
			} else if (cAddress.indexOf('양천구')) {
				lCode = 'L15';
			} else if (cAddress.indexOf('강서구')) {
				lCode = 'L16';
			} else if (cAddress.indexOf('구로구')) {
				lCode = 'L17';
			} else if (cAddress.indexOf('금천구')) {
				lCode = 'L18';
			} else if (cAddress.indexOf('영등포구')) {
				lCode = 'L19';
			} else if (cAddress.indexOf('동작구')) {
				lCode = 'L20';
			} else if (cAddress.indexOf('관악구')) {
				lCode = 'L21';
			} else if (cAddress.indexOf('서초구')) {
				lCode = 'L22';
			} else if (cAddress.indexOf('강남구')) {
				lCode = 'L23';
			} else if (cAddress.indexOf('송파구')) {
				lCode = 'L24';
			} else {
				lCode = 'L25';
			} 
			
			console.log("lCode=" + lCode);
			
		});	
		</script>

		<c:import url="../common/footer.jsp"/>

    
        <!-- Global Overlay Start -->
        <div class="global-overlay"></div>
        <!-- Global Overlay End -->

        <!-- Global Overlay Start -->
        <a class="scroll-to-top" href=""><i class="la la-angle-double-up"></i></a>
        <!-- Global Overlay End -->
    </div>
    <!-- Main Wrapper End -->
 

    <!-- ************************* JS Files ************************* -->


    <!-- Google Map -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCxvP66_Xk1ts77oL2Z7EpDxhDD_jMg-D0"></script>
    <script>
        // When the window has finished loading create our google map below
        google.maps.event.addDomListener(window, 'load', init);

        function init() {
            // Basic options for a simple Google Map
            // For more options see: https://developers.google.com/maps/documentation/javascript/reference#MapOptions
            var mapOptions = {
                // How zoomed in you want the map to start at (always required)
                zoom: 12,

                scrollwheel: false,

                // The latitude and longitude to center the map (always required)
                center: new google.maps.LatLng(40.740610, -73.935242), // New York

                // How you would like to style the map. 
                // This is where you would paste any style found on

                styles: [{
                        "featureType": "water",
                        "elementType": "geometry",
                        "stylers": [{
                                "color": "#e9e9e9"
                            },
                            {
                                "lightness": 17
                            }
                        ]
                    },
                    {
                        "featureType": "landscape",
                        "elementType": "geometry",
                        "stylers": [{
                                "color": "#f5f5f5"
                            },
                            {
                                "lightness": 20
                            }
                        ]
                    },
                    {
                        "featureType": "road.highway",
                        "elementType": "geometry.fill",
                        "stylers": [{
                                "color": "#ffffff"
                            },
                            {
                                "lightness": 17
                            }
                        ]
                    },
                    {
                        "featureType": "road.highway",
                        "elementType": "geometry.stroke",
                        "stylers": [{
                                "color": "#ffffff"
                            },
                            {
                                "lightness": 29
                            },
                            {
                                "weight": 0.2
                            }
                        ]
                    },
                    {
                        "featureType": "road.arterial",
                        "elementType": "geometry",
                        "stylers": [{
                                "color": "#ffffff"
                            },
                            {
                                "lightness": 18
                            }
                        ]
                    },
                    {
                        "featureType": "road.local",
                        "elementType": "geometry",
                        "stylers": [{
                                "color": "#ffffff"
                            },
                            {
                                "lightness": 16
                            }
                        ]
                    },
                    {
                        "featureType": "poi",
                        "elementType": "geometry",
                        "stylers": [{
                                "color": "#f5f5f5"
                            },
                            {
                                "lightness": 21
                            }
                        ]
                    },
                    {
                        "featureType": "poi.park",
                        "elementType": "geometry",
                        "stylers": [{
                                "color": "#dedede"
                            },
                            {
                                "lightness": 21
                            }
                        ]
                    },
                    {
                        "elementType": "labels.text.stroke",
                        "stylers": [{
                                "visibility": "on"
                            },
                            {
                                "color": "#ffffff"
                            },
                            {
                                "lightness": 16
                            }
                        ]
                    },
                    {
                        "elementType": "labels.text.fill",
                        "stylers": [{
                                "saturation": 36
                            },
                            {
                                "color": "#333333"
                            },
                            {
                                "lightness": 40
                            }
                        ]
                    },
                    {
                        "elementType": "labels.icon",
                        "stylers": [{
                            "visibility": "off"
                        }]
                    },
                    {
                        "featureType": "transit",
                        "elementType": "geometry",
                        "stylers": [{
                                "color": "#f2f2f2"
                            },
                            {
                                "lightness": 19
                            }
                        ]
                    },
                    {
                        "featureType": "administrative",
                        "elementType": "geometry.fill",
                        "stylers": [{
                                "color": "#fefefe"
                            },
                            {
                                "lightness": 20
                            }
                        ]
                    },
                    {
                        "featureType": "administrative",
                        "elementType": "geometry.stroke",
                        "stylers": [{
                                "color": "#fefefe"
                            },
                            {
                                "lightness": 17
                            },
                            {
                                "weight": 1.2
                            }
                        ]
                    }
                ]
            };

            // Get the HTML DOM element that will contain your map 
            // We are using a div with id="map" seen below in the <body>
            var mapElement = document.getElementById('google-map');

            // Create the Google Map using our element and options defined above
            var map = new google.maps.Map(mapElement, mapOptions);

            // Let's also add a marker while we're at it
            var marker = new google.maps.Marker({
                position: new google.maps.LatLng(40.740610, -73.935242),
                map: map,
                title: 'Contixs',
                icon: "resources/assets/img/icons/marker.png",
                animation: google.maps.Animation.BOUNCE
            });
        }
    </script>
    <!-- jQuery JS -->
    <script src="resources/assets/js/vendor.js"></script>

    <!-- Main JS -->
    <script src="resources/assets/js/main.js"></script>
</body>

</html>
</html>