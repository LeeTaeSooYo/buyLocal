<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" charset="utf-8"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(function(){
		 $("#id").on("keyup", function(){
	            var userId = $(this).val().trim();
	            $("#idResult").text('');
	            
	            if(!(/^[a-z][a-z\d]{3,11}$/i.test($("#enrollForm input[name=cId]").val()))){
					$("#idResult").text("아이디는 영소문자로 시작해서 4~12자 입력(숫자 포함 가능)").css("color", "red");
					/* alert('아이디는 영소문자로 시작해서 4~12자 입력(숫자 포함 가능)'); */
					//$("#enrollForm input[name=cId]").select();
					return;
				}
		 });
			
		$("#pwd").on("keyup", function(){
				
				if ($("#pwd").val().length < 8) {
					$("#pwdResult").text("비밀번호는 8자 이상으로 설정해야 합니다.").css("color", "red");
					return;
				} else {
					$("#pwdResult").text("");
					return;	
				}
			});	


		$("#pwd2").on("keyup", function(){
				if($("#pwd").val() !== $("#pwd2").val()) {
					$("#pwd2Result").text("비밀번호 일치 여부를 다시 확인해주세요.").css("color", "red");
					/* $("#pwd").val("").focus(); */
					/* $("#pwd2").val(""); */
					return;	
				} else {
					$("#pwd2Result").text("");
					return;	
				}
		});
		
		// 아이디 중복 체크 
		$("#id").keyup(function() {
			$.ajax({
				url : "checkId.do",
				type : "POST",
				data : {
					cId : $("#id").val()
				},
				success : function(result) {
					if (result == 1) {
						alert('중복된 아이디가 있습니다. 다른 아이디를 입력해주세요.');
						/* $("#idCheck").html("중복된 아이디가 있습니다.");
						$("#joinBtn").attr("disabled", "disabled"); */
					} else {
					$("#idCheck").html("");
					$("#joinBtn").removeAttr("disabled");
					}
				},
			})
		});
		
		// 이메일 중복 체크 
		$("#email").keyup(function(){
			$.ajax({
				url : "checkEmail.do",
				type : "POST",
				data : {
					cEmail : $("#email").val()
				},
				success : function(result) {
					if (result >= 1) {
						// 여기다가 alert 추가하자
						alert('중복된 이메일 주소가 있습니다. 다른 이메일 주소를 입력해주세요.');
						/* $("#emailCheck").html(""); */
						/* $("#emailCheck").html("중복된 이메일이 있습니다."); */
					} else {
						$("#idCheck").html("");
						$("#joinBtn").removeAttr("disabled");
					}
				},
			})
		});
		
		
		// 사업자 번호 중복 체크
		$("#bShopNo").keyup(function() {
			$.ajax({
				url : "checkShopNo.do",
				type : "POST",
				data : {
					bShopNo : $("#bShopNo").val()
				},
				success : function(result) {
					if (result == 1) {
						alert('이미 등록된 사업자 번호입니다. 확인 후 다시 입력해주세요.');
					} else {
						$("#idCheck").html("");
						$("#joinBtn").removeAttr("disabled");
					}
				},
			})
		})
		
	});

</script>

<script>
     <c:if test="${!empty msg}">
        alert('${msg}');
        <c:remove var="msg"/>
     </c:if>
</script> 
<title>사업자 회원 가입</title>
<style>
	h5>a{
		cursor:pointer;
		float:left;
	}
	 
   
   #post, #address1, #address2, #bPost, #bAddress1, #bAddress2 {
   	height: 40px;
	padding-left: 10px;
	border: 1px solid #e5e5e5;
	border-radius: 4px;
   }
   
   #postcodify_search_button {
   	align: left;
   }
</style>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	
	

        <!-- Breadcrumb area Start -->
        <section class="page-title-area bg-image ptb--80" data-bg-image="resources/assets/img/bg/page_title_bg.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center">
                        <h1 class="page-title">회원가입</h1>
                        <ul class="breadcrumb">
                            <li><a href="index.html">Home</a></li>
                            <li class="current"><span>회원가입</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb area End -->



        <!-- Main Content Wrapper Start -->
        <div class="main-content-wrapper">
            <div class="page-content-inner ptb--80 ptb-md--60 pb-sm--55">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                           <div class="user-dashboard-tab flex-column flex-md-row">
                                <div class="user-dashboard-tab__content tab-content">
                                    <div class="tab-pane fade show active" id="accountdetails" style="margin-left: 260px">
                                    	<h3 align="center">사업자 회원 가입</h3>
                                    	<hr><br>
                                    	
                                        <form action="binsert.do" method="post" 
                                        class="form form--account" id="enrollForm" name="enrollForm">
                                        <!-- 테이블로 다시 짜기 -->
                                        <table class="customerErollForm" width="700px" align="center" style="table-layout: fixed">
                                        	<tr>
                                        		<td>
                                        			<label class="form__label" for="userId">아이디 <span class="required">*</span></label>
                                        		</td>
                                        		<td width="400px">
                                                    <input type="text" name="cId" id="id" class="form__input" placeholder="영소문자로 시작하는 4~12자를 입력해주세요." required>
                                               		<span class="form__notes"><em id="idResult"></em></span>
                                               	</td>
                                               	<td></td>
                                            </tr>
                                            <tr>
                                                <td width="">
                                                	<label class="form__label" for="userPwd">비밀번호 <span class="required">*</span></label>
                                                </td>
                                                <td>    
                                                    <input type="password" name="cPwd" id="pwd" class="form__input" placeholder="" required>
                                                	<span class="form__notes"><em id="pwdResult"></em></span>
                                                </td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                            	<td width="">
                                                	<label class="form__label" for="pwd2">비밀번호 확인 <span class="required">*</span></label>
                                                </td>
                                                <td>    
                                                    <input type="password" name="cPwd2" id="pwd2" class="form__input" placeholder="" required>
                                                	<span class="form__notes"><em id="pwd2Result"></em></span>
                                                </td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                        		<td width="">
                                        			<label class="form__label" for="userName">이름 <span class="required">*</span></label>
                                        		</td>
                                        		<td>
                                                    <input type="text" name="cName" id="userName" class="form__input" required>
                                               	</td>
                                               	<td></td>
                                            </tr>
                                            <tr>
                                        		<td>
                                        			<label class="form__label" for="email">이메일 주소 <span class="required">*</span></label>
                                        		</td>
                                        		<td>
                                                    <input type="email" name="cEmail" id="email" class="form__input" required>
                                                    <span id="emailCheck" class="form__notes"></span>
                                               	</td>
                                               	<td></td>
                                            </tr>
                                            <tr>
                                        		<td width="">
                                        			<label class="form__label" for="phone">전화번호 <span class="required">*</span></label>
                                        		</td>
                                        		<td>
                                                    <input type="text" name="cPhone" id="phone" class="form__input" required>
                                               	</td>
                                               	<td></td>
                                            </tr>
                                            <tr>
								               <td width="">
                                        			<label class="form__label" for="post">우편 번호 <span class="required">*</span></label>
                                        		</td>
								               <td>
								                  <input type="text" id="post" name="post" class="postcodify_postcode5" value="" size="15" required/>
								                  <input type="button" onclick="sample66_execDaumPostcode()" value="우편번호 찾기" class="btn btn-size-sm"><br>
								               </td>
								            </tr>
								            <tr>
								               <td width="">
                                        			<label class="form__label" for="address1">도로명 주소 <span class="required">*</span></label>
                                        		</td>
								               <td>
								                  <input type="text" id="address1" name="address1" class="postcodify_address" value="" size="30" required/>
								               </td>
								               <td></td>
								            </tr>
								            <tr>
								               <td width="">
                                        			<label class="form__label" for="address2">상세 주소 <span class="required">*</span></label>
                                        		</td>
								               <td>
								                  <input type="text" id="address2" name="address2" class="postcodify_extra_info" value="" size="30" required/>
								               </td>
								               <td></td>
								            </tr>
								             </table>
								             
								             <!-- 사업자 정보 입력 폼 시작 -->
								          	<hr>  
								          
								            <table class="sellerErollForm" width="700px" align="center" style="table-layout: fixed">
                                        	<tr>
                                        		<td width="">
                                        			<label class="form__label" for="bShopNo">사업자 번호<span class="required">*</span></label>
                                        		</td>
                                        		<td width="400px">
                                                    <input type="text" name="bShopNo" id="bShopNo" class="form__input" placeholder="-없이 입력해주세요." required>
                                                    <!-- 중복 확인 추가 부분 -->
                                                    <!-- <span class="form__notes" id="guideError2"><em>이 사업자 번호는 사용할 수 없습니다.</em></span> -->
                                               		<!-- <input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0"> -->
                                               	</td>
                                               	<td></td>
                                            </tr>
                                            <tr>
                                                <td width="">
                                                	<label class="form__label" for="bShopName">상호명 <span class="required">*</span></label>
                                                </td>
                                                <td>    
                                                    <input type="text" name="bShopName" id="bShopName" class="form__input" placeholder="" required>
                                                </td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                            	<td width="">
                                                	<label class="form__label" for="bClass">업종 <span class="required">*</span></label>
                                                </td>
                                                <td>    
                                                    <input type="text" name="bClass" id="bClass" class="form__input" placeholder="" required>
                                                </td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                        		<td width="">
                                        			<label class="form__label" for="bDetailClass">업태 <span class="required">*</span></label>
                                        		</td>
                                        		<td>
                                                    <input type="text" name="bDetailClass" id="bDetailClass" class="form__input" placeholder="" required>
                                               	</td>
                                               	<td></td>
                                            </tr>
                                            <tr>
                                        		<td width="">
                                        			<label class="form__label" for="bOwner">대표자 이름 <span class="required">*</span></label>
                                        		</td>
                                        		<td>
                                                    <input type="text" name="bOwner" id="bOwner" class="form__input" required>
                                               	</td>
                                               	<td></td>
                                            </tr>
                                            <tr>
                                        		<td width="">
                                        			<label class="form__label" for="bPic">담당자 연락처 <span class="required">*</span></label>
                                        		</td>
                                        		<td>
                                                    <input type="text" name="bPic" id="bPic" class="form__input" required>
                                               	</td>
                                               	<td></td>
                                            </tr>
                                            <tr>
								               <td width="">
                                        			<label class="form__label" for="bPost">우편 번호 <span class="required">*</span></label>
                                        		</td>
								               <td>
								                  <input type="text" id="bPost" name="bPost" class="postcodify_postcode5" value="" size="15" required/>
								                  <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-size-sm"><br>
								               </td>
								            </tr>
								            <tr>
								               <td width="">
                                        			<label class="form__label" for="bAddress1">도로명 주소 <span class="required">*</span></label>
                                        		</td>
								               <td>
								                  <input type="text" id="bAddress1" name="bAddress1" class="postcodify_address" value="" size="30" required/>
								               </td>
								               <td></td>
								            </tr>
								            <tr>
								               <td width="">
                                        			<label class="form__label" for="bAddress2">상세 주소 <span class="required">*</span></label>
                                        		</td>
								               <td>
								                  <input type="text" id="bAddress2" name="bAddress2" class="postcodify_extra_info" value="" size="30" required/>
								               </td>
								               <td></td>
								            </tr>
								            <tr>
									            <td colspan="3" align="center">
									            	<input type="submit" value="회원가입" class="btn btn-size-sm" id="joinBtn">
									            </td>
								            </tr>
                               				 </table>
                               				 
									
								 
                                         
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Main Content Wrapper Start -->


























        <!-- Footer Start-->
        <footer class="footer bg-color" data-bg-color="#f4f8fa">
            <div class="footer-top">
                <div class="container-fluid">
                    <div class="row border-bottom pt--70 pb--70">
                        <div class="col-lg-3 col-sm-6 offset-md-1 offset-lg-0 mb-md--45">
                            <div class="footer-widget">
                                <div class="textwidget">
                                    <figure class="footer-logo mb--30">
                                        <img src="assets/img/logo/logo.png" alt="Logo">
                                    </figure>
                                    <p>On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms. </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-sm-3 offset-lg-1 offset-sm-2 mb-md--45">
                            <div class="footer-widget">
                                <h3 class="widget-title mb--35 mb-sm--20">Company</h3>
                                <div class="footer-widget">
                                    <ul class="footer-menu">
                                        <li><a href="index.html">About Us</a></li>
                                        <li><a href="blog.html">Blogs</a></li>
                                        <li><a href="#">Careers</a></li>
                                        <li><a href="contact-us.html">Contact</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-sm-4 offset-md-1 offset-lg-0 mb-xs--45">
                            <div class="footer-widget">
                                <h3 class="widget-title mb--35 mb-sm--20">Product</h3>
                                <div class="footer-widget">
                                    <ul class="footer-menu">
                                        <li><a href="#">Pricing</a></li>
                                        <li><a href="#">Features</a></li>
                                        <li><a href="#">Customers</a></li>
                                        <li><a href="#">Demos</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-sm-4 mb-xs--45">
                            <div class="footer-widget">
                                <h3 class="widget-title mb--35 mb-sm--20">Helps</h3>
                                <div class="footer-widget">
                                    <ul class="footer-menu">
                                        <li><a href="#">Introduction</a></li>
                                        <li><a href="#">Feedback</a></li>
                                        <li><a href="#">Referals</a></li>
                                        <li><a href="#">Network Status</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-3 col-sm-4">
                            <div class="footer-widget">
                                <h3 class="widget-title mb--35 mb-sm--20">Social Network</h3>
                                <div class="footer-widget">
                                    <ul class="footer-menu">
                                        <li><a href="#">Facebook</a></li>
                                        <li><a href="#">Twitter</a></li>
                                        <li><a href="#">Linkedin</a></li>
                                        <li><a href="#">Google +</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-middle ptb--40">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-11">
                            <div class="footer-widget">
                                <div class="taglist">
                                    <span>Tags:</span>
                                    <a href="#">Minimal eCommerce</a>
                                    <a href="#">Marketing</a>
                                    <a href="#">User Exprience</a>
                                    <a href="#">Ali Express</a>
                                    <a href="#">Web</a>
                                    <a href="#">Digital Expo</a>
                                    <a href="#">Web Search</a>
                                    <a href="#">Affiliate</a>
                                    <a href="#">UCWeb</a>
                                    <a href="#">Support</a>
                                    <a href="#">Template</a>
                                    <a href="#">Best Queality</a>
                                    <a href="#">Mobile</a>
                                    <a href="#">24 Support</a>
                                    <a href="#">Ali Express</a>
                                    <a href="#">Web</a>
                                    <a href="#">Laptop</a>
                                    <a href="#">Web Search</a>
                                    <a href="#">Affiliate</a>
                                    <a href="#">Photoshop</a>
                                    <a href="#">Support</a>
                                    <a href="#">Template</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <div class="container-fluid">
                    <div class="row border-top ptb--20">
                        <div class="col-12 text-center">
                            <p class="copyright-text">Beck &copy; 2019 all rights reserved</p>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer End-->

        <!-- OffCanvas Menu Start -->
        <div class="offcanvas-menu-wrapper" id="offcanvasMenu">
            <div class="offcanvas-menu-inner">
                <a href="" class="btn-close">
                    <i class="la la-remove"></i>
                </a>
                <nav class="offcanvas-navigation">
                    <ul class="offcanvas-menu">
                        <li class="menu-item-has-children active">
                            <a href="#">Home</a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="index.html">Homepage 01</a>
                                </li>
                                <li>
                                    <a href="index-02.html">Homepage 02</a>
                                </li>
                            </ul>
                        </li>
                        <li class="menu-item-has-children">
                            <a href="shop.html">Shop</a>
                            <ul class="sub-menu">
                                <li class="menu-item-has-children">
                                    <a href="#">
                                        <span class="mm-text">Shop Grid</span>
                                    </a>
                                    <ul class="sub-menu">
                                        <li>
                                            <a href="shop-fullwidth.html">Full Width</a>
                                        </li>
                                        <li>
                                            <a href="shop.html">Left Sidebar</a>
                                        </li>
                                        <li>
                                            <a href="shop-right-sidebar.html">Right Sidebar</a>
                                        </li>
                                        <li>
                                            <a href="shop-three-columns.html">Three Columns</a>
                                        </li>
                                        <li>
                                            <a href="shop-four-columns.html">Four Columns</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="#">Shop List</a>
                                    <ul class="sub-menu">
                                        <li>
                                            <a href="shop-list.html">Full Width</a>
                                        </li>
                                        <li>
                                            <a href="shop-list-sidebar.html">Left Sidebar</a>
                                        </li>
                                        <li>
                                            <a href="shop-list-right-sidebar.html">Right Sidebar</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="#">Product Details</a>
                                    <ul class="sub-menu">
                                        <li>
                                            <a href="product-details.html">Tab Style 1</a>
                                        </li>
                                        <li>
                                            <a href="product-details-tab-style-2.html">Tab Style 2</a>
                                        </li>
                                        <li>
                                            <a href="product-details-tab-style-3.html">Tab Style 3</a>
                                        </li>
                                        <li>
                                            <a href="product-details-gallery-left.html">Gallery Left</a>
                                        </li>
                                        <li>
                                            <a href="product-details-gallery-right.html">Gallery Right</a>
                                        </li>
                                        <li>
                                            <a href="product-details-sticky-left.html">Sticky Left</a>
                                        </li>
                                        <li>
                                            <a href="product-details-sticky-right.html">Sticky Right</a>
                                        </li>
                                        <li>
                                            <a href="product-details-slider-box.html">Slider Box</a>
                                        </li>
                                        <li>
                                            <a href="product-details-slider-full-width.html">Slider Box Full Width</a>
                                        </li>
                                        <li>
                                            <a href="product-details-affiliate.html">Affiliate Proudct</a>
                                        </li>                                                    
                                        <li>
                                            <a href="product-details-variable.html">Variable Proudct</a>
                                        </li>
                                        <li>
                                            <a href="product-details-group.html">Group Product</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class="menu-item-has-children">
                            <a href="blog.html">Blog</a>
                            <ul class="sub-menu">
                                <li class="menu-item-has-children">
                                    <a href="#">Blog</a>
                                    <ul class="sub-menu">
                                        <li>
                                            <a href="blog-left-sidebar.html">Blog Left Sidebar</a>
                                        </li>
                                        <li>
                                            <a href="blog.html">Blog Right Sidebar</a>
                                        </li>
                                        <li>
                                            <a href="blog-01-column.html">Blog 01 column</a>
                                        </li>
                                        <li>
                                            <a href="blog-02-columns.html">Blog 02 columns</a>
                                        </li>
                                        <li>
                                            <a href="blog-03-columns.html">Blog 03 columns</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="#">Blog Details</a>
                                    <ul class="sub-menu">
                                        <li>
                                            <a href="blog-details-audio.html">Audio Blog Details</a>
                                        </li>
                                        <li>
                                            <a href="blog-details-gallery.html">Gallery Blog Details</a>
                                        </li>
                                        <li>
                                            <a href="blog-details-image.html">image Blog Details</a>
                                        </li>
                                        <li>
                                            <a href="blog-details-video.html">Video Blog Details</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class="menu-item-has-children">
                            <a href="#">Pages</a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="my-account.html">My Account</a>
                                </li>
                                <li>
                                    <a href="checkout.html">Checkout</a>
                                </li>
                                <li>
                                    <a href="cart.html">Cart</a>
                                </li>
                                <li>
                                    <a href="compare.html">Compare</a>
                                </li>
                                <li>
                                    <a href="order-tracking.html">Track Order</a>
                                </li>
                                <li>
                                    <a href="wishlist.html">Wishlist</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="contact-us.html">Contact Us</a>
                        </li>
                    </ul>
                    <div class="site-info vertical">
                        <div class="site-info__item">
                            <a href="tel:+01223566678"><strong>+01 2235 666 78</strong></a>
                            <a href="mailto:Support@contixs.com">Support@furtrate.com</a>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- OffCanvas Menu End -->

        <!-- Mini Cart Start -->
        
        <!-- Mini Cart End -->

        <!-- Searchform Popup Start -->
        
        <!-- Searchform Popup End -->

        <!-- Qicuk View Modal Start -->
        <div class="modal fade product-modal" id="productModal" tabindex="-1" role="dialog" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-body">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true"><i class="la la-remove"></i></span>
                </button>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="element-carousel slick-vertical-center"
                        data-slick-options='{
                            "slidesToShow": 1,
                            "slidesToScroll": 1,
                            "arrows": true,
                            "prevArrow": {"buttonClass": "slick-btn slick-prev", "iconClass": "la la-angle-double-left" },
                            "nextArrow": {"buttonClass": "slick-btn slick-next", "iconClass": "la la-angle-double-right" }
                        }'
                        >
                            <div class="product-image">
                                <div class="product-image--holder">
                                    <a href="product-details.html">
                                        <img src="assets/img/products/prod-01.jpg" alt="Product Image" class="primary-image">
                                    </a>
                                </div>
                                <span class="product-badge sale">sale</span>
                            </div>
                            <div class="product-image">
                                <div class="product-image--holder">
                                    <a href="product-details.html">
                                        <img src="assets/img/products/prod-02.jpg" alt="Product Image" class="primary-image">
                                    </a>
                                </div>
                                <span class="product-badge sale">sale</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="modal-box product-summary">
                            <div class="product-navigation text-right mb--20">
                                <a href="#" class="prev"><i class="la la-angle-double-left"></i></a>
                                <a href="#" class="next"><i class="la la-angle-double-right"></i></a>
                            </div>
                            <div class="product-rating d-flex mb--20">
                                <div class="star-rating star-three">
                                    <span>Rated <strong class="rating">5.00</strong> out of 5</span>
                                </div>
                            </div>
                            <h3 class="product-title mb--20">Golden Easy Spot Chair.</h3>
                            <p class="product-short-description mb--25">Donec accumsan auctor iaculis. Sed suscipit arcu ligula, at egestas magna molestie a. Proin ac ex maximus, ultrices justo eget, sodales orci. Aliquam egestas libero ac turpis pharetra, in vehicula lacus scelerisque. Vestibulum ut sem laoreet, feugiat tellus at, hendrerit arcu.</p>
                            <div class="product-price-wrapper mb--25">
                                <span class="money">$200.00</span>
                                <span class="price-separator">-</span>
                                <span class="money">$400.00</span>
                            </div>
                            <form action="#" class="variation-form mb--30">
                                <div class="product-color-variations d-flex align-items-center mb--20">
                                    <p class="variation-label">Color:</p>
                                    <div class="product-color-variation variation-wrapper">
                                        <div class="variation">
                                            <a class="product-color-variation-btn red selected" data-toggle="tooltip" data-placement="top" title="Red">
                                                <span class="product-color-variation-label">Red</span>
                                            </a>
                                        </div>
                                        <div class="variation">
                                            <a class="product-color-variation-btn black" data-toggle="tooltip" data-placement="top" title="Black">
                                                <span class="product-color-variation-label">Black</span>
                                            </a>
                                        </div>
                                        <div class="variation">
                                            <a class="product-color-variation-btn pink" data-toggle="tooltip" data-placement="top" title="Pink">
                                                <span class="product-color-variation-label">Pink</span>
                                            </a>
                                        </div>
                                        <div class="variation">
                                            <a class="product-color-variation-btn blue" data-toggle="tooltip" data-placement="top" title="Blue">
                                                <span class="product-color-variation-label">Blue</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-size-variations d-flex align-items-center mb--15">
                                    <p class="variation-label">Size:</p>   
                                    <div class="product-size-variation variation-wrapper">
                                        <div class="variation">
                                            <a class="product-size-variation-btn selected" data-toggle="tooltip" data-placement="top" title="S">
                                                <span class="product-size-variation-label">S</span>
                                            </a>
                                        </div>
                                        <div class="variation">
                                            <a class="product-size-variation-btn" data-toggle="tooltip" data-placement="top" title="M">
                                                <span class="product-size-variation-label">M</span>
                                            </a>
                                        </div>
                                        <div class="variation">
                                            <a class="product-size-variation-btn" data-toggle="tooltip" data-placement="top" title="L">
                                                <span class="product-size-variation-label">L</span>
                                            </a>
                                        </div>
                                        <div class="variation">
                                            <a class="product-size-variation-btn" data-toggle="tooltip" data-placement="top" title="XL">
                                                <span class="product-size-variation-label">XL</span>
                                            </a>
                                        </div>
                                    </div>                                 
                                </div>
                                <a href="" class="reset_variations">Clear</a>
                            </form>
                            <div class="product-action d-flex flex-sm-row flex-column align-items-sm-center align-items-start mb--30">
                                <div class="quantity-wrapper d-flex align-items-center mr--30 mr-xs--0 mb-xs--30">
                                    <label class="quantity-label" for="quick-qty">Quantity:</label>
                                    <div class="quantity">
                                        <input type="number" class="quantity-input" name="qty" id="quick-qty" value="1" min="1">
                                    </div>
                                </div>
                                <button type="button" class="btn btn-size-sm btn-shape-square" onclick="window.location.href='cart.html'">
                                    Add To Cart
                                </button>
                            </div>  
                            <div class="product-footer-meta">
                                <p><span>Category:</span>
                                    <a href="shop.html">Full Sweater</a>,
                                    <a href="shop.html">SweatShirt</a>,
                                    <a href="shop.html">Jacket</a>,
                                    <a href="shop.html">Blazer</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- Qicuk View Modal End -->

        <!-- Global Overlay Start -->
        <div class="global-overlay"></div>
        <!-- Global Overlay End -->

        <!-- Global Overlay Start -->
        <a class="scroll-to-top" href=""><i class="la la-angle-double-up"></i></a>
        <!-- Global Overlay End -->
    </div>
    <!-- Main Wrapper End -->
 

    <!-- ************************* JS Files ************************* -->

    <!-- jQuery JS -->
    <script src="assets/js/vendor.js"></script>

    <!-- Main JS -->
    <script src="assets/js/main.js"></script>
	 
	<!-- 우편번호 검색 관련 // jQuery와 Postcodify를 로딩한다 -->
    <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
    <!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->
    <script> 
      $(function() { 
         $("#postcodify_search_button").postcodifyPopUp(); 
      }); 
    </script>
    
    <!-- 회원 주소 검색용 카카오 api 스크립트 -->
	<script>
	    function sample66_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("address2").value = extraAddr;
	                
	                } else {
	                    document.getElementById("address2").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('post').value = data.zonecode;
	                document.getElementById("address1").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("address2").focus();
	            }
	        }).open();
	    }
	</script>
    
    <!-- 사업자 주소 검색용 카카오 api 스크립트 -->
	<script>
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("bAddress2").value = extraAddr;
	                
	                } else {
	                    document.getElementById("bAddress2").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('bPost').value = data.zonecode;
	                document.getElementById("bAddress1").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("bAddress2").focus();
	            }
	        }).open();
	    }
	</script>
          
</body> 
</html>